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

# printf
alias pf=printf

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

# GitHub Notebook
alias note="vim ~/LAB/repo/Note/quicknote.md"
alias notes="cd ~/LAB/repo/Note"
alias syncnotes="~/LAB/repo/Note/sync.sh"
