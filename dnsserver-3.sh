#!/bin/bash


dnss() {

clear



MAXCOUNT=1
count=1

echo


while [ "$count" -le $MAXCOUNT ]      # Generate 10 ($MAXCOUNT) random integers.
do
  number=$RANDOM


  let "count += 1"  # Increment count.
done


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

echo " Enter the site name plz ...."
echo " It must conatin .com "
echo -n "=>  "
read site
echo  " Enter the ip address of site ...."
echo -n "=>  "
read ipa
echo
echo
echo
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


	yum install bind bind-utils named lsof -y > /dev/null


#
# 	Yum repoistry ends here
#
		fi

	else



	yum install bind bind-utils named lsof -y > /dev/null



	fi

#
#	If comand completed
#
clear

echo " YOu have to change something in a file which we will open in few sec\'s "
echo 
echo " You have to make change like this 

\" options {
   	     listen-on port 53 { 127.0.0.1; any; }; \"

	

and



Just few lines bellow 

      \"  allow-query     { localhost; any; };  \"  "

echo
echo
echo " hope you understood "
sleep 10
vim /etc/named.conf
__________________________________________________________________________________________
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


clear

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
@	IN	SOA	$hostenam.	webmaster.gmail.com. (
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

echo " Enter yes/no ... "
echo -n "=> "
read fileo

			if [ $fileo = yes ]; then

				vim /var/named/$site.zone

			else
				echo
				echo
				echo " its your choice that file might be wrong"
			fi
	 else
			

		echo " first check the /etc/named.rfc1912.zones file"

	 fi	
# ______________________________________________________________________________________
#
#
#					Reverse Lookup
#
#
#_______________________________________________________________________________________





clear
echo

echo " Do you also want to configure the Reverse DNS : yes/no ... "
echo -n "=> "
read reve

 if [ $reve = yes ]; then
	echo "So, Great you choose to do the Reverse DNS."
	
#__________________________________________________________________________________________
#
#
#			Creating a /etc/named.rfc1912.zones file
#
#
#________________________________________________________________________________________

echo " your ip was $ipa "
echo " Type the reverse lookup ip "
echo -n "=> "
read ripa

	echo "zone \"$ripa.in-addr.arpa\" {
		type master;
		file \"$site.reverse.zone\";
}; " >> /etc/named.rfc1912.zones

      check=`named-checkconf /etc/named.rfc1912.zones`


#______________________________________________________________________
#		Checked the file if it is correct or not
#______________________________________________________________________


clear

#_________________________________________________________________________________________
#
#
#			Creating a /var/named/site.reverse.zone  file
#
#
#________________________________________________________________________________________
touch /bin/ipa.txt > /dev/null





echo " $ipa " > /bin/ipa.txt
reverse=`cat /bin/ipa.txt | rev | cut -f1 -d'.' | rev`
	 if [ $? -eq 0 ]; then
		touch /var/named/$site.reverse.zone
date=` date +%Y%m%d`
hostenam=`hostname`
		echo "\$ttl 1D
@	IN	SOA	$hostenam.	webmaster.gmail.com. (
			$date	; serial No
			1D	; refresh time
			1H	; retry time
			1D	; maximum retry time
			1D)	; maximum cache time	

		IN	NS	$hostenam.
$reverse	IN	PTR	$site." > /var/named/$site.reverse.zone 



#
#	checking if this file is correct
#

rm -rf /bin/ipa.txt > /dev/null
	named-checkzone	$site /var/named/$site.reverse.zone
		if [ $? -eq 1 ]; then
			echo " Something wrong with file"
			echo " Entering the file"
			sleep 10 
			vim /var/named/$site.reverse.zone
		fi

	named-checkzone	$site /var/named/$site.reverse.zone

		
		if [ $? -eq 1 ]; then
			echo " Something wrong with file"
			echo " Entering the file"
			sleep 10 
			vim /var/named/$site.reverse.zone
		fi
echo
echo
echo
echo " This is our request you must check the /var/named/$site.zone file "
echo
echo

echo " Enter yes/no ... "
echo -n "=> "
read fileo

			if [ $fileo = yes ]; then

				vim /var/named/$site.reverse.zone
				echo
	echo
clear
	echo " We think that the dns is configured sucessfully "

			else
				echo
				echo
				echo " its your choice that file might be wrong"
			fi
	 else
			

		echo " first check the /etc/named.rfc1912.zones file"

	 fi	
	

#_________________________________________________________________________________________
#
#
#					Reverse lookup ends
#
#____________________________________________________________________________________________
	



	
 else

	echo " disable selinux "
	echo
	echo " Entering into selinux file"
	echo " Replace enable with disabled "
	sleep 10
	vim /etc/selinux/config
	echo
	clear
	echo
	echo " Now we are rebooting you pc in 10 sec"
	echo " after that you can run again this script "
	echo
	sleep 10
	reboot
	
	

 fi
fi

} 

dnss
