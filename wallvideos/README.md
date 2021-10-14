# Video-wallpapers

Inside the `./videos` directory there are a bunch of small videos usable as wallpaper with the help of [this script](https://github.com/matteogiorgi/.dotfiles/blob/master/bin/bin/wallset).
I've mapped two commands inside `rc.conf` (for ranger) and `vifmrc` (for vifm) to speed things up.

```
[rc.conf]
alias wallvideo shell wallset --video %f
alias wallquit  shell wallset --quit

[vifmrc]
command! wallvideo :!wallset --video %f
command! wallquit  :!wallset --quit
```

---

With the intent of keeping the repo in order, I wrote a simple script that renames every file inside it with a progresive number: just throw any gif inside `./videos` and run `vid-rename`: it will convert all the gif files inside the direcory in an mp4 before rename it appropriately. This is becouse on the web is much easier to find gifs than small videos.

---

You can add these two functions in your `~/.zshrc` (or `~/.bashrc`) too.

```
function wallvideo () { wallset --video $1 ; }
function wallquit () { wallset --quit ; }
```
