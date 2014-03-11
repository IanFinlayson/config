# Ian Finlayson's zshrc

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
zstyle :compinstall filename '/home/finlayson/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# make home and end work right in some terminals
bindkey '^[OH' beginning-of-line
bindkey '^[OF' end-of-line
bindkey "^[[3~" delete-char

# basics
export EDITOR='emacs -nw'
export SHELL='/bin/zsh'
export PROMPT='[%n@%m %c]$ '

# enable color support of ls and also add handy aliases
alias ls='ls --color=always'
alias ll='ls -l'
alias la='ls -a'

# always allow X over ssh
alias ssh='ssh -X'

# I like a clear screen
alias l='clear;pwd;ls'
alias c='clear'

# use real Vim no mater what I type
alias vi='vim'

# always make compiler strict
alias g++='g++ -W -Wall -g'
alias gcc='gcc -W -Wall -g'

# show more history
alias history='history 1'

# open any file on the command line with the program that makes sense
alias o='xdg-open'

# always color grep results
alias grep='grep --color=always'

# go to machines I use a lot
alias rose='ssh rosemary.umw.edu'
alias cin='ssh cinnamon.umw.edu'

# shut the hell up evince
alias evince='evince 1>/dev/null 2>/dev/null'

# make dia use only one window
alias dia='dia --integrated'

# never use a dumb window
alias emacs='emacs -nw'
alias e='emacs -nw'

# always print two-sided
alias lpr='lpr -o sides=two-sided-long-edge'

# add scripts, Haskell and Go programs, and "." to path
export PATH=~/bin:$PATH::~/.cabal/bin:/usr/local/go/bin:.
export GOPATH=~/godev

# make colors nice
eval `dircolors ~/.dircolors`
export TERM='xterm'

