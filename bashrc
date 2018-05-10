# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options.
HISTCONTROL=ignoreboth

# Append to the history file, don't overwrite it.
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1).
HISTSIZE=100000
HISTFILESIZE=200000

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar 2>/dev/null

# Set variable identifying the chroot you work in (used in the prompt
# below).
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

HOSTSHORT=`hostname | sed -e 's/\(.*\)\..*\..*/\1/' | sed -e 's/\.local//'`
PS1='${debian_chroot:+($debian_chroot)}\u@$HOSTSHORT:\W\$ '

# Enable color support of ls and also add handy aliases. (Parts taken
# from www.pixelbeat.org/scripts/l.)
{ ls --color -d . >/dev/null 2>&1; } ||
{ gls --color -d . >/dev/null 2>&1 && ls=gls; } || NONGNU=1

if [ "$NONGNU" ]; then
    alias ls='ls -G'
    alias grep='grep --color=auto'
elif [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
fi

# Some more ls aliases.
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

alias make='make -j2'

# Enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export PATH=$PATH:/usr/local/maven/bin:/usr/local/sbin:/usr/sbin:/sbin:/home/tomh/bin:/home/tomh/bin/todo
export EDITOR=vim
