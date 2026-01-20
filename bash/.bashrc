#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export TERM=xterm-256color
export PATH=$PATH:$HOME/.cargo/bin
export VISUAL=nvim

#alias cat='bat'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
alias ytdm='yt-dlp -x -f m4a --embed-metadata'
alias muic='ncmpcpp'
alias code='vscodium'
. "$HOME/.aftman/env"
