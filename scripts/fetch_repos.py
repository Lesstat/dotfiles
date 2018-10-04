#!/usr/bin/env python3

from pathlib import Path
from git import Repo, GitCommandError
from sys import argv
from contextlib import suppress


def find_repositories_in(path):
    """Traverse directory tree beneath path.
       Returns a generator of all git repositories in the tree"""
    dirs = [path]
    for p in dirs:
        for dir in subdirs(p):
            try:
                yield Repo(str(dir))
            except:
                dirs.append(dir)


def fetch(repos):
    """Tries to fetch all remotes of all repos.
       Return a generator of all repos with a successful fetch"""
    for repo in repos:
        yielded = False
        for remote in repo.remotes:
            with suppress(GitCommandError):
                remote.fetch()
                if not yielded:
                    yield repo
                    yielded = True


def update(repos):
    """Does fast forward merge for every repo where this is possible"""
    for repo in repos:
        remote_branch = repo.active_branch.tracking_branch()
        if remote_branch:
            repo.git.merge(f'{remote_branch.remote_name}/{remote_branch.remote_head}', '--ff-only')


def subdirs(paths):
    return (item for item in paths.iterdir() if item.is_dir())


def main():
    paths = argv[1:]
    for p in paths:
        root = Path(p).expanduser()
        repos = find_repositories_in(root)
        fetched_repos = fetch(repos)
        update(fetched_repos)


if __name__ == "__main__":
    main()
