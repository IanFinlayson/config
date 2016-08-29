# Path to your oh-my-zsh installation.
export ZSH=/home/finlayson/.oh-my-zsh


HISTSIZE=10000
SAVEHIST=10000

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify

unsetopt inc_append_history
unsetopt share_history

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="gallifrey"

# which oh my zsh plugins to load
plugins=(git catimg)

# set up oh my zsh
source $ZSH/oh-my-zsh.sh

# make ctrl-z on the command line go back to the suspended process
# this lets me use ctrl-z to swap between shell and eg Vim
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    fg
    zle redisplay
  else
    zle push-input
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z


# make colors nice
eval `dircolors ~/.dircolors`
export TERM='xterm'

# set up vim input mode
set -o vi
bindkey -v

# basics
export EDITOR='vim'
export SHELL='/bin/zsh'

# enable color support of ls and also add handy aliases
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -a'

# I like a clear screen
alias l='clear;pwd;ls'
alias c='printf "\033c"'

# use real Vim no mater what I type
alias vi='vim'

# always color grep results
alias grep='grep --color=auto'

# go to machines I use a lot
alias cs='ssh cs.umw.edu'
alias htpc='ssh finlayson.xyz'

# shut the hell up evince
alias evince='evince 1>/dev/null 2>/dev/null'

# make dia use only one window
alias dia='dia --integrated'

# always print two-sided
alias lpr='lpr -o sides=two-sided-long-edge'

# set the path up
export PATH=/home/finlayson/tetra/bin:/home/finlayson/bin:$PATH:.

