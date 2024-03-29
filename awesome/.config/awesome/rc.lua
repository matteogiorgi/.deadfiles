-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")


-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")


-- Widget and layout library
local wibox = require("wibox")


-- Theme handling library
local beautiful = require("beautiful")


-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")


-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")


-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({
            preset = naughty.config.presets.critical,
            title = "Oops, there were errors during startup!",
            text = awesome.startup_errors
    })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal(
        "debug::error",
        function (err)
            -- Make sure we don't go into an endless error loop
            if in_error then return end
            in_error = true
            naughty.notify({
                    preset = naughty.config.presets.critical,
                    title = "Oops, an error happened!",
                    text = tostring(err)
            })
            in_error = false
        end)
end
-- }}}


-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
-- beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")
beautiful.init("~/.config/awesome/themes/doom/theme.lua")

-- This is used later as the default terminal and editor to run.
terminal = "alacritty"
editor = os.getenv("EDITOR") or "vim"
editor_cmd = terminal .. " -e " .. editor

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
    -- awful.layout.suit.tile,
    -- awful.layout.suit.tile.left,
    -- awful.layout.suit.tile.bottom,
    -- awful.layout.suit.tile.top,
    -- awful.layout.suit.fair,
    -- awful.layout.suit.fair.horizontal,
    -- awful.layout.suit.spiral,
    -- awful.layout.suit.spiral.dwindle,
    -- awful.layout.suit.max.fullscreen,
    -- awful.layout.suit.corner.ne,
    -- awful.layout.suit.corner.sw,
    -- awful.layout.suit.corner.se,
    awful.layout.suit.max,
    awful.layout.suit.magnifier,
    awful.layout.suit.corner.nw,
    awful.layout.suit.floating }
-- }}}


-- Keyboard map indicator and switcher
kbdcfg = {}
kbdcfg.cmd = "setxkbmap"
kbdcfg.layout = {
    { "gb", "" , "gb" },
    { "it", "" , "it" },
    { "us", "" , "us" }
}
kbdcfg.current = 1
kbdcfg.widget = wibox.widget.textbox()
kbdcfg.widget:set_text(" " .. kbdcfg.layout[kbdcfg.current][3] .. " ")
kbdcfg.switch =
    function ()
        kbdcfg.current = kbdcfg.current % #(kbdcfg.layout) + 1
        local t = kbdcfg.layout[kbdcfg.current]
        kbdcfg.widget:set_text(" " .. t[3] .. " ")
        os.execute( kbdcfg.cmd .. " " .. t[1] .. " " .. t[2] )
    end


 -- Mouse bindings
kbdcfg.widget:buttons(awful.util.table.join(awful.button({ }, 1,
            function ()
                kbdcfg.switch()
                awful.spawn.with_shell("xmodmap ~/.Xmodmap")
            end)))

mykeyboardlayout = kbdcfg.widget


-- {{{ Wibar
-- Create a textclock (and calendar) widget
mytextclock = wibox.widget.textclock(' %H:%M')
local calendar = require("calendar")
calendar({}):attach(mytextclock)

-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
    awful.button({ }, 1, function(t) t:view_only() end),
    awful.button({ modkey }, 1,
        function(t)
            if client.focus then
                client.focus:move_to_tag(t)
            end
        end),
    awful.button({ }, 3, awful.tag.viewtoggle),
    awful.button({ modkey }, 3,
        function(t)
            if client.focus then
                client.focus:toggle_tag(t)
            end
        end),
    awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
    awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end))

local tasklist_buttons = gears.table.join(
    awful.button({ }, 1,
        function (c)
            if c == client.focus then
                c.minimized = true
            else
                c:emit_signal(
                    "request::activate",
                    "tasklist",
                    { raise = true })
            end
        end),
    awful.button({ }, 3, function() awful.menu.client_list({ theme = { width = 250 } }) end),
    awful.button({ }, 4, function() awful.client.focus.byidx(1) end),
    awful.button({ }, 5, function() awful.client.focus.byidx(-1) end))


-- Battery widget
local battery_widget = require("battery-widget")
local BAT0 = battery_widget {
    ac = "AC",
    adapter = "BAT0",
    ac_prefix = " ",
    battery_prefix = " ",
    percent_colors = {
        { 20, "#ff6e6e" },
        { 50, "#ffffa5" },
        { 999, "#69ff94" }
    },
    listen = true,
    timeout = 10,
    widget_text = "${AC_BAT}${color_on}${percent}%${color_off}",
    widget_font = "mononoki Nerd Font 9",
    tooltip_text = "Battery ${state}${time_est}\nCapacity: ${capacity_percent}%",
    alert_threshold = 5,
    alert_timeout = 0,
    alert_title = "Low battery !",
    alert_text = "${AC_BAT}${time_est}"
}


-- Volume widget
local volume_control = require("volume-control")
volumecfg = volume_control({
        device = nil,
        cardid = nil,
        channel = "Master",
        step = '5%',
        lclick = "toggle",
        mclick = "pavucontrol",
        rclick = "pavucontrol",
        listen = false,
        widget = nil,
        font = nil,
        callback = nil,
        widget_text = {
            on = '% 3d±',
            off = ' mute'
        },
        tooltip_text = [[
            Volume: ${volume}% ${state}
            Channel: ${channel}
            Device: ${device}
            Card: ${card}
        ]] })


awful.screen.connect_for_each_screen(
    function(s)
        -- Each screen has its own tag table.
        awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])

        -- Create a promptbox for each screen
        s.mypromptbox = awful.widget.prompt({
                prompt = '$ ',
                fg = "#95a4df",
                fg_cursor = "#ff6e6e",
                bg_cursor = "#1e1f29" })

        -- Create an imagebox widget which will contain an icon indicating which layout we're using.
        -- We need one layoutbox per screen.
        s.mylayoutbox = awful.widget.layoutbox(s)
        s.mylayoutbox:buttons(gears.table.join(
                awful.button({ }, 1, function () awful.layout.inc( 1) end),
                awful.button({ }, 3, function () awful.layout.inc(-1) end),
                awful.button({ }, 4, function () awful.layout.inc( 1) end),
                awful.button({ }, 5, function () awful.layout.inc(-1) end)))

        -- Create a taglist widget
        s.mytaglist = awful.widget.taglist {
            screen = s,
            filter = awful.widget.taglist.filter.all,
            buttons = taglist_buttons
        }

        -- Create a tasklist widget
        s.mytasklist = awful.widget.tasklist {
            screen = s,
            filter = awful.widget.tasklist.filter.currenttags,
            buttons = tasklist_buttons,
            layout = {
                spacing = 5,
                layout = wibox.layout.flex.horizontal
            },
            widget_template = {
                {
                    {
                        {
                            {
                                id = 'icon_role',
                                widget = wibox.widget.imagebox,
                            },
                            margins = 3,
                            widget = wibox.container.margin,
                        },
                        {
                            id = 'text_role',
                            widget = wibox.widget.textbox,
                        },
                        layout = wibox.layout.fixed.horizontal,
                    },
                    left = 10,
                    right = 10,
                    widget = wibox.container.margin
                },
                id = 'background_role',
                widget = wibox.container.background,
            },
        }
        -- Create a systray
        s.systray = wibox.widget.systray()
        s.systray.visible = false

        -- Create the wibox
        s.mywibox = awful.wibar({
                position = "top",
                screen = s,
                height = 18,
                opacity = 1.0,
                border_width = 0 })

        -- Add widgets to the wibox
        s.mywibox:setup {
            -- All widgets
            layout = wibox.layout.align.horizontal,

            -- Left widgets
            {
                layout = wibox.layout.fixed.horizontal,
                s.mypromptbox,
                s.mytaglist
            },

            -- Middle widget
            {
                layout = wibox.layout.fixed.horizontal,
                wibox.container.constraint(s.mytasklist, "exact", s.workarea.width)
            },

            -- Right widgets
            {
                layout = wibox.layout.fixed.horizontal,
                s.systray,
                volumecfg.widget,
                mykeyboardlayout,
                s.mylayoutbox,
                BAT0,
                mytextclock
            }
        }
    end)
-- }}}


-- {{{ Mouse bindings
root.buttons(
    gears.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)))
-- }}}


-- {{{ Key bindings
globalkeys = gears.table.join(
    awful.key({ modkey }, "s", hotkeys_popup.show_help, { description = "show help", group = "awesome" }),
    awful.key({ modkey }, "Left", awful.tag.viewprev, { description = "view previous", group = "tag" }),
    awful.key({ modkey }, "Right", awful.tag.viewnext, { description = "view next", group = "tag" }),
    awful.key({ modkey }, "Escape", awful.tag.history.restore, { description = "go back", group = "tag" }),
    awful.key({ modkey }, "j", function() awful.client.focus.byidx(1) end, { description = "focus next by index", group = "client" }),
    awful.key({ modkey }, "k", function() awful.client.focus.byidx(-1) end, { description = "focus previous by index", group = "client" }),

    -- Layout manipulation
    awful.key({ modkey, "Shift" }, "j", function() awful.client.swap.byidx(1) end, { description = "swap with next client by index", group = "client" }),
    awful.key({ modkey, "Shift" }, "k", function() awful.client.swap.byidx(-1) end, { description = "swap with previous client by index", group = "client" }),
    awful.key({ modkey, "Control" }, "j", function() awful.screen.focus_relative(1) end, { description = "focus the next screen", group = "screen" }),
    awful.key({ modkey, "Control" }, "k", function() awful.screen.focus_relative(-1) end, { description = "focus the previous screen", group = "screen" }),
    awful.key({ modkey }, "u", awful.client.urgent.jumpto, { description = "jump to urgent client", group = "client" }),
    awful.key({ modkey }, "Tab",
        function()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        { description = "go back", group = "client" }),

    -- Standard program
    awful.key({ modkey }, "Return", function() awful.spawn(terminal) end, { description = "open a terminal", group = "launcher" }),
    awful.key({ modkey, "Control" }, "r", awesome.restart, { description = "reload awesome", group = "awesome" }),
    awful.key({ modkey, "Shift" }, "q", awesome.quit, { description = "quit awesome", group = "awesome" }),
    awful.key({ modkey }, "l", function() awful.tag.incmwfact( 0.05) end, { description = "increase master width factor", group = "layout" }),
    awful.key({ modkey }, "h", function() awful.tag.incmwfact(-0.05) end, { description = "decrease master width factor", group = "layout" }),
    awful.key({ modkey, "Shift" }, "h", function() awful.tag.incnmaster(1, nil, true) end, { description = "increase the number of master clients", group = "layout" }),
    awful.key({ modkey, "Shift" }, "l", function() awful.tag.incnmaster(-1, nil, true) end, { description = "decrease the number of master clients", group = "layout" }),
    awful.key({ modkey, "Control" }, "h", function() awful.tag.incncol(1, nil, true) end, { description = "increase the number of columns", group = "layout" }),
    awful.key({ modkey, "Control" }, "l", function() awful.tag.incncol(-1, nil, true) end, { description = "decrease the number of columns", group = "layout" }),
    awful.key({ modkey }, "space", function() awful.layout.inc(1) end, { description = "select next", group = "layout" }),
    awful.key({ modkey, "Shift" }, "space", function() awful.layout.inc(-1) end, { description = "select previous", group = "layout" }),
    awful.key({ modkey, "Control" }, "n",
        function()
            local c = awful.client.restore()
            -- Focus restored client
            if c then
                c:emit_signal("request::activate", "key.unminimize", {raise = true})
            end
        end,
        { description = "restore minimized", group = "client" }),

    -- Volume
    awful.key({}, "XF86AudioRaiseVolume", function() volumecfg:up() end),
    awful.key({}, "XF86AudioLowerVolume", function() volumecfg:down() end),
    awful.key({}, "XF86AudioMute", function() volumecfg:toggle() end),

    -- Systray
    awful.key({ modkey }, "0",
        function() awful.screen.focused().systray.visible = not awful.screen.focused().systray.visible end,
        { description = "Toggle systray visibility", group = "custom" }),

    -- Prompt
    awful.key({ modkey }, "i", function() awful.screen.focused().mypromptbox:run () end, { description = "run prompt", group = "launcher" }),
    awful.key({ modkey }, "p",
        function()
            awful.prompt.run {
                prompt = "# ",
                textbox = awful.screen.focused().mypromptbox.widget,
                exe_callback = awful.util.eval,
                history_path = awful.util.get_cache_dir() .. "/history_eval"
            }
        end,
        { description = "lua execute prompt", group = "awesome" }),

    -- Rofi
    awful.key({ modkey }, "q", function() awful.spawn("rofirun -l") end, { description = "show the rofi-quit", group = "launcher" }),
    awful.key({ modkey }, "w", function() awful.spawn("rofirun -w") end, { description = "show the rofi-windows", group = "launcher" }),
    awful.key({ modkey }, "a", function() awful.spawn("rofirun -r") end, { description = "show the rofi-app", group = "launcher" }))

clientkeys = gears.table.join(awful.key({ modkey }, "f",
        function(c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        { description = "toggle fullscreen", group = "client" }),
awful.key({ modkey, "Shift" }, "c", function(c) c:kill() end, { description = "close", group = "client" }),
awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle, { description = "toggle floating", group = "client" }),
awful.key({ modkey, "Control" }, "Return", function(c) c:swap(awful.client.getmaster()) end, { description = "move to master", group = "client" }),
awful.key({ modkey }, "o", function(c) c:move_to_screen() end, { description = "move to screen", group = "client" }),
awful.key({ modkey }, "t", function(c) c.ontop = not c.ontop end, { description = "toggle keep on top", group = "client" }),
awful.key({ modkey }, "n",
    function(c)
        -- The client currently has the input focus, so it cannot be
        -- minimized, since minimized clients can't have the focus.
        c.minimized = true
    end,
    { description = "minimize", group = "client" }),
awful.key({ modkey }, "m",
    function(c)
        c.maximized = not c.maximized
        c:raise()
    end,
    { description = "(un)maximize", group = "client" }),
awful.key({ modkey, "Control" }, "m",
    function(c)
        c.maximized_vertical = not c.maximized_vertical
        c:raise()
    end,
    { description = "(un)maximize vertically", group = "client" }),
awful.key({ modkey, "Shift" }, "m",
    function(c)
        c.maximized_horizontal = not c.maximized_horizontal
        c:raise()
    end ,
    { description = "(un)maximize horizontally", group = "client" }))

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    globalkeys = gears.table.join(
        globalkeys,

        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
            function()
                local screen = awful.screen.focused()
                local tag = screen.tags[i]
                if tag then
                    tag:view_only()
                end
            end,
            { description = "view tag #"..i, group = "tag" }),

        -- Toggle tag display.
        awful.key({ modkey, "Control" }, "#" .. i + 9,
            function()
                local screen = awful.screen.focused()
                local tag = screen.tags[i]
                if tag then
                    awful.tag.viewtoggle(tag)
                end
            end,
            { description = "toggle tag #" .. i, group = "tag" }),

        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
            function()
                if client.focus then
                    local tag = client.focus.screen.tags[i]
                    if tag then
                        client.focus:move_to_tag(tag)
                    end
               end
            end,
            { description = "move focused client to tag #"..i, group = "tag" }),

        -- Toggle tag on focused client.
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
            function()
                if client.focus then
                    local tag = client.focus.screen.tags[i]
                    if tag then
                        client.focus:toggle_tag(tag)
                    end
                end
            end,
            { description = "toggle focused client on tag #" .. i, group = "tag" }))
end

clientbuttons = gears.table.join(
    awful.button({ }, 1, function(c) c:emit_signal("request::activate", "mouse_click", { raise = true }) end),
    awful.button({ modkey }, 1,
        function(c)
            c:emit_signal("request::activate", "mouse_click", { raise = true })
            awful.mouse.client.move(c)
        end),
    awful.button({ modkey }, 3,
        function(c)
            c:emit_signal("request::activate", "mouse_click", { raise = true })
            awful.mouse.client.resize(c)
        end))

-- Set keys
root.keys(globalkeys)
-- }}}


-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
    {
        rule = { },  -- All clients will match this rule.
        properties = {
            border_width = beautiful.border_width,
            border_color = beautiful.border_normal,
            focus = awful.client.focus.filter,
            raise = true,
            keys = clientkeys,
            buttons = clientbuttons,
            screen = awful.screen.preferred,
            placement = awful.placement.no_overlap+awful.placement.no_offscreen,
            size_hints_honor = false
        }
    },

    -- Set programs to always map on a certain tag, on a certain screen.
    {
        rule = { class = "Firefox" },
        properties = { screen = 1, tag = "1", maximized = false }
    },

    -- Floating clients.
    {
        rule_any = {
            instance = {
                "DTA",  -- Firefox addon DownThemAll.
                "copyq",  -- Includes session name in class.
                "pinentry"
            },
            class = {
                "Arandr",
                "Blueman-manager",
                "Gpick",
                "Kruler",
                "MessageWin",  -- kalarm.
                "Sxiv",
                "Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
                "Wpa_gui",
                "veromix",
                "xtightvncviewer"
            },

            -- Note that the name property shown in xprop might be set slightly after creation of the client
            -- and the name shown there might not match defined rules here.
            name = { "Event Tester" },  -- xev.
            role = {
                "AlarmWindow",  -- Thunderbird's calendar.
                "ConfigManager",  -- Thunderbird's about:config.
                "pop-up"  -- e.g. Google Chrome's (detached) Developer Tools.
            }
        },
        properties = { floating = true }
    },

     -- Add titlebars to normal clients and dialogs
    {
        rule_any = { type = { "normal", "dialog" } },
        properties = { titlebars_enabled = false }
    }
}
-- }}}


-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage",
    function(c)
        -- Set the windows at the slave,
        -- i.e. put it at the end of others instead of setting it master.
        -- if not awesome.startup then awful.client.setslave(c) end
        if awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then
            -- Prevent clients from being unreachable after screen count changes.
            awful.placement.no_offscreen(c)
        end
    end)

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars",
    function(c)
        -- buttons for the titlebar
        local buttons = gears.table.join(
            awful.button({ }, 1,
                function()
                    c:emit_signal("request::activate", "titlebar", { raise = true })
                    awful.mouse.client.move(c)
                end),
            awful.button({ }, 3,
                function()
                    c:emit_signal("request::activate", "titlebar", {raise = true})
                    awful.mouse.client.resize(c)
                end))
        awful.titlebar(c) : setup {
            -- Left
            {
                awful.titlebar.widget.iconwidget(c),
                buttons = buttons,
                layout = wibox.layout.fixed.horizontal
            },

            -- Middle
            {
                -- Title
                {
                    align  = "center",
                    widget = awful.titlebar.widget.titlewidget(c)
                },
                buttons = buttons,
                layout = wibox.layout.flex.horizontal
            },

            -- Right
            {
                awful.titlebar.widget.floatingbutton(c),
                awful.titlebar.widget.maximizedbutton(c),
                awful.titlebar.widget.stickybutton(c),
                awful.titlebar.widget.ontopbutton(c),
                awful.titlebar.widget.closebutton(c),
                layout = wibox.layout.fixed.horizontal()
            },
            layout = wibox.layout.align.horizontal
        }
    end)

-- Enable sloppy focus, so that focus follows mouse.
-- client.connect_signal("mouse::enter", function(c) c:emit_signal("request::activate", "mouse_enter", { raise = false }) end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}


-- launch autostart
awful.spawn.with_shell("~/.config/awesome/autostart.sh")
