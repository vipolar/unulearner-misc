#!/bin/bash

GIT_EMAIL="miskuzius@gmail.com"
GIT_USERNAME="vipolar"
GIT_EDITOR="vim"

# Make sure only non-root can run the script
if [[ $EUID -ne 0 ]]; then
   echo "Elevated permissions are required to setup new user!" 1>&2
   exit 1
fi

read -p "Enter username for the new user: " username

adduser $username
usermod -aG sudo $username
echo "$username ALL=(ALL:ALL) ALL" | tee /etc/sudoers.d/"$username" > /dev/null
chmod 0440 /etc/sudoers.d/"$username"

su -l $username -c "git config --global user.email "$GIT_EMAIL""
su -l $username -c "git config --global user.name "$GIT_USERNAME""
su -l $username -c "git config --global core.editor "$GIT_EDITOR""
