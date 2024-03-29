# .bash_profile

# Runs on ssh connection, tmux

# Get the aliases and functions
if [ "$(hostname)" == "ala-ccramer-lx1" ]; then
    if [ -f /home/cal/.bashrc ]; then
        . /home/cal/.bashrc
    fi
else
    . ~/.bashrc
fi

# User specific environment and startup programs
PATH=$PATH:$HOME/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/opt/sfw/bin:/opt/sfw/sbin:/usr/sfw/bin:/usr/sfw/sbin
export PATH

# Don't overwrite the PS1 from ~/.bashrc
# PS1="\u@\H$"
# export PS1

unset USERNAME
. "$HOME/.cargo/env"
