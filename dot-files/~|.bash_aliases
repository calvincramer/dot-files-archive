# Calvin's aliases
# ~ is /home/cal for me.

# ls aliases:
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands. Use like so:    sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Random:
alias CD='cd'
alias df-calvin='df -hlPT'
alias disk-usage-as-su='sudo baobab'
alias fix='reset; stty sane; tput rs1; clear; echo -e "\033c"'                  # sometimes tmux breaks terminal stuff, can trigger with fast `git log, q` plus maximizing / un-maximizing pane
alias folder-size-sorted="du -hd1 | sort -h"
alias folder-size="du -hd1"
alias grepfiles="grep -lm1"
alias top="htop -d 20"
alias top-real="/usr/bin/top"
alias i="top"
alias ks="ls"
alias less-color="less -r"
alias ls-absolute="readlink -f *"
alias LS='ls'
alias lsabsolute="readlink -f *"
alias objDump='objdump'
alias quit='exit'
alias scd='cd'
alias sl="ls"
alias unmount="umount"  # Why it wasn't created as 'unmount' is baffling to me.
alias who-just-names-uniq="who | cut -f 1 -d ' ' | sort | uniq"
alias x='xclip -selection clipboard'
alias xclip='xclip -selection clipboard'                                        # Default xclip to system clipboard
alias docker-rm-exited-containers='docker ps -a | grep "Exited" | cut -d" " -f1 | xargs docker rm'

# Tmux
alias tmux-switch-to-light="tmux source-file ~/.tmux_light.conf"
alias tmux-switch-to-dark="tmux source-file ~/.tmux_dark.conf"

# Vim -> nvim
alias vi-orig='/usr/bin/vi'
alias vim-orig='/usr/bin/vim'
alias view-orig='usr/bin/view'
alias vimdiff-orif='/usr/bin/vimdiff'
alias vi='nvim'
alias vim='nvim'
alias view='nvim -R'
alias vimdiff='nvim -d'

# Watch things
alias watch-1s-diff='watch -n1 -d'      # One second interval and highlight differences
alias watch-30s-diff='watch -n30 -d'
alias watch-ll='watch -n1 -d -c ls -la --color=always'
alias watch-docker-ps='watch -n1 -d docker ps -a --format "{{.ID}}\\\\t{{.Command}}\\\\t{{.Status}}\\\\t{{.Image}}"'

# Python code formatter
alias my-black="black -t py310 -l 160"

# Output color (these commands don't output color when piped or redirected)
alias diff-color="diff --color=always"
alias grep-color="grep --color=always"
alias grep-hilight="less -p"

# Git
alias git-log-pretty="git log --pretty=format:'%C(auto,yellow)%h %C(auto,blue)%>(12,trunc)%ad %C(auto,green)%<(10,trunc)%aN %C(auto,reset)%s %C(auto)(%gD%D)' --date=relative"
alias git-log-pretty-absolute-date="git log --pretty=format:'%C(auto,yellow)%h %C(auto,blue)%>(12,trunc)%ad %C(auto,green)%<(10,trunc)%aN %C(auto,reset)%s %C(auto)(%gD%D)' --date=short"
# Cleanup old clone
alias git-cleanup-fsck-prune-gc="git fsck --full --unreachable; git prune; git gc --aggressive"

# Start QEMU easily
alias qemu-riscv-32-up='~/repos/qemu/build/qemu-system-riscv32       -nographic -M virt        -m 2G -display none -serial stdio -monitor none -bios default -kernel'
alias qemu-riscv-32-smp4core='~/repos/qemu/build/qemu-system-riscv32 -nographic -M virt -smp 4 -m 2G -display none -serial stdio -monitor none -bios default -kernel'
alias qemu-riscv-64-up='~/repos/qemu/build/qemu-system-riscv64       -nographic -M virt        -m 2G -display none -serial stdio -monitor none -bios default -kernel'
alias qemu-riscv-64-smp4core='~/repos/qemu/build/qemu-system-riscv64 -nographic -M virt -smp 4 -m 2G -display none -serial stdio -monitor none -bios default -kernel'

alias qemu-ia-32-up='~/repos/qemu/build/qemu-system-i386             -nographic                -m 2G -machine q35 -cpu Nehalem -display none -serial stdio -monitor none -append "bootline:fs(0,0)host:vxWorks o=gei0" -kernel'
alias qemu-ia-32-smp4core='~/repos/qemu/build/qemu-system-i386       -nographic         -smp 4 -m 2G -machine q35 -cpu Nehalem -display none -serial stdio -monitor none -append "bootline:fs(0,0)host:vxWorks o=gei0" -kernel'
alias qemu-ia-64-up='~/repos/qemu/build/qemu-system-x86_64           -nographic                -m 2G -machine q35 -cpu Nehalem -display none -serial stdio -monitor none -append "bootline:fs(0,0)host:vxWorks o=gei0" -kernel'
alias qemu-ia-64-smp4core='~/repos/qemu/build/qemu-system-x86_64     -nographic         -smp 4 -m 2G -machine q35 -cpu Nehalem -display none -serial stdio -monitor none -append "bootline:fs(0,0)host:vxWorks o=gei0" -kernel'

# Add -enable-kvm for better performance
# TODO

alias cd-repos='cd ~/repos'
