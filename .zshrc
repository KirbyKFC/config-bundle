#!/bin/zsh
# exit for non-interactive shell
[[ $- != *i* ]] && return

# Use Tmux as Default
[[ -z "$TMUX" ]] && (tmux attach -t default || tmux new -s default)

# Enable 256 color to make auto-suggestions look nice
export TERM="xterm-256color"

CONFIG_HOME="$HOME/LAB/repo/config-bundle/.zsh"

# Show Banner
cat "$CONFIG_HOME/banner.txt"
last -3 -F | sed -n 2,3p | xargs -0 printf 'Last Login Info:\n%s\n'
[[ -z "$TMUX" ]] && printf "Warning! You are not in Tmux.\n"

# Enable colorized ls to make dir look nice
[ -f "$CONFIG_HOME/ls_colors.sh" ] && source "$CONFIG_HOME/ls_colors.sh"

# Initialize command prompt
[ -f "$CONFIG_HOME/prompt.sh" ] && source "$CONFIG_HOME/prompt.sh"
precmd () { export PROMPT="%F{208}%m%f:%F{118}$(_fish_collapsed_pwd)%f>" }

# Auto Title
autoload -Uz add-zsh-hook
function xterm_title_precmd () {
	print -Pn -- '\e]2;%n@%m %~ \a'
	[[ "$TERM" == 'screen'* ]] && print -Pn -- '\e_\005{g}%n\005{-}@\005{m}%m\005{-} \005{B}%~\005{-}\e\\'
}
function xterm_title_preexec () {
	print -Pn -- '\e]2;%n@%m %~ %# ' && print -n -- "${(q)1}\a"
	[[ "$TERM" == 'screen'* ]] && { print -Pn -- '\e_\005{g}%n\005{-}@\005{m}%m\005{-} \005{B}%~\005{-} %# ' && print -n -- "${(q)1}\e\\"; }
}
if [[ "$TERM" == (screen*|xterm*|rxvt*|tmux*|putty*|konsole*|gnome*) ]]; then
	add-zsh-hook -Uz precmd xterm_title_precmd
	add-zsh-hook -Uz preexec xterm_title_preexec
fi

# Keybind
set -o vi

# Load Plugin
source ~/.zinit/bin/zinit.zsh

zinit wait lucid light-mode for \
	changyuheng/zsh-interactive-cd \
	Vifon/deer \
	b4b4r07/enhancd \
	caarlos0/zsh-mkc \
	hlissner/zsh-autopair \
	skywind3000/z.lua \
	zdharma/fast-syntax-highlighting \
	zdharma/history-search-multi-word \
	atload'[ -f "$CONFIG_HOME/abbr.sh" ] && source "$CONFIG_HOME/abbr.sh"' momo-lab/zsh-abbrev-alias

zinit wait blockf lucid atload'bindkey -r "^[/"' light-mode for \
	zsh-users/zsh-completions

zinit wait lucid atload'_zsh_autosuggest_start' light-mode for \
	zsh-users/zsh-autosuggestions

## deer
fpath+=( ~/.zinit/plugins/Vifon---deer )
autoload -U deer
zle -N deer
bindkey '^K' deer

# Load Modules
zmodload zsh/zpty
autoload -Uz compinit && compinit
bindkey '^k' deer

# Plugin Settings
## zsh-autosuggestions
ZSH_AUTOSUGGEST_USE_ASYNC=1
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# Save History
HISTFILE="$CONFIG_HOME/history.txt"
HISTSIZE=10000
SAVEHIST=10000
setopt APPEND_HISTORY
setopt PROMPT_SUBST
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
unsetopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY # Don't execute immediately upon history expansion.

# Load aliases
[ -f "$CONFIG_HOME/aliases.sh" ] && source "$CONFIG_HOME/aliases.sh"

# Load custom config
[ -f "$CONFIG_HOME/custom.sh" ] && source "$CONFIG_HOME/custom.sh"
. "/root/.acme.sh/acme.sh.env"
