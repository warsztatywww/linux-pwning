#!/bin/sh
#Usage: [username] [password] [level_dir] [validation_token] [prev_user] [prev_level_dir]

#TODO: add a user input filter in case someone p0wn the web server
#An attacker who gets a shell could read any file on the system without a ".." filter :)

hashedpass=$(python3 -c 'import crypt; print(crypt.crypt("'"$2"'", crypt.mksalt(crypt.METHOD_SHA512)))')
useradd -s /bin/bash -U -p "$hashedpass" -m -b /haxing "$1"

echo 'cat /haxing/'"$1"'/README;
curl -L -k "localhost/log_progress.php?user='"$1"'&token='"$4"'";
zsh;
logout;' > /haxing/"$1"/.bash_profile

#prepare the current level
cp -r "$3"/home/. /haxing/"$1"        #create level files
mkdir /haxing/"$1"/workspace/         #create workspace
chown -R "$1":"$1" /haxing/"$1"       #set ownership
chmod -R 770 /haxing/"$1"             #set permissions

chattr +i -R /haxing/"$1"             #set immutable bit for the home dir
chattr -i -R /haxing/"$1"/workspace/  #remove the immutable bit for the workspace
chattr -i /haxing/"$1"                #allow user to write to home dir

#set up the previous level
chattr -i -R /haxing/"$5"             #remove the immutable bit for the previous user

echo "$2" >> /haxing/"$5"/"$(cat "$6"/password_file)"      #save the password for the previous user

chown "$1":"$1" /haxing/"$5"/"$(cat "$6"/password_file)"   #set ownership
chown "$1":"$1" /haxing/"$5"/"$(cat "$6"/forbidden_files)" #set ownership
chown "$1":"$5" /haxing/"$5"/"$(cat "$6"/suid_files)"      #set ownership

chmod -R 770 /haxing/"$5"                         #ensure permissions
chmod u+s /haxing/"$5"/"$(cat "$6"/suid_files)"  #set the suid flag on files

chown "$5":"$5" /haxing/"$5"
chattr +i -R /haxing/"$5"             #set the immutable bit for the previous user
chattr -i -R /haxing/"$5"/workspace   #remove the immutable bit for the previous user's workspace
chattr -i /haxing/"$5"                #allow user to write to home dir
