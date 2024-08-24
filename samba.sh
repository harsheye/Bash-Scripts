#!/bin/bash

#
#		Welcome to automatically samba creater
#



#_________________________________________________________________________________________
#
#
#			Asking for the mount and configuring yum
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


	yum install samba -y > /dev/null


#
# 	Yum repoistry ends here
#
		fi
	else
		yum install samba -y >/dev/null
	fi
#
#
# Mounting done
#
#
	systemctl enable smb
	systemctl start smb

#
#		Creating a backup in case
#
	cp /etc/samba/smb.conf /etc/samba/smb.conf.back

	
#
#		Editing the samba File
#	
	echo " Enter the location which you want to share "
	echo -n "=> "
	read loc
	echo
	echo
	echo " Do you want it browsable:  Yes/No "
	echo -n "=> "
	read bro
	echo
	echo
	echo " Do you want readonly: Yes/No "
	echo -n "=> "
	read rea
da=`date +m%d` 
		
echo "[Harsh $da]
	comment = root directory
	path = $loc
	browsable = $bro
	read only = $rea"  >> /etc/samba/smb.conf

	systemctl restart smb

#
#			Searching for the user in the pc
#

       z=`cat /etc/passwd | grep /home | head -1 | cut -f1 -d':'`
	
echo " Now we are creating a user for samba"
echo
echo " your username is $z"
echo " and your password will be only known to you "
	smbpasswd -a $z

sleep 3
systemctl restart smb

echo " try to login into smb "

ip=`ip a | grep inet | grep global | colrm 1 4 | cut -f2 -d' ' | tr '/' ' ' | cut -f1 -d' ' | head -1`	
echo " enter \\$ip	in your file explorerr "
