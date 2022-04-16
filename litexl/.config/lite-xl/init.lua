-- This module will be loaded after everything else when the application starts.
-- It will be automatically reloaded when saved.


-- Libraries
local core = require "core"
local keymap = require "core.keymap"
local config = require "core.config"
local style = require "core.style"


-- Themes
core.reload_module("colors.dracula")


-- Key bindings
keymap.add { ["ctrl+escape"] = "core:quit" }


-- Fonts
style.font = renderer.font.load(DATADIR .. "/fonts/FiraSans-Regular.ttf", 12 * SCALE)
style.code_font = renderer.font.load(DATADIR .. "/fonts/JetBrainsMono-Regular.ttf", 12 * SCALE)

-- font names used by lite:
-- style.font          : user interface
-- style.big_font      : big text in welcome screen
-- style.icon_font     : icons
-- style.icon_big_font : toolbar icons
-- style.code_font     : code
--
-- the function to load the font accept a 3rd optional argument like:
--
-- {antialiasing="grayscale", hinting="full"}
--
-- possible values are:
-- antialiasing: grayscale, subpixel
-- hinting: none, slight, full


-- Plugins
config.plugins.trimwhitespace = true
config.plugins.detectindent = true
