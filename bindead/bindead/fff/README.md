# fff (fucking fast file manager)

Check [fff repo](https://github.com/dylanaraps/fff) for all info.


## Installation

First clone this repo and cd into it:

```
git clone https://github.com/matteogiorgi/.deadfiles
cd .deadfiles
```

Then, if your using [stow](https://www.gnu.org/software/stow/) just:

```
stow -S bindead
```

Finally add the following line to your `~/.zshrc` (or `~/.bashrc`):

```
[[ -f $HOME/bin/fff/.fffrc ]] && source $HOME/bin/fff/.fffrc
```


### Extra

Remember to add `.deadfiles/bindead` directory to your `$PATH` so to have the ability to launch `fff` from anywhere; plus, if you want to cd-on-exit, add the following somewhere in your `~/.zshrc` (or `~/.bashrc`):

```
function _ffm () {
    fff "$@"
    cd "$(cat "$FFF_CD_FILE")"  # ${XDG_CACHE_HOME:=${HOME}/.cache}/fff/fff.d"
}

alias fff="_ffm"
```
