#!/bin/bash

# Make sure only non-root can run the script
if [[ $EUID -eq 0 ]]; then
   echo "This script has to be run as non-root only!" 1>&2
   exit 1
fi

git config --global user.email "miskuzius@gmail.com"
git config --global user.name "vipolar"
git config --global core.editor "vim"
