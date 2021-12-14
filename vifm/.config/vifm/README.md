Add the folling function to your `~/.zshrc` (or `~/.bashrc`) to change directory on exit (remember to install ueberzug too):

```
function _vfm () {
    local dst="$(command ~/.config/vifm/scripts/vifmrun "$@")"
    if [ -z "$dst" ]; then
        echo 'Directory picking cancelled/failed'
        return 1
    fi
    cd "$dst"
}

alias vifm="_vfm"
```
