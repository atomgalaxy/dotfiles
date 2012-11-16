#!/bin/bash
alias nanika-krelm="gkrellm --server nanika --port 6311"
alias tooichan-krelm='gkrellm --server tooichan --port 31456'
alias mount-nanika-storage='sshfs nanika:/storage /home/atom/nanika-storage'
alias mount-nanika-home='sshfs nanika:/home/atom /home/atom/nanika-home'
alias mount-nanika-torrent='sshfs nanika:/home/transmissiond/ /home/atom/nanika-torrent'
alias mount-atomicity-storage='sshfs atomicity.org:/storage /home/atom/nanika-storage'
alias mount-atomicity-home='sshfs atomicity.org:/home /home/atom/nanika-home'
alias mount-atomicity-torrent='sshfs atomicity.org:/home/transmissiond/ /home/atom/nanika-torrent'
#alias emacs='TERM=xterm-256color emacs -nw'
alias display-set-home='xrandr --auto --output LVDS-1 --mode 1920x1200 --right-of VGA-1'
alias display-set-single='xrandr --auto --output LVDS-1 --mode 1920x1200'
alias display-set-jsi='xrandr --auto --output LVDS-1 --mode 1920x1200 --right-of VGA-1 --output VGA-1 --mode 1280x720'
alias atomicity-transmissiond='ssh atomicity.org -L 9999:localhost:9091'
alias atomicity-socks-proxy='ssh atomicity.org -D 9950'
alias carver='ssh train200@carver.nersc.gov'
alias ramblaze='ssh ramblaze.ist.berkeley.edu -l gasper'
alias datablaze='ssh datablaze.ist.berkeley.edu -l gasper'
if [[ "$(uname)" == "Darwin" ]]
then
    alias ls='ls -G'
else
    alias ls='ls --color=always'
fi
