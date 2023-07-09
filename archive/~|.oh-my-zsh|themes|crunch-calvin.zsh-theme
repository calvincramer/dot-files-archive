# CRUNCH - created from Steve Eley's cat waxing.
# Initially hacked from the Dallas theme. Thanks, Dallas Reedy.
#
# This theme assumes you do most of your oh-my-zsh'ed "colorful" work at a single machine,
# and eschews the standard space-consuming user and hostname info.  Instead, only the
# things that vary in my own workflow are shown:
#
# * The time (not the date)
# * The RVM version and gemset (omitting the 'ruby' name if it's MRI)
# * The current directory
# * The Git branch and its 'dirty' state
#
# Colors are at the top so you can mess with those separately if you like.
# For the most part I stuck with Dallas's.

local WHITE="%{$fg[white]%}"
local YELLOW="%{$fg_bold[yellow]%}"
local MAGENTA="%{$fg_bold[magenta]%}"
local GREEN="%{$fg_bold[green]%}"
local RED="%{$fg_bold[red]%}"
local BLUE="%{$fg_bold[blue]%}"
local RESET="%{$reset_color%}"

# These Git variables are used by the oh-my-zsh git_prompt_info helper:
ZSH_THEME_GIT_PROMPT_PREFIX="${BLUE}"
ZSH_THEME_GIT_PROMPT_SUFFIX="${RESET}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY=" ${RED}x"
ZSH_THEME_GIT_PROMPT_AHEAD="${YELLOW}a"
ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE="${YELLOW}A"
ZSH_THEME_GIT_PROMPT_BEHIND="${YELLOW}b"
ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE="${YELLOW}B"

# Our elements:
ZSH_THEME_RUBY_PROMPT_PREFIX="$WHITE"["$MAGENTA"
ZSH_THEME_RUBY_PROMPT_SUFFIX="$WHITE"]"%{$reset_color%}"
# local CRUNCH_RVM_='$(ruby_prompt_info)'
# local CRUNCH_DIR="${GREEN}%~\$(git_prompt_info)%{$reset_color%}"
local CRUNCH_DIR="${GREEN}%/%{$reset_color%}"
local CRUNCH_USER="${MAGENTA}%n${RESET}"
local CRUNCH_HOST="${BLUE}%m${RESET}"
local CRUNCH_PROMPT="${YELLOW}\$${RESET}"

# Put it all together!
PROMPT="${CRUNCH_USER}@${CRUNCH_HOST}:${CRUNCH_DIR}
${CRUNCH_PROMPT} "
RPROMPT="\$(git_prompt_info) \$(git_prompt_status)"
