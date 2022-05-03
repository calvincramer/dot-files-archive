#!/usr/bin/python3
import os.path
from os.path import dirname, realpath, join, expanduser
from shutil import copy2
from pathlib import Path

ARCHIVE_DIR = join(dirname(realpath(__file__)), 'dot-files')

# Add the files here you want saved:
PATHS_DICT = {
    '.bash_aliases':    '~/.bash_aliases',
    '.bash_aliases_wr': '~/.bash_aliases_wr',
    '.bash_profile':    '~/.bash_profile',
    '.bashrc':          '~/.bashrc',
    '.bashrc_wr':       '~/.bashrc_wr',
    '.gdbinit':         '~/.gdbinit',
    '.gitconfig':       '~/.gitconfig',
    '.inputrc':         '~/.inputrc',
    '.plan':            '~/.plan',
    '.profile':         '~/.profile',
    '.rhosts':          '~/.rhosts',
    '.selected_editor': '~/.selected_editor',
    '.tmux.conf':       '~/.tmux.conf',
    '.tmux_dark.conf':  '~/.tmux_dark.conf',
    '.tmux_light.conf':  '~/.tmux_light.conf',
    '.toprc':           '~/.toprc',
    '.vimrc':           '~/.vimrc',
    '.Xresources':      '~/.Xresources',
    '.xscreensaver':    '~/.xscreensaver',
    '.xstartup':        '~/.vnc/xstartup',
}
# ~/.config/
# ~/.private/

def copy_to_archive(name, path):
    # Expand any '~' home tildes
    path = expanduser(path)
    # Resolve relative and synlinks in path:
    path = Path(path).resolve()

    # See if file exists
    if not os.path.exists(path):
        print(f'Does not exist: {name} -> {path}')
        return
    if not os.path.isfile(path):
        print(f'Exists, but is not a file: {name} -> {path}')
        return

    # Copy
    copy2(src=path, dst=ARCHIVE_DIR, follow_symlinks=True)


def main():
    for name, path in PATHS_DICT.items():
        copy_to_archive(name, path);


if __name__ == '__main__':
    main()
