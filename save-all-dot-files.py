#!/usr/bin/python3

# Copy config files to a folder

import os.path
from os.path import dirname, realpath, join, expanduser, basename
from shutil import copy2
from pathlib import Path

ARCHIVE_DIR = join(dirname(realpath(__file__)), 'dot-files')

PATHS = [
    '~/.bash_aliases',
    '~/.bash_profile',
    '~/.bashrc',
    '~/.gdbinit',
    '~/.gitconfig',
    '~/.inputrc',
    '~/.plan',
    '~/.profile',
    '~/.rhosts',
    '~/.selected_editor',
    '~/.tmux.conf',
    '~/.tmux_dark.conf',
    '~/.tmux_light.conf',
    '~/.toprc',
    '~/.vimrc',
    '~/.Xresources',
    '~/.xscreensaver',
    '~/.vnc/xstartup',
    '~/.config/k9s/skin.yml',
    '~/.config/nvim/init.vim',
]

def copy_to_archive(name: str, p: str) -> bool:
    save_to = str(p).replace(os.path.sep, '|')    # Preserve path info
    save_to = join(ARCHIVE_DIR, save_to)
    p = expanduser(p)     # Expand any '~' home tildes
    p = Path(p).resolve() # Resolve relative and synlinks in path:
    if not os.path.exists(p):
        print(f'Does not exist: {name} -> {p}')
        return False
    if not os.path.isfile(p):
        print(f'Exists, but is not a file: {name} -> {p}')
        return False
    copy2(src=p, dst=save_to, follow_symlinks=True)
    return True


def main():
    for path in PATHS:
        copy_to_archive(basename(path), path);


if __name__ == '__main__':
    main()
