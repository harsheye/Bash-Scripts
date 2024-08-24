#!/bin/bash

clear

echo
echo
echo "				 Welcome to dhcp file creator				 "
echo

#_________________________________________________________________________________________
#
#
#                       Asking for the mount and configuring yum
#
#
#_________________________________________________________________________________________
        echo " Do you want to mount and then create a repo file yes/no ...... "
        echo -n "=> "
        read repos


	if [ $repos = yes ]; then
	echo " it will delete all files named  *.repo"
	echo -n " are you sure: yes/no "
	read sure

#
#	Create and mounting yum repositry
#

		if [ $sure = yes ]; then
	find /etc/yum.repos.d/ -iname "*.repo" -exec rm -rf {} \; > /dev/null
        z=`systemctl stop firewalld`
        mount /dev/sr0 /mnt > /dev/null

        touch /etc/yum.repos.d/mount.repo > /dev/null
	
        echo "[RHEL]" > /etc/yum.repos.d/mount.repo
        echo "name=rhel server
baseurl=file:///mnt
enabled=1
gpgcheck=0" >> /etc/yum.repos.d/mount.repo

        yum repolist > /dev/null


        yum install dhcp -y > /dev/null


#
#       Yum repoistry ends here
#
		fi

        else



        yum install dhcp -y > /dev/null



        fi

#
#       If comand completed
#
echo
echo " we are takin 10 sec break in order if error occur u get it "
sleep 10
systemctl enable dhcpd > /dev/null
ipadd=`nmcli connection show enp0s3:wq | grep ip_address | cut -c 54-`
cp /etc/dhcp/dhcpd.conf /etc/dhcp/dhcpd.conf.copy
echo
echo
clear
echo
echo
echo " your ip : $ipadd "
echo
echo
echo " Enter the starting of range "
echo -n "=> "
read range1

echo
echo " Enter the ending of range "
echo -n "=> "
read range2

net=`nmcli connection show enp0s3:wq | grep subnet_mask | tail -1 | cut -c 55-`
sub=`nmcli connection show enp0s3:wq | grep network_number | cut -c 58-`
echo
echo " Enter the lease-time "
echo -n "=> "
read lea

mal=`expr $lea + $lea`
echo "default-lease-time $lea;
max-lease-time $mal;
#ddns-update-style $lea;
subnet $sub netmask $net
{
	range $range1 $range2;
} " > /etc/dhcp/dhcpd.conf

echo
echo
clear
echo
echo
echo " Look we have done our job, look at the file once"
echo
echo
echo
echo " we are opening the file for u in 10sec"
sleep 10
vim /etc/dhcp/dhcpd.conf

systemctl restart dhcpd

if [ $? -eq 0 ]; then
echo
echo
	echo " the job was successful"
else
echo
echo
	echo " some problems are there look at them "
echo
echo
echo
	cat /var/log/messages | tail -20
fi
