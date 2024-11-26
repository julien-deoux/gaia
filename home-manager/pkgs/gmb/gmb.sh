#!/bin/sh

git stash
branch=`git branch --show-current`
git checkout beta
git fetch --all
git reset --hard origin/beta
git merge $branch
if [ $? -eq 0 ]; then
  git push
  git checkout $branch
fi

