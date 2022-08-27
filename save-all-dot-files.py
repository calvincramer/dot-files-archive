#!/usr/bin/python3

# Copy config files to a folder
# TODO: handle multiple files with same name

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
]

def copy_to_archive(name: str, path: str) -> bool:
    path = expanduser(path)     # Expand any '~' home tildes
    path = Path(path).resolve() # Resolve relative and synlinks in path:
    save_name = path.replace(os.path.sep, '|||')    # Preserve path info
    if not os.path.exists(path):
        print(f'Does not exist: {name} -> {path}')
        return False
    if not os.path.isfile(path):
        print(f'Exists, but is not a file: {name} -> {path}')
        return False
    copy2(src=path, dst=ARCHIVE_DIR, follow_symlinks=True)
    return True


def main():
    for path in PATHS:
        copy_to_archive(basename(path), path);


if __name__ == '__main__':
    main()
