# enable color support of ls and also add handy aliases
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -a'

# I like a clear screen
alias l='clear;pwd;ls'
alias c='printf "\033c"'

# use real Vim no mater what I type
export EDITOR='vim'
alias vi='vim'

# always color grep results
alias grep='grep --color=auto'

# go to machines I use a lot
alias srv='ssh ifinlay@ianfinlayson.net'

# shorten this up
alias py='python3'

# set the path up
export PATH=/home/ifinlay/Bin:$PATH:.

