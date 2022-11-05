#!/usr/bin/env python3

# Copy config files to a folder

import os.path
from os.path import dirname, realpath, join, expanduser, basename
from shutil import copy2
from pathlib import Path
from argparse import ArgumentParser, Namespace

ARCHIVE_DIR = join(dirname(realpath(__file__)), 'archive')

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
    '~/.config/nvim/_init.lua',
]

def save() -> None:
    """Copy local files to the archive"""
    def _copy_to_archive(name: str, p: str) -> None:
        save_to = str(p).replace(os.path.sep, '|')    # Preserve path info
        save_to = join(ARCHIVE_DIR, save_to)
        p = expanduser(p)     # Expand any '~' home tildes
        p = Path(p).resolve() # Resolve relative and synlinks in path:
        if not os.path.exists(p):
            print(f'Does not exist: {name} -> {p}')
            return None
        if not os.path.isfile(p):
            print(f'Exists, but is not a file: {name} -> {p}')
            return None
        copy2(src=p, dst=save_to, follow_symlinks=True)
        return None

    for path in PATHS:
        _copy_to_archive(basename(path), path)
    return None

def diff(diff_dir_is_archive_to_local: bool) -> None:
    """Diff local and archive"""
    pass

def restore() -> None:
    """Copy archive to local"""
    pass

def main() -> None:
    # Args
    parser = ArgumentParser()
    group = parser.add_mutually_exclusive_group()
    group.add_argument("--save", action='store_true', required=False, help="Save local files to archive")
    group.add_argument("--diff-la", action='store_true', required=False, help="Diff local to archive")
    group.add_argument("--diff-al", action='store_true', required=False, help="Diff archive to local")
    group.add_argument("--restore-DANGER", action='store_true', required=False, help="Copy archive files to local files. DANGEROUS. WILL OVERWRITE YOUR LOCAL FILES WITH THE CONTENT IN THE ARCHIVE.")
    args = parser.parse_args()

    if args.save is True:
        save()
    elif args.diff_la is True:
        diff(diff_dir_is_archive_to_local=False)
    elif args.diff_al is True:
        diff(diff_dir_is_archive_to_local=True)
    elif args.restore_DANGER is True:
        restore()
    else:
        parser.print_help()
    return None

if __name__ == '__main__':
    main()
