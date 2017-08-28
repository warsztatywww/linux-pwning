#!/bin/sh

timedatectl set-ntp true;

echo "PARTITIONING DISK";
sfdisk /dev/sda < partition_script;
yes | mkfs.ext4 /dev/sda3
yes | mkfs.fat -F32 /dev/sda1
yes | mkswap /dev/sda2
mount /dev/sda3 /mnt
mkdir /mnt/boot
mount /dev/sda1 /mnt/boot
swapon /dev/sda2

echo "INSTALLING BASE PACKAGES"
pacstrap /mnt base base-devel

echo "CONFIGURING SYSTEM"
genfstab -U /mnt > /mnt/etc/fstab
#hide pid
echo "proc	/proc	proc	nosuid,nodev,noexec,hidepid=2,gid=proc	0	0" >> /mnt/etc/fstab
echo "kernel.dmesg_restrict = 1" >> /mnt/etc/sysctl.d/50-dmesg-restrict.conf
echo "kernel.kptr_restrict = 1" >> /mnt/etc/sysctl.d/50-kptr-restrict.conf
echo "* soft nproc 200" >> /mnt/etc/security/limits.conf
echo "* hard nproc 300" >> /mnt/etc/security/limits.conf

mkdir /mnt/prepare_vm
cp -r ~/install_arch /mnt/prepare_vm/
arch-chroot /mnt /prepare_vm/install_arch/install2.sh

echo "REBOOTING"
reboot



