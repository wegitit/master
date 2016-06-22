# .bashrc

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias vi='vim'

# copied from /etc/profile.d/colorls.sh
# added h
alias ll='ls -lh --color=auto' 2>/dev/null

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
