#!/bin/sh

echo "
http ALL=(ALL) NOPASSWD: /srv/http/suid_scripts/create_first_level.sh
http ALL=(ALL) NOPASSWD: /srv/http/suid_scripts/create_level_with_predecesor.sh
http ALL=(ALL) NOPASSWD: /srv/http/suid_scripts/delete_user.sh" >> /etc/sudoers

mount --bind /pwn-workshops/infrastructure/ /srv/http/

chown -R root:http /pwn-workshops/
chmod 750 -R /pwn-workshops/
