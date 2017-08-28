#!/bin/sh

echo "CONFIGURING"
ln -sf /usr/share/zoneinfo/Europe/Warsaw /etc/localtime
hwclock --systohc
echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo "PWN_VM" > /etc/hostname
echo "127.0.1.1 PWN_VM.localdomain PWN_VM" >> /etc/hosts
sed -i '/pam_wheel.so use_uid/ s/#//g' /etc/pam.d/su

echo "INITIALIZING PACMAN"
pacman-key --init
pacman-key --populate archlinux
pacman-key --refresh-keys
pacman -Syy

echo "INSTALLING BOOT_LOADER"
yes | pacman -S refind-efi
refind-install --usedefault /dev/sda1 --alldrivers

UUID="$(blkid | grep sda3 | awk '{print $2}' | tr -d '"')"

echo "menuentry Workshops {
icon EFI/BOOT/icons/os_arch.png
loader vmlinuz-linux
initrd initramfs-linux.img
options \"rw root=$UUID\"
}" > /boot/EFI/BOOT/refind.conf

echo "CONFIGURE NETWORK"

echo "[Match]
Name=en*
Virtualization=yes

[Network]
DHCP=ipv4
DNS=8.8.8.8
DNS=8.8.4.4" > /etc/systemd/network/net.network

rm /etc/resolv.conf
ln -s /run/systemd/resolve/resolv.conf /etc/resolv.conf

systemctl enable systemd-networkd.service
systemctl enable systemd-resolved.service

echo "PREPARE FOR REBOOT"

echo "[Unit]
Description=SoftwareInstaller
Before=getty@tty1.service getty@tty2.service getty@tty3.service getty@tty4.service getty@tty5.service getty@tty6.service
Wants=network-online.target
After=network.target network-online.target

[Service]
Type=oneshot
ExecStart=/usr/bin/install_software
StandardOutput=kmsg+console

[Install]
WantedBy=multi-user.target" > /etc/systemd/system/install_software.service

cp /prepare_vm/install_arch/install3.sh /usr/bin/install_software
chmod 755 /usr/bin/install_software

systemctl enable install_software.service

echo "SETTING ROOT PASSWORD"
passwd
