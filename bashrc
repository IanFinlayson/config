# Ian Finlayson's bash rc

# set up vim input mode
set -o vi

# basics
export EDITOR='vim'
export PS1="[\u@\h \W]\\$ \[$(tput sgr0)\]"
export SHELL='/bin/bash'

# enable color support of ls and also add handy aliases
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -a'

# always allow X over ssh
alias ssh='ssh -Y'

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

# shut the hell up evince
alias evince='evince 1>/dev/null 2>/dev/null'

# make dia use only one window
alias dia='dia --integrated'

# always print two-sided
alias lpr='lpr -o sides=two-sided-long-edge'

# search local lib for libraries (why is this not default?)
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

# make colors nice
eval `dircolors ~/.dircolors`
export TERM='xterm'

# set the path up
export PATH=/home/finlayson/bin:$PATH:.

