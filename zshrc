# Ian Finlayson's zsh rc

# setup history
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# auto completion
zstyle :compinstall filename '/home/finlayson/.zshrc'
autoload -U compinit
compinit

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
export PROMPT='[%n@%m %1~]$ '

# enable color support of ls and also add handy aliases
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -a'

# I like a clear screen
alias l='clear;pwd;ls'
alias c='clear'

# use real Vim no mater what I type
alias vi='vim'

# always make compiler strict
alias g++='g++ -W -Wall -g'
alias gcc='gcc -W -Wall -g'

# always color grep results
alias grep='grep --color=auto'

# my tasks program
alias vtasks='python2 ~/vtasks/vtasks.py'

# go to machines I use a lot
alias cs='ssh cs.umw.edu'
alias htpc='ssh 73.177.239.11'

# shut the hell up evince
alias evince='evince 1>/dev/null 2>/dev/null'

# make dia use only one window
alias dia='dia --integrated'

# always print two-sided
alias lpr='lpr -o sides=two-sided-long-edge'

# search local lib for libraries (why is this not default?)
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

# set the path up
export PATH=/home/finlayson/bin:$PATH:.

