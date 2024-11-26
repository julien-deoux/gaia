#!/bin/sh

branch=`git branch --show-current`
git push -u origin $branch
