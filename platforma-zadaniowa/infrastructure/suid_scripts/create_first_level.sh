#!/bin/sh
#Usage: [username] [password] [level_dir]

#TODO: add a user input filter in case someone p0wn the web server
#An attacker who gets a shell could read any file on the system without a ".." filter :)

hashedpass=$(python3 -c 'import crypt; print(crypt.crypt("'"$2"'", crypt.mksalt(crypt.METHOD_SHA512)))')
useradd -s /bin/bash -U -p "$hashedpass" -m -b /haxing "$1"

echo 'cat /haxing/'"$1"'/README;
zsh;
logout' > /haxing/"$1"/.bash_profile
cp -r "$3"/home/. /haxing/"$1"        #create level files
mkdir /haxing/"$1"/workspace/         #create workspace
chown -R "$1":"$1" /haxing/"$1"       #set ownership
chmod -R 770 /haxing/"$1"             #set permissions

chattr +i -R /haxing/"$1"             #set immutable bit for the home dir
chattr -i -R /haxing/"$1"/workspace/  #remove the immutable bit for the workspace
chattr -i /haxing/"$1"                #allow user to write to home directory
