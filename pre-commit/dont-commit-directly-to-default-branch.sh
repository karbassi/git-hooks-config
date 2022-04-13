#!/usr/bin/env bash

# Gets local head to origin's default branch
# From the docs:
#   With -a or --auto, the remote is queried to determine its HEAD, then the
#   symbolic-ref refs/remotes/<name>/HEAD is set to the same branch. e.g., if
#   the remote HEAD is pointed at next, git remote set-head origin -a will set
#   the symbolic-ref refs/remotes/origin/HEAD to refs/remotes/origin/next.
#   This will only work if refs/remotes/origin/next already exists; if not it
#   must be fetched first.
# ref: https://git-scm.com/docs/git-remote#Documentation/git-remote.txt-emset-headem
git remote set-head origin --auto

DEFAULT_BRANCH=$(git symbolic-ref refs/remotes/origin/HEAD | sed 's@^refs/remotes/origin/@@')
CURRENT_BRANCH="$(git rev-parse --abbrev-ref HEAD)"

if [ "$CURRENT_BRANCH" = "$DEFAULT_BRANCH" ]; then
  echo "You can't commit directly to $DEFAULT_BRANCH branch"
  exit 1
fi
