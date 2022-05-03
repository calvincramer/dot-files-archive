# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# Colored prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=yes
    fi
fi

# limit the number of directories printed in prompt string, before has a '...'
# export PROMPT_DIRTRIM=6

# Change the colors in the prompt string:
if [ "$color_prompt" = yes ]; then
    # Calvin original: PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;34m\]\u@\H\[\033[00m\]:\[\033[01;32m\]$PWD\n\[\033[01;33m\]\$\[\033[00m\] '
else
    # Calvin original: PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;34m\]\u@\H\[\033[00m\]:\[\033[01;32m\]$PWD\n\[\033[01;33m\]\$\[\033[00m\] '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Colored GCC warnings and errors (sure I'll try it)
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


################################################################################
# Mostly things added by Calvin below:
############################ FUNCTIONS #########################################

# (cd ..) n times, can also use (cdup ...) to go up three directories
# Only does one cd, so you can use (cd -)
function cdup() {
    num_regex='^[1-9]([0-9]*)$'
    dot_regex='^\.+$'
    cd_string='..'
    usage="Usage: $0 <positive number>    or    $0 <....> (n number of dots)";
    # See if passed arg
    if [ -z "$1" ]; then
        echo $usage;
        return 1;
    fi
    # Check number
    if [[ $1 =~ $num_regex ]] ; then        # Parse arg as number
        for (( i=1; i < $1; i++ )); do
            cd_string="${cd_string}/.."
        done
        cd $cd_string
        echo `pwd`
        return 0;
    fi
    # Check dots
    if [[ $1 =~ $dot_regex ]] ; then        # Parse arg as dots
        for (( i=1; i < ${#1}; i++ )); do
            cd_string="${cd_string}/.."
        done
        cd $cd_string
        echo `pwd`
        return 0;
    fi
    # Not a positive number or dots
    echo $usage;
    return 1;
}

# Change terminal title
function change-term-title() {
    if [[ $# -ne 1 ]]; then
        echo "Need to supply new title"
        return
    fi
    printf '\033]2;%s\033\\' $1     # Fun!
}

# Change how default `cd` behaves:
cd() {
    # cd with no arguments stop from going to home
    [[ $# -eq 0 ]] && return
    # Always do `ls` after cd:
    builtin cd "$@" && ls -F
}
cd-no-ls () {
    # cd with no arguments stop from going to home
    [[ $# -eq 0 ]] && return
    builtin cd "$@"
}

############################ BINDINGS ##########################################

# Bind keys like ctrl+arrowkey to work through ssh
bind '"\e[1;5D" backward-word'      # ctrl+left
bind '"\e[1;5C" forward-word'       # ctrl+right

############################ ETC ##########################################

# Save tmux to bash_history. Don't save duplicate commands, don't log commands starting with whitespace
export HISTCONTROL=ignorespace:ignoredups:erasedups

# History length - see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000000
HISTFILESIZE=1000000

# After each command, save and reload history
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# Shell options
shopt -s checkjobs      # Don't exit first time if there are jobs running
shopt -s checkwinsize   # Check the window size after each command and, if necessary, update the values of LINES and COLUMNS.
shopt -s histappend     # Use history file

# Restore tmux sessions (cleared on reboot from tmux server)
# tmux-session restore > /dev/null 2>&1
# For some reason this creates 10 blank windows in a tmux session every seconds

# Source other init files
if [[ -f "/folk/ccramer/.bashrc_wc" ]]; then
    source /folk/ccramer/.bashrc_wc
fi
# Alias definitions:
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
if [[ -f "/folk/ccramer/.bash_aliases_wr" ]]; then
    source /folk/ccramer/.bash_aliases_wr
fi

############################ AUTOMATICALLY ADDED ###############################

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/home/cal/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/home/cal/anaconda3/etc/profile.d/conda.sh" ]; then
#         . "/home/cal/anaconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/home/cal/anaconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda initialize <<<

# Created by `userpath` on 2021-04-20 01:07:50
export PATH="$PATH:/home/cal/.local/bin"
