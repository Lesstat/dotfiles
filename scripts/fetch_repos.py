#!/usr/bin/env python3

from enum import IntFlag
from pathlib import Path
from pygit2 import Repository, discover_repository, GitError, GIT_MERGE_ANALYSIS_FASTFORWARD
from sys import argv
from contextlib import suppress


def find_repositories_in(path):
    """Traverse directory tree beneath path.
       Returns a generator of all git repositories in the tree"""
    dirs = [path]
    for p in dirs:
        for dir in subdirs(p):
            try:
                yield Repository(str(dir))
            except GitError:
                dirs.append(dir)


def fetch(repos):
    """Tries to fetch all remotes of all repos.
       Return a generator of all repos with a successful fetch"""
    for repo in repos:
        yielded = False
        for remote in repo.remotes:
            with suppress(GitError):
                remote.fetch()
                if not yielded:
                    yield repo
                    yielded = True


def update(repos):
    """Does fast forward merge for every repo where this is possible"""
    for repo in repos:
        head = repo.head
        branch = repo.lookup_branch(head.shorthand)
        upstream = branch.upstream
        # pseudo-code...
        if fast_forward_possible(repo, upstream):
            head.set_target(upstream.target)
            print(f'updated {repo}')


def fast_forward_possible(repo, upstream):
    if not upstream:
        return False
    analysis, _ = repo.merge_analysis(upstream.target)
    return analysis & GIT_MERGE_ANALYSIS_FASTFORWARD


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
