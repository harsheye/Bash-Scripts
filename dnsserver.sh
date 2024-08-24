#!/bin/bash




clear



#
#
#
#This scripts is to make a dns file automatically
#
#
#
#


x=`getenforce`
iptables -F

echo -n " Enter the site name plz .........."
read site
echo -n " Enter the ip address of site ........ "
read ipa
#
# Making a if loop for checking getenfore
#
y=`test Enabled != $x`

if [ $? -eq 0 ]; then




#_________________________________________________________________________________________
#
#
#			Asking for the mount and configuring yum
#
#
#_________________________________________________________________________________________
	echo -n " do you want to mount and then create a repo file yes/no ...... "
	read repos


#
#	Create and mounting yum repositry
#
	if [ $repos = yes ]; then

	z=`systemctl stop firewalld`
	mount /dev/sr0 /mnt > /dev/null
	
	touch /etc/yum.repos.d/mount.repo > /dev/null

	echo "[RHEL]" > /etc/yum.repos.d/mount.repo
	echo "name=rhel server
baseurl=file:///mnt
enabled=1
gpgcheck=0" >> /etc/yum.repos.d/mount.repo

	yum repolist > /dev/null 


	yum install bind bind-utils named lsof -y > /dev/null


#
# 	Yum repoistry ends here
#


	else



	yum install bind bind-utils named lsof -y > /dev/null



	fi

#
#	If comand completed
#
	

#_ _______________________________________________________________________________________
#
#
#			Creating a /etc/named.rfc1912.zones file
#
#
#________________________________________________________________________________________

	echo "zone \"$site\" IN {
		type master;
		file \"$site.zone\";
}; " >> /etc/named.rfc1912.zones

      check=`named-checkconf /etc/named.rfc1912.zones`


#______________________________________________________________________
#		Checked the file if it is correct or not
#______________________________________________________________________




#_________________________________________________________________________________________
#
#
#			Creating a /var/named/sit.zone  file
#
#
#________________________________________________________________________________________

	 if [ $? -eq 0 ]; then
		touch /var/named/$site.zone
date=` date +%Y%m%d`
hostenam=`hostname`
		echo "\$ttl 1D
@	IN	SOA	station1.example.com.	webmaster.gmail.com. (
			$date	; serial No
			1D	; refresh time
			1H	; retry time
			1D	; maximum retry time
			1D)	; maximum cache time	

$site.		IN	NS	$hostenam.
$site.		IN	A	$ipa
www.$site.	IN	CNAME	$site." > /var/named/$site.zone 



#
#	checking if this file is correct
#


	named-checkzone	$site /var/named/$site.zone
		if [ $? -eq 1 ]; then
			echo " Something wrong with file"
			echo " Entering the file"
			sleep 10 
			vim /var/named/$site.zone
		fi

echo
echo
echo
echo " This is our request you must check the /var/named/$site.zone file "
echo
echo

echo -n " Enter yes/no ... "
read fileo

			if [ $fileo = yes ]; then

				vim /var/named/$site.zone

			else

				echo " its your choice that file might be wrong"
			fi
	 else
			

		echo " first check the /etc/named.rfc1912.zones file"

	 fi	
	

	

fi


