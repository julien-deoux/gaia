#!/bin/sh

git branch --merged master | egrep -v "(^\*|master|beta)"
