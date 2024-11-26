#!/bin/sh

git stash
branch=`git branch --show-current`
git checkout beta
git fetch --all
git reset --hard origin/master
git push --force
git checkout $branch
