# Created by newuser for 5.8
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=20000
SAVEHIST=$HISTSIZE
bindkey -v
bindkey '^R' history-incremental-search-backward
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/dust/.zshrc'

# set prompt, show current path
autoload -Uz promptinit
promptinit
prompt redhat

# alias
alias ls='ls --color=auto'

# from bash@windows
alias v='nvim-qt'
alias vz='nvim ~/.zshrc'
alias sz='source ~/.zshrc'
alias vrc='nvim ~/_vimrc'
alias g='git'
alias mkd='mkdir -pv'
alias ll='ls -hN --color=auto --group-directories-first'
alias lls='ls -hN --color=auto --group-directories-first --sort=extension'

# tweak cfg
alias vkey='nvim ~/.config/sxhkd/sxhkdrc && echo "press Super+Esc to reload sxhkd"'
alias vwm='nvim ~/.config/bspwm/bspwmrc && echo "press Super+Alt+R to reload bspwm"'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# neofetch --color_blocks off
