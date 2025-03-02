# Calvin's aliases
# ~ is /home/cal for me.

# alias git-status-check-recursive-poor-man='find . -type d -name '"'"'.git'"'"' -exec bash -c '"'"'cd {}/..;echo -ne "{}\t";B="\e[1m";G="\e[42m";R="\e[41m";M="\e[45m";N="\e[0m";s=$(git status --porcelain=v2 -b -z | tr "\0" "\n");g=1;[[ "$s" == *"branch.oid (initial)"* ]] && i=1 && g=0;if [ "$i" = "1" ];then echo -n "(initial) ";else [[ "$s" == *"branch.head (detached)"* ]] && h=1 && g=0;if [ "$h" = "1" ];then echo -en "(${R}detached head$N) ";g="0";else a=$(echo "$s" | grep "# branch.ab " | cut -d" " -f3 | cut -c2-);[ "$a" == "1" ] || z="s";[ "$a" != "0" ] && echo -en "($B$a$N commit$z ahead) " && g=0;b=$(echo "$s" | grep "# branch.ab " | cut -d" " -f4 | cut -c2-);[ "$b" == "1" ] || y="s";[ "$b" != "0" ] && echo -en "($B$b$N commit$y behind) " && g=0;fi;fi;echo "$s" | grep -q "^[u12] [^.]." && echo -en "(${G}staged changes$N) " && g=0;echo "$s" | grep -q "^[u12] .[^.]" && echo -en "(${R}unstaged changes$N) " && g=0;echo "$s" | grep -q "^\?" && echo -en "(${R}untracked changes$N) " && g=0;[ -f .git/REBASE_HEAD ] && echo -en "(${M}rebasing$N) " && g=0;[ -f .git/CHERRY_PICK_HEAD ] && echo -en "(${M}cherry pick$N) " && g=0;[ -f .git/MERGE_HEAD ] && echo -en "(${M}merging$N) " && g=0;[ -f .git/BISECT_LOG ] && echo -en "(${M}bisecting$N) " && g=0;t=$(git stash list -z --pretty=format:"A" | tr -d "\0" | wc -c);[ "$t" == "1" ] || x="es";[ "$t" != "0" ] && echo -en "($B$t$N stash$x) " && g=0;[ "$g" == "1" ] && echo -n "good";echo'"'"' \;'

# Add an "alert" alias for long running commands. Use like so:    sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Random:
alias brown-noise="nohup play -q -n -t alsa synth brownnoise vol -10dB </dev/null 1>/dev/null 2>&1 &; disown %1"
alias brown-noise-stop='pkill --full "play -q -n -t alsa synth brownnoise vol -10dB"'
alias cat="bat"
alias cd-repos='cd ~/repos'
alias CD='cd'
#alias code='codium'
alias df-calvin='df -hlPT'
alias diff-color="diff --color=always" # Helps when piping or redirection
alias disk-usage-as-su='sudo baobab'
alias docker-rm-exited-containers='docker ps -a | grep "Exited" | cut -d" " -f1 | xargs docker rm'
alias fix='reset; stty sane; tput rs1; clear; echo -e "\033c"'                  # sometimes tmux breaks terminal stuff, can trigger with fast `git log, q` plus maximizing / un-maximizing pane
alias folder-size-sorted="du -hd1 | sort -h"
alias folder-size="du -hd1"
alias git-cleanup-fsck-prune-gc="git fsck --full --unreachable; git prune; git gc --aggressive"  # Cleanup old clone
alias git-log-pretty-absolute-date="git log --pretty=format:'%C(auto,yellow)%h %C(auto,blue)%>(12,trunc)%ad %C(auto,green)%<(10,trunc)%aN %C(auto,reset)%s %C(auto)(%gD%D)' --date=short"
alias git-log-pretty="git log --pretty=format:'%C(auto,yellow)%h %C(auto,blue)%>(12,trunc)%ad %C(auto,green)%<(10,trunc)%aN %C(auto,reset)%s %C(auto)(%gD%D)' --date=relative"
alias git-log-tree="git log --oneline --decorate --graph --all"
alias git-branch-list-sizes='git for-each-ref --format="%(refname)" | while read branch; do size=$(git rev-list --disk-usage --objects HEAD..$branch); echo "$size $branch"; done | sort -n'
alias grep-color="grep --color=always" # Helps when piping or redirection
alias grep-hilight="less -p" # Helps when piping or redirection
alias grepfiles="grep -lm1"
alias i="top"
alias ks="ls"
alias less-color="less -r"
alias ll='ls -AdhlL --time-style="+%Y-%m-%d" *'
alias ls-absolute="readlink -f *"
alias LS='ls'
alias lsabsolute="readlink -f *"
alias my-black="black -t py310 -l 160"  # Python code formatter
alias objDump='objdump'
alias pycharm='/opt/pycharm/pycharm-community-2022.2.3/bin/pycharm.sh &'
alias qemu-ia-32-smp4core='~/repos/qemu/build/qemu-system-i386       -nographic         -smp 4 -m 2G -machine q35 -cpu Nehalem -display none -serial stdio -monitor none -append "bootline:fs(0,0)host:vxWorks o=gei0" -kernel'
alias qemu-ia-32-up='~/repos/qemu/build/qemu-system-i386             -nographic                -m 2G -machine q35 -cpu Nehalem -display none -serial stdio -monitor none -append "bootline:fs(0,0)host:vxWorks o=gei0" -kernel'
alias qemu-ia-64-smp4core='~/repos/qemu/build/qemu-system-x86_64     -nographic         -smp 4 -m 2G -machine q35 -cpu Nehalem -display none -serial stdio -monitor none -append "bootline:fs(0,0)host:vxWorks o=gei0" -kernel'
alias qemu-ia-64-up='~/repos/qemu/build/qemu-system-x86_64           -nographic                -m 2G -machine q35 -cpu Nehalem -display none -serial stdio -monitor none -append "bootline:fs(0,0)host:vxWorks o=gei0" -kernel'
alias qemu-riscv-32-smp4core='~/repos/qemu/build/qemu-system-riscv32 -nographic -M virt -smp 4 -m 2G -display none -serial stdio -monitor none -bios default -kernel'
alias qemu-riscv-32-up='~/repos/qemu/build/qemu-system-riscv32       -nographic -M virt        -m 2G -display none -serial stdio -monitor none -bios default -kernel'
alias qemu-riscv-64-smp4core='~/repos/qemu/build/qemu-system-riscv64 -nographic -M virt -smp 4 -m 2G -display none -serial stdio -monitor none -bios default -kernel'
alias qemu-riscv-64-up='~/repos/qemu/build/qemu-system-riscv64       -nographic -M virt        -m 2G -display none -serial stdio -monitor none -bios default -kernel'
alias quit='exit'
alias random-8-hex-chars='xxd -l 4 -p /dev/urandom'
alias scd='cd'
alias sl="ls"
alias tmux-switch-to-dark="tmux source-file ~/.tmux_dark.conf"
alias tmux-switch-to-light="tmux source-file ~/.tmux_light.conf"
alias top-real="/usr/bin/top"
alias top="htop -d 20"
alias tree="tree -C"
alias unmount="umount"  # Why it wasn't created as 'unmount' is baffling to me.
alias vi-orig='/usr/bin/vi'
alias vi='nvim'
alias view-orig='usr/bin/view'
alias view='nvim -R'
alias vim-orig='/usr/bin/vim'
alias vim='nvim'
alias vimdiff-orif='/usr/bin/vimdiff'
alias vimdiff='nvim -d'
alias watch-1s-diff='watch -n1 -d'      # One second interval and highlight differences
alias watch-30s-diff='watch -n30 -d'
alias watch-docker-ps='watch -n1 -d docker ps -a --format "{{.ID}}\\\\t{{.Command}}\\\\t{{.Status}}\\\\t{{.Image}}"'
alias watch-ll='watch -n1 -d -c ls -la --color=always'
alias who-just-names-uniq="who | cut -f 1 -d ' ' | sort | uniq"
alias x='xclip -selection clipboard'
alias xclip='xclip -selection clipboard' # Default xclip to system clipboard

alias cal-image-strip-metadata='mogrify -strip'
