# WSL
alias shutdown="wslconfig.exe /terminate debian"

# Tmux
alias tm=tmux
alias tn="tmux new -s"
alias ta="tmux attach-session"
alias tat="tmux attach-session -t"

# ls
alias ls=exa
alias ll="exa -la"
alias l="exa -a"
alias lt="exa -T"
alias llt="exa -lT"

# Python
alias py=python3
alias python=python3
alias pip=pip3

# Protect Files
alias rm=trash
alias cp="cp -i"
alias mv="mv -i"

# ZSH
alias plugapply="antibody bundle < ~/LAB/repo/config-bundle/.zsh/weapon.txt > ~/LAB/repo/config-bundle/.zsh/weapon.sh"
alias plugconfig="vi ~/LAB/repo/config-bundle/.zsh/weapon.txt"
alias plugupdate="antibody update"
alias aliases="vi ~/LAB/repo/config-bundle/.zsh/aliases.sh"

# File Runners
alias -s txt=vim
alias -s md=vim
alias -s py=python3

# ADB
alias adb="/mnt/d/Program/adb/adb.exe"
alias brevent="adb -d shell sh /data/data/me.piebridge.brevent/brevent.sh"

# Windows Program
alias v2ray="/mnt/c/AVALON/program/v2ray/v2ray.exe"
alias mpv="/mnt/c/AVALON/program/mpv/mpv.exe"
alias mpvconf="vim /mnt/c/AVALON/conf/mpv/mpv.conf"
alias dnscrypt="/mnt/c/AVALON/program/dnscrypt-proxy/dnscrypt-proxy.exe"
alias aria2c="/mnt/c/AVALON/program/aria2/aria2c.exe"

# Scripts
## bilibili danmaku downloader
alias bili="~/winopen/bili.sh"
## update Windows hosts file
alias hotspotHosts="bash ~/winopen/updateHosts.sh"
## server updater
alias wages="~/LAB/updateWages.sh"

