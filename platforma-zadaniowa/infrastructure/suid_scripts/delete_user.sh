#!/bin/sh

#USAGE: ./delete_user.sh [USERNAME]

#TODO: add a username blacklist
#An attacker who gets a shell could delete any account :)

chattr -i -R /haxing/"$1" #remove the immutable bit
userdel -rf "$1"
groupdel -f "$1"
