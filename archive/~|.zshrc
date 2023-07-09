# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="crunch-calvin"
# darkblood good
# crunch good
# alanpeabody good
# robbyrussell
# mrtazz

setopt histignorealldups sharehistory
HISTSIZE=10000
SAVEHIST=10000
autoload -U compinit promptinit
promptinit
# prompt pure
compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
fpath=(/usr/local/share/zsh-completions $fpath)

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 7

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-autocomplete
    colored-man-pages
    docker
    golang
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
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

############################ BINDINGS ##########################################

# Bind keys like ctrl+arrowkey to work through ssh
# bindkey '"\e[1;5D" backward-word'      # ctrl+left
# bindkey '"\e[1;5C" forward-word'       # ctrl+right
# bindkey '^I' autosuggest-accept        # autocomplete on tab

# shopt -s checkjobs      # Don't exit first time if there are jobs running
# shopt -s checkwinsize   # Check the window size after each command and, if necessary, update the values of LINES and COLUMNS.
# shopt -s histappend     # Use history file

# Restore tmux sessions (cleared on reboot from tmux server)
# tmux-session restore > /dev/null 2>&1
# For some reason this creates 10 blank windows in a tmux session every seconds

# Alias definitions:
if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

if [ "$(hostname)" = "tex-ccramer-lx1" ]; then
    export PATH=${PATH}:/var/lib/flatpak/exports/share
    export PATH=${PATH}:/home/cjc/.local/share/flatpak/exports/share
    export PATH=${PATH}:~/repos/linux-scripts
    export GEM_HOME="${HOME}/gems"
    export PATH="${HOME}/gems/bin:${PATH}"

    if [[ -d "/home/cjc/repos" ]]; then
        builtin cd /home/cjc/repos
    fi
fi

if [ "$(hostname)" = "ala-ccramer-lx1" ]; then
    export PATH="$PATH:/home/cal/.local/bin"
    export PATH=$PATH:/usr/local/go/bin

    complete -C studio-cli studio-cli
    if [[ -f "/folk/ccramer/.bash_aliases_wr" ]]; then
        source /folk/ccramer/.bash_aliases_wr
    fi
    if [[ -f "/folk/ccramer/.bashrc_wr" ]]; then
        source /folk/ccramer/.bashrc_wr
    fi
    if [[ -d "/home/cal/repos" ]]; then
        builtin cd /home/cal/repos
    fi
fi

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
source "$HOME/.cargo/env"
