## Install (highly suggested)

- feh
- nvim
- zathura
- sxiv
- mpv
- vlc
- thunar
- gitg
- ffmpegthumbnailer

---

Add the folling function to your `~/.zshrc` (or `~/.bashrc`) to change directory on exit:

```
function _rfm () {
    local tempfile="$(mktemp -t tmp.XXXXXX)"
    /usr/bin/ranger --choosedir="$tempfile" "${@:-$(pwd)}"
    test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
        cd -- "$(cat "$tempfile")"
    fi
    rm -f -- "$tempfile"
}

alias ranger="_rfm"
```

and export the following variable to avoid loading ranger configs twice:

```
export RANGER_LOAD_DEFAULT_RC="FALSE"
```
