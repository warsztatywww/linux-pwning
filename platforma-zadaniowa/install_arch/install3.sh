#!/bin/sh

#------------------------------------------------------
#Software
#------------------------------------------------------
echo "Obtaining Connectivity"
dhcpcd -k
dhcpcd

echo "Installing software"
yes | pacman --needed -S $(cat /prepare_vm/install_arch/software_list | tr '\n' ' ')

pkgfile --update

#set the root shell to zsh
#chsh -s /bin/zsh root

#------------------------------------------------------
#MariaDB
#------------------------------------------------------
#configure the database
echo "Configuring the database"
mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

sed -i '/skip-networking/        s/#//g'         /etc/mysql/my.cnf

systemctl start mysqld
systemctl enable mysqld

echo "CREATE DATABASE warsztaty;" | mysql -u root
echo "CREATE USER 'warsztaty'@'localhost' IDENTIFIED BY 'www13';" | mysql -u root
echo "User warsztaty created"
echo "GRANT ALL PRIVILEGES ON mydb.* TO 'warsztaty'@'localhost';
FLUSH PRIVILEGES;" | mysql -u root
echo "GRANT ALL PRIVILEGES ON warsztaty.* TO 'warsztaty'@'localhost';
FLUSH PRIVILEGES;" | mysql -u root

#------------------------------------------------------
#PHP & Apache
#------------------------------------------------------
#configure the webserver
echo "Configuring the webserver"
sed -i '/extension=pdo_mysql.so/ s/^;//g'        /etc/php/php.ini
sed -i '/extension=mysqli.so/    s/^;//g'        /etc/php/php.ini

sed -i '/mod_mpm_prefork.so/     s/^#//g'        /etc/httpd/conf/httpd.conf
sed -i '/mod_mpm_event.so/       s/^[^#]/#&/g'   /etc/httpd/conf/httpd.conf

sed -i '/LoadModule rewrite_module/ a LoadModule php7_module modules/libphp7.so\
AddHandler php7-script php'                      /etc/httpd/conf/httpd.conf

sed -i '/Include .*ssl\.conf/ a Include conf/extra/php7_module.conf' /etc/httpd/conf/httpd.conf

systemctl start httpd
systemctl enable httpd


#------------------------------------------------------
#SSH
#------------------------------------------------------
echo "Configuring SSH"
sed -i 's/^#PermitRootLogin prohibit-password$/PermitRootLogin without-password/'   /etc/ssh/sshd_config
mkdir ~/.ssh

echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCU3q5xhtbZwqEtA99rIZ3MHky7/sf02m2NxkAbQwKdpTPMm0AqQWLfzfexWFYP55KJy1iVJzvkjDKGqdkLspJ0sl6x/cXM8auLbYSjXYBqxv8JyoNX7pqZ8ZTjbJjmhI4CSoGI2pSZfy3Mqv6i0KU8LP/wSZXQPp7CJEOtQ4G6WhS60hciHSGJ2LqabMglatYmaOanlqPGbixDYPVdgx/4W272dz62DlMeX5MTXTBmUqZZPBysWkEtb4R7R5kpCcPYK9i0bhei6zTm1YqqvAqjc9hXu0PlnKoLsJpDbk6PI6yUCzHKZRxzuTnqxz0ILInxBwyZ/FjJSgGIwyxRLR/1 grzegorz@HP-ProBook-4740s" > ~/.ssh/authorized_keys

chmod 400 ~/.ssh/authorized_keys
chattr +i -R ~/.ssh

systemctl start sshd
systemctl enable sshd

#------------------------------------------------------
#CleanUp
#------------------------------------------------------
#echo "Disabling this script"
systemctl disable install_software.service

#Cleanup
#rm -r /prepare_vm
#rm /usr/bin/install_software
#rm /etc/systemd/system/install_software.service

echo "REMEMBER TO CLONE THE REPOSITORY AND INSTALL THE INFRASTRUCTURE"
