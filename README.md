# [og](https://jrl.ninja/configs/og)

first ever arch linux desktop configs, completed circa jan 2018. used as daily driver, so configs have slowly drifted away from what was preserved in the screenshots, so I am archiving this as of mar 2019. see [dd](https://github.com/joshuarli/dd) for current daily driver.


```
wm + friends:   bspwm + sxhkd + compton + rofi + dunst
bar:            polybar
term:           urxvt
fonts:          ttf-hack + ttf-font-awesome-4
shell:          zsh
colors:         pywal
```


## Install

ymmv, but generally `install-stage1.sh` in a tty as a sudo-enabled user, then in X, `install-stage2.sh` and reboot (or kill `xinit` then `startx` again).

**NOTE**: on every `startx`, you will need to manually run `polybar top` and `polybar bottom`.

`Wallpapers/` contains quite a few wallpapers that look great with the default `pywal`-generated palettes. Use `wallcrunch` to change the wallpaper + colors.


## Gallery

[`interjection.sh`](https://github.com/JoshuaRLi/interjection.sh), `neofetch`, `cmatrix`

![](./gallery/1.jpg?raw=true)

`htop`, `ranger` + `highlight` + `w3m`

![](./gallery/2.jpg?raw=true)

`micro`, `neofetch`, `tree`

![](./gallery/3.jpg?raw=true)

`vtop`

![](./gallery/4.jpg?raw=true)

`pipes.sh`, `pacman -Syu` confirmation

![](./gallery/5.jpg?raw=true)

`pacman -Syu`

![](./gallery/6.jpg?raw=true)

`vis` (`cli-visualizer`), `mpv`

![](./gallery/7.jpg?raw=true)
