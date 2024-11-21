#!/usr/bin/env python3

# Copy config files to a folder

import os
import os.path
from os.path import dirname, realpath, join, expanduser, basename
from shutil import copy2
from pathlib import Path
from argparse import ArgumentParser

ARCHIVE_DIR = join(dirname(realpath(__file__)), "archive")

PATHS = [
    "~/.bash_aliases",
    "~/.bash_profile",
    "~/.bashrc",
    "~/.zshrc",
    "~/.oh-my-zsh/themes/crunch-calvin.zsh-theme",
    "~/.gdbinit",
    "~/.gitconfig",
    "~/.inputrc",
    "~/.plan",
    "~/.profile",
    "~/.selected_editor",
    "~/.tmux.conf",
    "~/.tmux_dark.conf",
    "~/.tmux_light.conf",
    "~/.toprc",
    "~/.vimrc",
    "~/.Xresources",
    "~/.vnc/xstartup",
    "~/.config/k9s/skin.yml",
    "~/.config/nvim/init.vim",
    "~/.config/nvim/_init.lua",
    "~/.alacritty.toml",
]


def _pathRealToSave(_path: str) -> str:
    return _path.replace(os.path.sep, "|")


def getLocalAndArchivePath(_path: str):
    archive_path = join(ARCHIVE_DIR, _pathRealToSave(_path))
    # Expand any '~' home tildes, then resolve relative and synlinks
    local_path = Path(expanduser(_path)).resolve()
    return str(local_path), str(archive_path)


def _check_file(_path: str):
    name = basename(_path)
    local_path, archive_path = getLocalAndArchivePath(_path)
    if not os.path.exists(local_path):
        print(f"Does not exist: {name}: {local_path}")
        return False, None, None
    if not os.path.isfile(local_path):
        print(f"Exists, but is not a file: {name}: {local_path}")
        return False, None, None
    return True, str(local_path), str(archive_path)


def check_files():
    """Check files to be archived exist locally"""
    all_good = True
    for _path in PATHS:
        ok, _, _ = _check_file(_path)
        if not ok:
            all_good = False
    if all_good:
        print("All good!")
    return None


def save():
    """Copy local files to the archive"""
    for _path in PATHS:
        ok, local, archive = _check_file(_path)
        if not ok:
            continue
        copy2(src=local, dst=archive, follow_symlinks=True)
    return None


def diff(diff_dir_is_archive_to_local: bool):
    """Diff local and archive"""
    for _path in PATHS:
        ok, local, archive = _check_file(_path)
        if not ok:
            continue
        left = archive if diff_dir_is_archive_to_local else local
        right = local if diff_dir_is_archive_to_local else archive
        os.system(f"diff --color=always --unified '{left}' '{right}'")
    return None


def restore():
    """Copy archive to local"""
    for _path in PATHS:
        local, archive = getLocalAndArchivePath(_path)
        if not os.path.isfile(archive):
            print(f"Missing saved file: {archive}")
            continue
        if os.path.isfile(local):
            print(f"Overriding local {local}")
        print(f"cp {archive} -> {local}")
        # copy2(src=archive, dst=local, follow_symlinks=True)
    return None


def main():
    # Args
    parser = ArgumentParser()
    group = parser.add_mutually_exclusive_group()
    group.add_argument(
        "--check-files",
        action="store_true",
        required=False,
        help="Check that the files to be archived exist on your machine",
    )
    group.add_argument(
        "--save",
        action="store_true",
        required=False,
        help="Save local files to archive",
    )
    group.add_argument("--diff-la", action="store_true", required=False, help="Diff local to archive")
    group.add_argument("--diff-al", action="store_true", required=False, help="Diff archive to local")
    group.add_argument(
        "--restore-DANGER",
        action="store_true",
        required=False,
        help="Copy archive files to local files. DANGEROUS. WILL OVERWRITE YOUR LOCAL FILES WITH THE CONTENT IN THE ARCHIVE.",
    )
    args = parser.parse_args()

    if args.check_files is True:
        check_files()
    elif args.save is True:
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


if __name__ == "__main__":
    main()
