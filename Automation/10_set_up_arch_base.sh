#!/bin/bash

echo "Please connect to the internet,If you already did not!"
echo "If you want to connect to wifi, type y"
read ans
if [ ans =  'y' ]
then
     wifi-menu
fi


echo "Create or modify the partitions to install"
echo "Do not forget to create a swap partition"
echo "Press y to open cfdisk"
read ans
if [ ans =  'y' ]
then
     echo "Enter the hard disk name, If unsure use lsblk command to check !"
     read disk
     cfdisk $disk
fi

echo "Enter the partiton name to format it"
read part
mkfs.ext4 /dev/$part

echo "Enter y, if you want to use swap"
read ans
if [ ans =  'y' ]
then
     echo "Enter the swap partition name"
     read swap_part
     mkswap /dev/$swap_part
     swapon /dev/$swap_part	
fi

echo "Lets start mounting !"
echo "Enter the partition to install arch"
read main_partition
mount /dev/$main_partition /mnt

pacstrap /mnt base base-devel

echo "Lets now generate fstab file!"
genfstab /mnt >> /mnt/etc/fstab

arch-chroot /mnt

echo "Lets install the basic wifi"
pacman -S wpa_supplicant networkmanager iw 

echo "Enter the name for your machine "
vi /etc/hostname 

umount /mnt

reboot



 
 
