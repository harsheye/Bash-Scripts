#!/bin/bash

#
#				Welcome to the Automated shuff 
#

# Function 1 ipcheck -190         Function 2 Sama  -330	Function 3 Dhcps -470
# Function 4 Dnss -870		   Function 5 iptab -2580

# Casse 2580


#
#	Funtion 1 ( ipchakup )   Till 190 Lines 
#

ipcheck() {






device=`nmcli device | head -2 | tail -1 | cut -f1 -d' '`

x=`ip a | grep inet | grep global | colrm 1 4 | cut -f2 -d' ' | tr '/' ' ' | cut -f1 -d' ' | head -1`	
		 
echo "you ip is : $x"
		  	

x1=`ping -c1 8.8.8.8 | head -2 | tail -1 | rev | cut -f1 -d' '`
	
	
	
	
x3=`ping -c1 $x | head -2 | tail -1 | rev | cut -f1 -d' '`

if [ $x3 = sm ] && [ $x1 = sm ]; then
	echo "connection is successfully completed"
else 
	ifdown $device



	ifup $device
   if [ $? -eq 0 ]; then
   	  			

			device=`nmcli device | head -2 | tail -1 | cut -f1 -d' '`

			 x=` ip a | grep inet | grep global | colrm 1 4 | cut -f2 -d' ' | tr '/' ' ' | cut -f1 -d' ' | head -1`	
		 
			 echo "you ip is : $x"
		  	

			x1=`ping -c1 8.8.8.8 | head -2 | tail -1 | rev | cut -f1 -d' '`
	
	
	
	
			x3=`ping -c1 $x | head -2 | tail -1 | rev | cut -f1 -d' '`

	if [ $x3 = sm ] && [ $x1 = sm ]; then
		echo "connection is successfully completed"
	else 
		ifdown $device
		ifup $device






			if [ $? -eq 0 ]; then
			
				echo "TYPE=Ethernet
				BOOTPROTO=dhcp
				EFROUTE=\"yes\"
				NAME=$device
				UUID=f8b3cfaf-af73-4e15-ad83-97a4b2762a7b
				DEVICE=$device
				ONBOOT=yes
				DEFROUTE=yes" > /etc/sysconfig/network-scripts/ifcfg-$device

					systemctl restart network
					ifdown $device
					ifup $device

		
					if [ $? -eq 0 ]; then
	  			
	
						device=`nmcli device | head -2 | tail -1 | cut -f1 -d' '`

						 x=` ip a | grep inet | grep global | colrm 1 4 | cut -f2 -d' ' | tr '/' ' ' | cut -f1 -d' ' | head -1`	
		 	 			echo "you ip is : $x"
		  	

						x1=`ping -c1 8.8.8.8 | head -2 | tail -1 | rev | cut -f1 -d' '`
	
	
	
	
						x3=`ping -c1 $x | head -2 | tail -1 | rev | cut -f1 -d' '`

							if [ $x3 = sm ] && [ $x1 = sm ]; then
								echo "connection is successfully completed"
							else 
	
								echo"try changing the network adapter in your machine manager"
						





	

							fi
		
					else
						
								echo"try changing the network adapter in your machine manager"
					fi
			

			fi
		

	fi
   else
	
			
				echo "TYPE=Ethernet
BOOTPROTO=dhcp
EFROUTE=\"yes\"
NAME=$device
DEVICE=$device
ONBOOT=yes
DEFROUTE=yes" > /etc/sysconfig/network-scripts/ifcfg-$device

					systemctl restart network
					ifdown $device
					ifup $device

		
					if [ $? -eq 0 ]; then
	  			
	
						device=`nmcli device | head -2 | tail -1 | cut -f1 -d' '`

						 x=` ip a | grep inet | grep global | colrm 1 4 | cut -f2 -d' ' | tr '/' ' ' | cut -f1 -d' ' | head -1`	
		 	 			echo "you ip is : $x"
		  	

						x1=`ping -c1 8.8.8.8 | head -2 | tail -1 | rev | cut -f1 -d' '`
	
	
	
	
						x3=`ping -c1 $x | head -2 | tail -1 | rev | cut -f1 -d' '`

							if [ $x3 = sm ] && [ $x1 = sm ]; then
								echo "connection is successfully completed"
							else 
	
								echo "try changing the network adapter in your machine manager"
						





	

							fi
		
					else
						echo"try changing the network adapter in your machine manager"
					fi

   fi

fi
 





}


#
#		Function 2 Samba  Till  330 Lines
#

sama() {





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




}









#
#	Function 3 Dhcps -470 
#

Dhcps() {




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




}





#
#	Function 4 Dnss -
#



Dnss() {


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
sleep 20
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

echo
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
reverse=`$ipa | cut -f1 -d'.'`
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



}















#
#	Function 5 iptab -
#

iptab() {


clear

#  important Information
#
#
# Line NO. 	  What is present
#
# 1500			While Loop
#	
# 1509			Case Start
#
# 22 - 314		All function
#
# 320 - 611		imcp function
#
# 613 - 902		udp function
#
# 905 - 1181		tcp function
#
# 1200 -1590		tcp & UDP function
#
#

all_po()


{
clear





clear
echo "					Welcome to UDP,TCP & IMCP			  "
echo "____________________________________________________________________________________"
echo
echo " 1) 	Incoming  Reject	"
echo " 2)	outgoing  Reject	"
echo " 3)	Incoming  ACCEPT	"
echo " 4) 	Outgoing  ACCEPT	"
echo " 0) 	list rules		"
echo " 9)	flush rules		"
echo
echo
	echo
	echo " Double press enter to go back "
echo
echo " v) 	execu the file		"

echo "____________________________________________________________________________________"
echo
echo -n " Enter your choice..........	"
read a1

case "$a1" in
 1)clear
	echo
	echo " __________________________________________________________________________"
	echo
	echo
	echo " 1)  protocol for specific IP     "
        echo " 2)  Protocol for whole world  "
        echo " 3)  all port for specific IP  "
        echo " 4)  all port for all world "
	echo
	echo " Double press enter to go back "
echo "___________________________________________________________________________"
	echo
	echo -n " Enter your choice.................  "
	read a2
	case "$a2" in
	 1) echo -n "Enter the ip to block incoming ....   "
	    read ip1
	    echo -n "Enter the protocol No .....  "
	    read po1
	    #z1=`iptables -A INPUT -p tcp -s $ip1 --dport $po1 -j REJECT`
	    echo "   "
	    z3=`iptables -A INPUT -p all -s $ip1 --dport $po1 -j REJECT`
	    echo " $z3 "
	    echo
		echo " press enter to continue ....... "
		read k ;;
	  
	 2) echo -n "Enter the protocol No .....  "
	    read po2
	    #z1=`iptables -A INPUT -p tcp --dport $po2 -j REJECT`
	    echo "   "
	    z3=`iptables -A INPUT -p all --dport $po2 -j REJECT`
	    echo " $z3 "
		echo
		echo " press enter to continue........ "
		read k ;;
	
	 3) echo -n "Enter the ip .....  "
	    read ip3
	    #z1=`iptables -A INPUT -p tcp -s $ip3 -j REJECT`
	    echo "   "
	    z3=`iptables -A INPUT -p all -s $ip3 -j REJECT`
	    echo " $z3 "
		echo
		echo " press enter to continue........ "
		read k ;;
	 4)
	    #z1=`iptables -A INPUT -p tcp -j REJECT`
	    echo "   "
	    z3=`iptables -A INPUT -p all -j REJECT`
	    echo " $z3 "
		echo
		echo " press enter to continue........ "
		read k ;;
	esac  ;;

	
 
 2)clear
	echo
	echo " __________________________________________________________________________"
	echo
	echo
	echo " 1)  protocol for specific IP     "
        echo " 2)  Protocol for whole world  "
        echo " 3)  all port for specific IP  "
        echo " 4)  all port for all world "


	echo
	echo " Double press enter to go back "

	echo "___________________________________________________________________________"
	echo
	echo -n " Enter your choice.................  "
	read a2a
	case "$a2a" in
	 1) echo -n "Enter the ip to block incoming ....   "
	    read ip1a
	    echo -n "Enter the protocol No .....  "
	    read po1a
	    #z1=`iptables -A OUTPUT -p tcp -s $ip1a --dport $po1a -j REJECT`
	    echo "   "
	    z3=`iptables -A OUTPUT -p all -s $ip1a --dport $po1a -j REJECT`
	    echo " $z3 "
	    echo
		echo " press enter to continue ....... "
		read k ;;
	  
	 2) echo -n "Enter the protocol No .....  "
	    read po2a
	    #z1=`iptables -A OUTPUT -p tcp --dport $po2a -j REJECT`
	    echo "   "
	    z3=`iptables -A OUTPUT -p all --dport $po2a -j REJECT`
	    echo " $z3 "
		echo
		echo " press enter to continue........ "
		read k ;;
	
	 3) echo -n "Enter the ip .....  "
	    read ip3

	    #z1=`iptables -A OUTPUT  -p tcp -s $ip3 -j REJECT`
	    echo "   "
	    z3=`iptables -A OUTPUT -p all -s $ip3 -j REJECT`
	    echo " $z3 "
		echo
		echo " press enter to continue........ "
		read k ;;
	 4)
	    #z1=`iptables -A OUTPUT -p tcp -j REJECT`
	    echo "   "
	    z3=`iptables -A OUTPUT -p all -j REJECT`
	    echo " $z3 "
		echo
		echo " press enter to continue........ "
		read k ;;
	esac ;;


 3)	clear
echo
	echo " __________________________________________________________________________"
	echo
	echo
	echo " 1)  protocol for specific IP     "
        echo " 2)  Protocol for whole world  "
        echo " 3)  all port for specific IP  "
        echo " 4)  all port for all world "
	echo
	echo " Double press enter to go back "

	echo "___________________________________________________________________________"
	echo
	echo -n " Enter your choice.................  "
	read a2
	case "$a2" in
	 1) echo -n "Enter the ip to block incoming ....   "
	    read ip1
	    echo -n "Enter the protocol No .....  "
	    read po1
	    #z1=`iptables -A INPUT -p tcp -s $ip1 --dport $po1 -j ACCEPT`
	    echo "   "
	    z3=`iptables -A INPUT -p all -s $ip1 --dport $po1 -j ACCEPT`
	    echo " $z3 "
	    echo
		echo " press enter to continue ....... "
		read k ;;
	  
	 2) echo -n "Enter the protocol No .....  "
	    read po2
	    #z1=`iptables -A INPUT -p tcp --dport $po2 -j ACCEPT`
	    echo "   "
	    z3=`iptables -A INPUT -p all --dport $po2 -j ACCEPT`
	    echo " $z3 "
		echo
		echo " press enter to continue........ "
		read k ;;
	
	 3) echo -n "Enter the ip .....  "
	    read ip3

	    #z1=`iptables -A INPUT  -p tcp -s $ip3 -j ACCEPT`
	    echo "   "
	    z3=`iptables -A INPUT -p all -s $ip3 -j ACCEPT`
	    echo " $z3 "
		echo
		echo " press enter to continue........ "
		read k ;;
	 4)
	    #z1=`iptables -A INPUT -p tcp -j ACCEPT`
	    echo "   "
	    z3=`iptables -A INPUT -p all -j ACCEPT`
	    echo " $z3 "
		echo
		echo " press enter to continue........ "
		read k ;;
	esac  ;;

		
 
 4)	clear
	echo
	echo " __________________________________________________________________________"
	echo
	echo
	echo " 1)  protocol for specific IP     "
        echo " 2)  Protocol for whole world  "
        echo " 3)  all port for specific IP  "
        echo " 4)  all port for all world "
	echo
	echo " Double press enter to go back "

	echo "___________________________________________________________________________"
	echo
	echo -n " Enter your choice.................  "
	read a2a
	case "$a2a" in
	 1) echo -n "Enter the ip to block incoming ....   "
	    read ip1a
	    echo -n "Enter the protocol No .....  "
	    read po1a
	    #z1=`iptables -A OUTPUT -p tcp -s $ip1a --dport $po1a -j ACCEPT`
	    echo "   "
	    z3=`iptables -A OUTPUT -p all -s $ip1a --dport $po1a -j ACCEPT`
	    echo " $z3 "
	    echo
		echo " press enter to continue ....... "
		read k ;;
	  
	 2) echo -n "Enter the protocol No .....  "
	    read po2a
	    #z1=`iptables -A OUTPUT -p tcp --dport $po2a -j ACCEPT`
	    echo "   "
	    z3=`iptables -A OUTPUT -p all --dport $po2a -j ACCEPT`
	    echo " $z3 "
		echo
		echo " press enter to continue........ "
		read k ;;

	 3) echo -n "Enter the ip .....  "
	    read ip3

	    #z1=`iptables -A OUTPUT  -p tcp -s $ip3 -j ACCEPT`
	    echo "   "
	    z3=`iptables -A OUTPUT -p all -s $ip3 -j ACCEPT`
	    echo " $z3 "
		echo
		echo " press enter to continue........ "
		read k ;;
	 4)
	    #z1=`iptables -A OUTPUT -p tcp -j ACCEPT`
	    echo "   "
	    z3=`iptables -A OUTPUT -p all -j ACCEPT`
	    echo " $z3 "
		echo
		echo " press enter to continue........ "
		read k ;;
	esac  ;;
 0) iptables -L   
		
	echo
	echo
		echo " press enter to continue "
		read k ;;
 9) iptables -F
	iptables -L
	 echo "rules flushed"
	echo
	echo
		echo " press enter to continue "
		read k ;;
		


 v) vim ipt.sh
	echo
	echo " press enter to continue "
	read k ;;
	
 
esac













}





imcp_po()


{
clear




clear
echo "					Welcome to IMCP					  "
echo "____________________________________________________________________________________"
echo
echo " 1) 	Incoming  Reject	"
echo " 2)	outgoing  Reject	"
echo " 3)	Incoming  ACCEPT	"
echo " 4) 	Outgoing  ACCEPT	"
echo " 0) 	list rules		"
echo " 9)	flush rules		"
echo
echo
	echo
	echo " Double press enter to go back "
echo
echo " v) 	execu the file		"

echo "____________________________________________________________________________________"
echo
echo -n " Enter your choice..........	"
read a1

case "$a1" in
 1)clear
	echo
	echo " __________________________________________________________________________"
	echo
	echo
	echo " 1)  protocol for specific IP     "
        echo " 2)  Protocol for whole world  "
        echo " 3)  all port for specific IP  "
        echo " 4)  all port for all world "
	echo
	echo " Double press enter to go back "
echo "___________________________________________________________________________"
	echo
	echo -n " Enter your choice.................  "
	read a2
	case "$a2" in
	 1) echo -n "Enter the ip to block incoming ....   "
	    read ip1
	    echo -n "Enter the protocol No .....  "
	    read po1
	    #z1=`iptables -A INPUT -p tcp -s $ip1 --dport $po1 -j REJECT`
	    echo 
	    z3=`iptables -A INPUT -p imcp -s $ip1 --dport $po1 -j REJECT`
	    echo " $z3 "
	    echo
		echo " press enter to continue ....... "
		read k ;;
	  
	 2) echo -n "Enter the protocol No .....  "
	    read po2
	    #z1=`iptables -A INPUT -p tcp --dport $po2 -j REJECT`
	    echo "   "
	    z3=`iptables -A INPUT -p imcp --dport $po2 -j REJECT`
	    echo " $z3 "
		echo
		echo " press enter to continue........ "
		read k ;;
	
	 3) echo -n "Enter the ip .....  "
	    read ip3
	    #z1=`iptables -A INPUT -p tcp -s $ip3 -j REJECT`
	    echo "   "
	    z3=`iptables -A INPUT -p imcp -s $ip3 -j REJECT`
	    echo " $z3 "
		echo
		echo " press enter to continue........ "
		read k ;;
	 4)
	    #z1=`iptables -A INPUT -p tcp -j REJECT`
	    echo "   "
	    z3=`iptables -A INPUT -p imcp -j REJECT`
	    echo " $z3 "
		echo
		echo " press enter to continue........ "
		read k ;;
	esac  ;;

	
 
 2)clear
	echo
	echo " __________________________________________________________________________"
	echo
	echo
	echo " 1)  protocol for specific IP     "
        echo " 2)  Protocol for whole world  "
        echo " 3)  all port for specific IP  "
        echo " 4)  all port for all world "

	echo
	echo " Double press enter to go back "


	echo "___________________________________________________________________________"
	echo
	echo -n " Enter your choice.................  "
	read a2a
	case "$a2a" in
	 1) echo -n "Enter the ip to block incoming ....   "
	    read ip1a
	    echo -n "Enter the protocol No .....  "
	    read po1a
	    #z1=`iptables -A OUTPUT -p tcp -s $ip1a --dport $po1a -j REJECT`
	    echo "   "
	    z3=`iptables -A OUTPUT -p imcp -s $ip1a --dport $po1a -j REJECT`
	    echo " $z3 "
	    echo
		echo " press enter to continue ....... "
		read k ;;
	  
	 2) echo -n "Enter the protocol No .....  "
	    read po2a
	    #z1=`iptables -A OUTPUT -p tcp --dport $po2a -j REJECT`
	    echo "   "
	    z3=`iptables -A OUTPUT -p imcp --dport $po2a -j REJECT`
	    echo " $z3 "
		echo
		echo " press enter to continue........ "
		read k ;;
	
	 3) echo -n "Enter the ip .....  "
	    read ip3

	    #z1=`iptables -A OUTPUT  -p tcp -s $ip3 -j REJECT`
	    echo "   "
	    z3=`iptables -A OUTPUT -p imcp -s $ip3 -j REJECT`
	    echo " $z3 "
		echo
		echo " press enter to continue........ "
		read k ;;
	 4)
	    #z1=`iptables -A OUTPUT -p tcp -j REJECT`
	    echo "   "
	    z3=`iptables -A OUTPUT -p imcp -j REJECT`
	    echo " $z3 "
		echo
		echo " press enter to continue........ "
		read k ;;
	esac ;;


 3)	clear
echo
	echo " __________________________________________________________________________"
	echo
	echo
	echo " 1)  protocol for specific IP     "
        echo " 2)  Protocol for whole world  "
        echo " 3)  all port for specific IP  "
        echo " 4)  all port for all world "
	echo
	echo " Double press enter to go back "

	echo "___________________________________________________________________________"
	echo
	echo -n " Enter your choice.................  "
	read a2
	case "$a2" in
	 1) echo -n "Enter the ip to block incoming ....   "
	    read ip1
	    echo -n "Enter the protocol No .....  "
	    read po1
	    #z1=`iptables -A INPUT -p tcp -s $ip1 --dport $po1 -j ACCEPT`
	    echo "   "
	    z3=`iptables -A INPUT -p imcp -s $ip1 --dport $po1 -j ACCEPT`
	    echo " $z3 "
	    echo
		echo " press enter to continue ....... "
		read k ;;
	  
	 2) echo -n "Enter the protocol No .....  "
	    read po2
	    #z1=`iptables -A INPUT -p tcp --dport $po2 -j ACCEPT`
	    echo "   "
	    z3=`iptables -A INPUT -p imcp --dport $po2 -j ACCEPT`
	    echo " $z3 "
		echo
		echo " press enter to continue........ "
		read k ;;
	
	 3) echo -n "Enter the ip .....  "
	    read ip3

	    #z1=`iptables -A INPUT  -p tcp -s $ip3 -j ACCEPT`
	    echo "   "
	    z3=`iptables -A INPUT -p imcp -s $ip3 -j ACCEPT`
	    echo " $z3 "
		echo
		echo " press enter to continue........ "
		read k ;;
	 4)
	    #z1=`iptables -A INPUT -p tcp -j ACCEPT`
	    echo "   "
	    z3=`iptables -A INPUT -p imcp -j ACCEPT`
	    echo " $z3 "
		echo
		echo " press enter to continue........ "
		read k ;;
	esac  ;;

		
 
 4)clear
	echo
	echo " __________________________________________________________________________"
	echo
	echo
	echo " 1)  protocol for specific IP     "
        echo " 2)  Protocol for whole world  "
        echo " 3)  all port for specific IP  "
        echo " 4)  all port for all world "
	echo
	echo " Double press enter to go back "

	echo "___________________________________________________________________________"
	echo
	echo -n " Enter your choice.................  "
	read a2a
	case "$a2a" in
	 1) echo -n "Enter the ip to block incoming ....   "
	    read ip1a
	    echo -n "Enter the protocol No .....  "
	    read po1a
	    #z1=`iptables -A OUTPUT -p tcp -s $ip1a --dport $po1a -j ACCEPT`
	    echo "   "
	    z3=`iptables -A OUTPUT -p imcp -s $ip1a --dport $po1a -j ACCEPT`
	    echo " $z3 "
	    echo
		echo " press enter to continue ....... "
		read k ;;
	  
	 2) echo -n "Enter the protocol No .....  "
	    read po2a
	    #z1=`iptables -A OUTPUT -p tcp --dport $po2a -j ACCEPT`
	    echo "   "
	    z3=`iptables -A OUTPUT -p imcp --dport $po2a -j ACCEPT`
	    echo " $z3 "
		echo
		echo " press enter to continue........ "
		read k ;;

	 3) echo -n "Enter the ip .....  "
	    read ip3

	    #z1=`iptables -A OUTPUT  -p tcp -s $ip3 -j ACCEPT`
	    echo "   "
	    z3=`iptables -A OUTPUT -p imcp -s $ip3 -j ACCEPT`
	    echo " $z3 "
		echo
		echo " press enter to continue........ "
		read k ;;
	 4)
	    #z1=`iptables -A OUTPUT -p tcp -j ACCEPT`
	    echo "   "
	    z3=`iptables -A OUTPUT -p imcp -j ACCEPT`
	    echo " $z3 "
		echo
		echo " press enter to continue........ "
		read k ;;
	esac  ;;
 0) iptables -L   
		
	echo
	echo
		echo " press enter to continue "
		read k ;;
 9) iptables -F
	iptables -L
	 echo "rules flushed"
	echo
	echo
		echo " press enter to continue "
		read k ;;
		


 v) vim ipt.sh
	echo
	echo " press enter to continue "
	read k ;;
	
 
esac













}

udp_po()


{

clear




clear
echo " 				Welcome to UDP						  "
echo "____________________________________________________________________________________"
echo
echo " 1) 	Incoming  Reject	"
echo " 2)	outgoing  Reject	"
echo " 3)	Incoming  ACCEPT	"
echo " 4) 	Outgoing  ACCEPT	"
echo " 0) 	list rules		"
echo " 9)	flush rules		"
echo
	echo
	echo " Double press enter to go back "
echo
echo
echo " v) 	execu the file		"

echo "____________________________________________________________________________________"
echo
echo -n " Enter your choice..........	"
read a1

case "$a1" in
 1)clear	echo
	echo " __________________________________________________________________________"
	echo
	echo
	echo " 1)  protocol for specific IP     "
        echo " 2)  Protocol for whole world  "
        echo " 3)  all port for specific IP  "
        echo " 4)  all port for all world "
	echo
	echo " Double press enter to go back "
	echo "___________________________________________________________________________"
	echo
	echo -n " Enter your choice.................  "
	read a2
	case "$a2" in
	 1) echo -n "Enter the ip to block incoming ....   "
	    read ip1
	    echo -n "Enter the protocol No .....  "
	    read po1
	    #z1=`iptables -A INPUT -p tcp -s $ip1 --dport $po1 -j REJECT`
	    echo "   "
	    z2=`iptables -A INPUT -p udp -s $ip1 --dport $po1 -j REJECT`
	    echo " $z2 "
	    echo
		echo " press enter to continue ....... "
		read k ;;
	  
	 2) echo -n "Enter the protocol No .....  "
	    read po2
	    #z1=`iptables -A INPUT -p tcp --dport $po2 -j REJECT`
	    echo "   "
	    z2=`iptables -A INPUT -p udp --dport $po2 -j REJECT`
	    echo " $z2 "
		echo
		echo " press enter to continue........ "
		read k ;;
	
	 3) echo -n "Enter the ip .....  "
	    read ip3
	    #z1=`iptables -A INPUT -p tcp -s $ip3 -j REJECT`
	    echo "   "
	    z2=`iptables -A INPUT -p udp -s $ip3 -j REJECT`
	    echo " $z2 "
		echo
		echo " press enter to continue........ "
		read k ;;
	 4)
	    #z1=`iptables -A INPUT -p tcp -j REJECT`
	    echo "   "
	    z2=`iptables -A INPUT -p udp -j REJECT`
	    echo " $z2 "
		echo
		echo " press enter to continue........ "
		read k ;;
	esac  ;;

	
 
 2)	clear
echo
	echo " __________________________________________________________________________"
	echo
	echo
	echo " 1)  protocol for specific IP     "
        echo " 2)  Protocol for whole world  "
        echo " 3)  all port for specific IP  "
        echo " 4)  all port for all world "

	echo
	echo " Double press enter to go back "


	echo "___________________________________________________________________________"
	echo
	echo -n " Enter your choice.................  "
	read a2a
	case "$a2a" in
	 1) echo -n "Enter the ip to block incoming ....   "
	    read ip1a
	    echo -n "Enter the protocol No .....  "
	    read po1a
	    #z1=`iptables -A OUTPUT -p tcp -s $ip1a --dport $po1a -j REJECT`
	    echo "   "
	    z2=`iptables -A OUTPUT -p udp -s $ip1a --dport $po1a -j REJECT`
	    echo " $z2 "
	    echo
		echo " press enter to continue ....... "
		read k ;;
	  
	 2) echo -n "Enter the protocol No .....  "
	    read po2a
	    #z1=`iptables -A OUTPUT -p tcp --dport $po2a -j REJECT`
	    echo "   "
	    z2=`iptables -A OUTPUT -p udp --dport $po2a -j REJECT`
	    echo " $z2 "
		echo
		echo " press enter to continue........ "
		read k ;;
	
	 3) echo -n "Enter the ip .....  "
	    read ip3

	    #z1=`iptables -A OUTPUT  -p tcp -s $ip3 -j REJECT`
	    echo "   "
	    z2=`iptables -A OUTPUT -p udp -s $ip3 -j REJECT`
	    echo " $z2 "
		echo
		echo " press enter to continue........ "
		read k ;;
	 4)
	    #z1=`iptables -A OUTPUT -p tcp -j REJECT`
	    echo "   "
	    z2=`iptables -A OUTPUT -p udp -j REJECT`
	    echo " $z2 "
		echo
		echo " press enter to continue........ "
		read k ;;
	esac ;;


 3)clear	echo
	echo " __________________________________________________________________________"
	echo
	echo
	echo " 1)  protocol for specific IP     "
        echo " 2)  Protocol for whole world  "
        echo " 3)  all port for specific IP  "
        echo " 4)  all port for all world "
	echo
	echo " Double press enter to go back "

	echo "___________________________________________________________________________"
	echo
	echo -n " Enter your choice.................  "
	read a2
	case "$a2" in
	 1) echo -n "Enter the ip to block incoming ....   "
	    read ip1
	    echo -n "Enter the protocol No .....  "
	    read po1
	    #z1=`iptables -A INPUT -p tcp -s $ip1 --dport $po1 -j ACCEPT`
	    echo "   "
	    z2=`iptables -A INPUT -p udp -s $ip1 --dport $po1 -j ACCEPT`
	    echo " $z2 "
	    echo
		echo " press enter to continue ....... "
		read k ;;
	  
	 2) echo -n "Enter the protocol No .....  "
	    read po2
	    #z1=`iptables -A INPUT -p tcp --dport $po2 -j ACCEPT`
	    echo "   "
	    z2=`iptables -A INPUT -p udp --dport $po2 -j ACCEPT`
	    echo " $z2 "
		echo
		echo " press enter to continue........ "
		read k ;;
	
	 3) echo -n "Enter the ip .....  "
	    read ip3

	    #z1=`iptables -A INPUT  -p tcp -s $ip3 -j ACCEPT`
	    echo "   "
	    z2=`iptables -A INPUT -p udp -s $ip3 -j ACCEPT`
	    echo " $z2 "
		echo
		echo " press enter to continue........ "
		read k ;;
	 4)
	    #z1=`iptables -A INPUT -p tcp -j ACCEPT`
	    echo "   "
	    z2=`iptables -A INPUT -p udp -j ACCEPT`
	    echo " $z2 "
		echo
		echo " press enter to continue........ "
		read k ;;
	esac  ;;

		
 
 4)	clear
echo
	echo " __________________________________________________________________________"
	echo
	echo
	echo " 1)  protocol for specific IP     "
        echo " 2)  Protocol for whole world  "
        echo " 3)  all port for specific IP  "
        echo " 4)  all port for all world "
	echo
	echo " Double press enter to go back "

	echo "___________________________________________________________________________"
	echo
	echo -n " Enter your choice.................  "
	read a2a
	case "$a2a" in
	 1) echo -n "Enter the ip to block incoming ....   "
	    read ip1a
	    echo -n "Enter the protocol No .....  "
	    read po1a
	    #z1=`iptables -A OUTPUT -p tcp -s $ip1a --dport $po1a -j ACCEPT`
	    echo "   "
	    z2=`iptables -A OUTPUT -p udp -s $ip1a --dport $po1a -j ACCEPT`
	    echo " $z2 "
	    echo
		echo " press enter to continue ....... "
		read k ;;
	  
	 2) echo -n "Enter the protocol No .....  "
	    read po2a
	    #z1=`iptables -A OUTPUT -p tcp --dport $po2a -j ACCEPT`
	    echo "   "
	    z2=`iptables -A OUTPUT -p udp --dport $po2a -j ACCEPT`
	    echo " $z2 "
		echo
		echo " press enter to continue........ "
		read k ;;

	 3) echo -n "Enter the ip .....  "
	    read ip3

	    #z1=`iptables -A OUTPUT  -p tcp -s $ip3 -j ACCEPT`
	    echo "   "
	    z2=`iptables -A OUTPUT -p udp -s $ip3 -j ACCEPT`
	    echo " $z2 "
		echo
		echo " press enter to continue........ "
		read k ;;
	 4)
	    #z1=`iptables -A OUTPUT -p tcp -j ACCEPT`
	    echo "   "
	    z2=`iptables -A OUTPUT -p udp -j ACCEPT`
	    echo " $z2 "
		echo
		echo " press enter to continue........ "
		read k ;;
	esac  ;;
 0) iptables -L   
		
	echo
	echo
		echo " press enter to continue "
		read k ;;
 9) iptables -F
	iptables -L
	 echo "rules flushed"
	echo
	echo
		echo " press enter to continue "
		read k ;;
		
 v) vim ipt.sh
	echo
	echo " press enter to continue "
	read k ;;
	
 
esac













}


tcp_po()


{
clear





clear
echo "				Welcome to TCP						  "				  
echo " ___________________________________________________________________________________"
echo
echo " 1) 	Incoming  Reject	"
echo " 2)	outgoing  Reject	"
echo " 3)	Incoming  ACCEPT	"
echo " 4) 	Outgoing  ACCEPT	"
echo " 0) 	list rules		"
echo " 9)	flush rules		"
echo
	echo
	echo " Double press enter to go back "

echo "____________________________________________________________________________________"
echo
echo -n " Enter your choice..........	"
read a1

case "$a1" in
 1)clear
	echo
	echo " __________________________________________________________________________"
	echo
	echo
	echo " 1)  protocol for specific IP     "
        echo " 2)  Protocol for whole world  "
        echo " 3)  all port for specific IP  "
        echo " 4)  all port for all world "
	echo
	echo " Double press enter to go back "
	echo "___________________________________________________________________________"
	echo
	echo -n " Enter your choice.................  "
	read a2
	case "$a2" in
	 1) echo -n "Enter the ip to block incoming ....   "
	    read ip1
	    echo -n "Enter the protocol No .....  "
	    read po1
	    z1=`iptables -A INPUT -p tcp -s $ip1 --dport $po1 -j REJECT`
	    echo " $z1 "
	    #z2=`iptables -A INPUT -p udp -s $ip1 --dport $po1 -j REJECT`
	   # echo " $#z2 "
	    echo
		echo " press enter to continue ....... "
		read k ;;
	  
	 2) echo -n "Enter the protocol No .....  "
	    read po2
	    za1=`iptables -A INPUT -p tcp --dport $po2 -j REJECT`
	    echo " $za1 "
	    #z2=`iptables -A INPUT -p udp --dport $po2 -j REJECT`
	    #echo " $#z2 "
		echo
		echo " press enter to continue........ "
		read k ;;
	
	 3) echo -n "Enter the ip .....  "
	    read ip3
	    za1=`iptables -A INPUT -p tcp -s $ip3 -j REJECT`
	    echo " $za1 "
	    #z2=`iptables -A INPUT -p udp -s $ip3 -j REJECT`
	   # echo " $#z2 "
		echo
		echo " press enter to continue........ "
		read k ;;
	 4)
	    za1=`iptables -A INPUT -p tcp -j REJECT`
	    echo " $za1 "
	    #z2=`iptables -A INPUT -p udp -j REJECT`
	    #echo " $#z2 "
		echo
		echo " press enter to continue........ "
		read k ;;
	esac  ;;

	
 
 2)clear	echo
	echo " __________________________________________________________________________"
	echo
	echo
	  echo " 1)  protocol for specific IP     "
        echo " 2)  Protocol for whole world  "
        echo " 3)  all port for specific IP  "
        echo " 4)  all port for all world "
	echo
	echo
	echo " Double press enter to go back "


	echo "___________________________________________________________________________"
	echo
	echo -n " Enter your choice.................  "
	read a2a
	case "$a2a" in
	 1) echo -n "Enter the ip to block incoming ....   "
	    read ip1a
	    echo -n "Enter the protocol No .....  "
	    read po1a
	    y1=`iptables -A OUTPUT -p tcp -s $ip1a --dport $po1a -j REJECT`
	    echo " $y1 "
	    #y2=`iptables -A OUTPUT -p udp -s $ip1a --dport $po1a -j REJECT`
	   # echo " $#y2 "
	    echo
		echo " press enter to continue ....... "
		read k ;;
	  
	 2) echo -n "Enter the protocol No .....  "
	    read po2a
	    ya1=`iptables -A OUTPUT -p tcp --dport $po2a -j REJECT`
	    echo " $ya1 "
	    #ya2=`iptables -A OUTPUT -p udp --dport $po2a -j REJECT`
	    #echo " $#ya2 "
		echo
		echo " press enter to continue........ "
		read k ;;
	
	 3) echo -n "Enter the ip .....  "
	    read ip3

	    za1=`iptables -A OUTPUT  -p tcp -s $ip3 -j REJECT`
	    echo " $za1 "
	    #z2=`iptables -A OUTPUT -p udp -s $ip3 -j REJECT`
	   # echo " $#z2 "
		echo
		echo " press enter to continue........ "
		read k ;;
	 4)
	    za1=`iptables -A OUTPUT -p tcp -j REJECT`
	    echo " $za1 "
	    #z2=`iptables -A OUTPUT -p udp -j REJECT`
	   # echo " $#z2 "
		echo
		echo " press enter to continue........ "
		read k ;;
	esac ;;


 3)clear	echo
	echo " __________________________________________________________________________"
	echo
	echo " 1)  protocol for specific IP 	"
	echo " 2)  Protocol for whole world  "
	echo " 3)  all port for specific IP  "
	echo " 4)  all port for all world "
	echo
	echo
	echo " Double press enter to go back "
	echo
	echo "___________________________________________________________________________"
	echo
	echo -n " Enter your choice.................  "
	read a2
	case "$a2" in
	 1) echo -n "Enter the ip to block incoming ....   "
	    read ip1
	    echo -n "Enter the protocol No .....  "
	    read po1
	    z1=`iptables -A INPUT -p tcp -s $ip1 --dport $po1 -j ACCEPT`
	    echo " $z1 "
	    #z2=`iptables -A INPUT -p udp -s $ip1 --dport $po1 -j ACCEPT`
	   # echo " $#z2 "
	    echo
		echo " press enter to continue ....... "
		read k ;;
	  
	 2) echo -n "Enter the protocol No .....  "
	    read po2
	    za1=`iptables -A INPUT -p tcp --dport $po2 -j ACCEPT`
	    echo " $za1 "
	    #z2=`iptables -A INPUT -p udp --dport $po2 -j ACCEPT`
	  #  echo " $#z2 "
		echo
		echo " press enter to continue........ "
		read k ;;
	
	 3) echo -n "Enter the ip .....  "
	    read ip3

	    za1=`iptables -A INPUT  -p tcp -s $ip3 -j ACCEPT`
	    echo " $za1 "
	    #z2=`iptables -A INPUT -p udp -s $ip3 -j ACCEPT`
	   # echo " $#z2 "
		echo
		echo " press enter to continue........ "
		read k ;;
	 4)
	    za1=`iptables -A INPUT -p tcp -j ACCEPT`
	    echo " $za1 "
	    #z2=`iptables -A INPUT -p udp -j ACCEPT`
	   # echo " $#z2 "
		echo
		echo " press enter to continue........ "
		read k ;;
	esac  ;;

		
 
 4)clear	echo
	echo " __________________________________________________________________________"
	echo 
	echo " 1)  protocol for specific IP 	"
	echo " 2)  Protocol for whole world  "
	echo " 3)  all port for specific IP  "
	echo " 4)  all port for all world "
	echo
	echo
	echo " Double press enter to go back "
	echo
	echo "___________________________________________________________________________"
	echo
	echo -n " Enter your choice.................  "
	read a2a
	case "$a2a" in
	 1) echo -n "Enter the ip to block incoming ....   "
	    read ip1a
	    echo -n "Enter the protocol No .....  "
	    read po1a
	    y1=`iptables -A OUTPUT -p tcp -s $ip1a --dport $po1a -j ACCEPT`
	    echo " $y1 "
	    #y2=`iptables -A OUTPUT -p udp -s $ip1a --dport $po1a -j ACCEPT`
	    #echo " $#y2 "
	    echo
		echo " press enter to continue ....... "
		read k ;;
	  
	 2) echo -n "Enter the protocol No .....  "
	    read po2a
	    ya1=`iptables -A OUTPUT -p tcp --dport $po2a -j ACCEPT`
	    echo " $ya1 "
	    #ya2=`iptables -A OUTPUT -p udp --dport $po2a -j ACCEPT`
	   # echo " $#ya2 "
		echo
		echo " press enter to continue........ "
		read k ;;

	 3) echo -n "Enter the ip .....  "
	    read ip3

	    za1=`iptables -A OUTPUT  -p tcp -s $ip3 -j ACCEPT`
	    echo " $za1 "
	    #z2=`iptables -A OUTPUT -p udp -s $ip3 -j ACCEPT`
	   # echo " $#z2 "
		echo
		echo " press enter to continue........ "
		read k ;;
	 4)
	    za1=`iptables -A OUTPUT -p tcp -j ACCEPT`
	    echo " $za1 "
	    #z2=`iptables -A OUTPUT -p udp -j ACCEPT`
	   # echo " $#z2 "
		echo
		echo " press enter to continue........ "
		read k ;;
	esac  ;;
 0) iptables -L   
		
	echo
	echo
		echo " press enter to continue "
		read k ;;
 9) iptables -F
	iptables -L
	 echo "rules flushed"
	echo
	echo
		echo " press enter to continue "
		read k ;;







	

esac




}

ut_po()
{




clear
 echo 
echo " 					Welcome to TCP & UDP 				  "
echo "____________________________________________________________________________________"
echo
echo " 1) 	Incoming  Reject	"
echo " 2)	outgoing  Reject	"
echo " 3)	Incoming  ACCEPT	"
echo " 4) 	Outgoing  ACCEPT	"
echo " 0) 	list rules		"
echo " 9)	flush rules		"
echo
echo
	echo
	echo " Double press enter to go back "
echo
echo " v) 	execu the file		"

echo "____________________________________________________________________________________"
echo
echo -n " Enter your choice..........	"
read a1

clear
case "$a1" in
 1)clear
	echo
	echo " __________________________________________________________________________"
	echo
	echo
	echo " 1)  protocol for specific IP     "
        echo " 2)  Protocol for whole world  "
        echo " 3)  all port for specific IP  "
        echo " 4)  all port for all world "
	echo
	echo " Double press enter to go back "
	echo "___________________________________________________________________________"
	echo
	echo -n " Enter your choice.................  "
	read a2
	case "$a2" in
	 1) echo -n "Enter the ip to block incoming ....   "
	    read ip1
	    echo -n "Enter the protocol No .....  "
	    read po1
	    z1=`iptables -A INPUT -p tcp -s $ip1 --dport $po1 -j REJECT`
	    echo " $z1 "
	    z2=`iptables -A INPUT -p udp -s $ip1 --dport $po1 -j REJECT`
	    echo " $z2 "
	    echo
		echo " press enter to continue ....... "
		read k ;;
	  
	 2) echo -n "Enter the protocol No .....  "
	    read po2
	    za1=`iptables -A INPUT -p tcp --dport $po2 -j REJECT`
	    echo " $za1 "
	    za2=`iptables -A INPUT -p udp --dport $po2 -j REJECT`
	    echo " $za2 "
		echo
		echo " press enter to continue........ "
		read k ;;
	
	 3) echo -n "Enter the ip .....  "
	    read ip3
	    za1=`iptables -A INPUT -p tcp -s $ip3 -j REJECT`
	    echo " $za1 "
	    za2=`iptables -A INPUT -p udp -s $ip3 -j REJECT`
	    echo " $za2 "
		echo
		echo " press enter to continue........ "
		read k ;;
	 4)
	    za1=`iptables -A INPUT -p tcp -j REJECT`
	    echo " $za1 "
	    za2=`iptables -A INPUT -p udp -j REJECT`
	    echo " $za2 "
		echo
		echo " press enter to continue........ "
		read k ;;
	esac  ;;

	
 
 2)	clear
	echo
	echo " __________________________________________________________________________"
	echo
	echo
	echo


	echo " 1)  protocol for specific IP     "
        echo " 2)  Protocol for whole world  "
        echo " 3)  all port for specific IP  "
        echo " 4)  all port for all world "

	echo
	echo " Double press enter to go back "
	echo "___________________________________________________________________________"
	echo
	echo -n " Enter your choice.................  "
	read a2a
	case "$a2a" in
	 1) echo -n "Enter the ip to block incoming ....   "
	    read ip1a
	    echo -n "Enter the protocol No .....  "
	    read po1a
	    y1=`iptables -A OUTPUT -p tcp -s $ip1a --dport $po1a -j REJECT`
	    echo " $y1 "
	    y2=`iptables -A OUTPUT -p udp -s $ip1a --dport $po1a -j REJECT`
	    echo " $y2 "
	    echo
		echo " press enter to continue ....... "
		read k ;;
	  
	 2) echo -n "Enter the protocol No .....  "
	    read po2a
	    ya1=`iptables -A OUTPUT -p tcp --dport $po2a -j REJECT`
	    echo " $ya1 "
	    ya2=`iptables -A OUTPUT -p udp --dport $po2a -j REJECT`
	    echo " $ya2 "
		echo
		echo " press enter to continue........ "
		read k ;;
	
	 3) echo -n "Enter the ip .....  "
	    read ip3

	    za1=`iptables -A OUTPUT  -p tcp -s $ip3 -j REJECT`
	    echo " $za1 "
	    za2=`iptables -A OUTPUT -p udp -s $ip3 -j REJECT`
	    echo " $za2 "
		echo
		echo " press enter to continue........ "
		read k ;;
	 4)
	    za1=`iptables -A OUTPUT -p tcp -j REJECT`
	    echo " $za1 "
	    za2=`iptables -A OUTPUT -p udp -j REJECT`
	    echo " $za2 "
		echo
		echo " press enter to continue........ "
		read k ;;
	esac ;;


 3)	clear
	echo
	echo " __________________________________________________________________________"
	echo
	echo
	echo
	echo " 1)  protocol for specific IP     "
        echo " 2)  Protocol for whole world  "
        echo " 3)  all port for specific IP  "
        echo " 4)  all port for all world "
	echo "___________________________________________________________________________"
	echo
	echo -n " Enter your choice.................  "
	read a2
	case "$a2" in
	 1) echo -n "Enter the ip to block incoming ....   "
	    read ip1
	    echo -n "Enter the protocol No .....  "
	    read po1
	    z1=`iptables -A INPUT -p tcp -s $ip1 --dport $po1 -j ACCEPT`
	    echo " $z1 "
	    z2=`iptables -A INPUT -p udp -s $ip1 --dport $po1 -j ACCEPT`
	    echo " $z2 "
	    echo
		echo " press enter to continue ....... "
		read k ;;
	  
	 2) echo -n "Enter the protocol No .....  "
	    read po2
	    za1=`iptables -A INPUT -p tcp --dport $po2 -j ACCEPT`
	    echo " $za1 "
	    za2=`iptables -A INPUT -p udp --dport $po2 -j ACCEPT`
	    echo " $za2 "
		echo
		echo " press enter to continue........ "
		read k ;;
	
	 3) echo -n "Enter the ip .....  "
	    read ip3

	    za1=`iptables -A INPUT  -p tcp -s $ip3 -j ACCEPT`
	    echo " $za1 "
	    za2=`iptables -A INPUT -p udp -s $ip3 -j ACCEPT`
	    echo " $za2 "
		echo
		echo " press enter to continue........ "
		read k ;;
	 4)
	    za1=`iptables -A INPUT -p tcp -j ACCEPT`
	    echo " $za1 "
	    za2=`iptables -A INPUT -p udp -j ACCEPT`
	    echo " $za2 "
		echo
		echo " press enter to continue........ "
		read k ;;
	esac  ;;

		
 
 4)	clear
	echo
	echo " __________________________________________________________________________"
	echo
	echo
	echo
	echo " 1)  protocol for specific IP     "
        echo " 2)  Protocol for whole world  "
        echo " 3)  all port for specific IP  "
        echo " 4)  all port for all world "
	echo "___________________________________________________________________________"
	echo
	echo -n " Enter your choice.................  "
	read a2a
	case "$a2a" in
	 1) echo -n "Enter the ip to block incoming ....   "
	    read ip1a
	    echo -n "Enter the protocol No .....  "
	    read po1a
	    y1=`iptables -A OUTPUT -p tcp -s $ip1a --dport $po1a -j ACCEPT`
	    echo " $y1 "
	    y2=`iptables -A OUTPUT -p udp -s $ip1a --dport $po1a -j ACCEPT`
	    echo " $y2 "
	    echo
		echo " press enter to continue ....... "
		read k ;;
	  
	 2) echo -n "Enter the protocol No .....  "
	    read po2a
	    ya1=`iptables -A OUTPUT -p tcp --dport $po2a -j ACCEPT`
	    echo " $ya1 "
	    ya2=`iptables -A OUTPUT -p udp --dport $po2a -j ACCEPT`
	    echo " $ya2 "
		echo
		echo " press enter to continue........ "
		read k ;;

	 3) echo -n "Enter the ip .....  "
	    read ip3

	    za1=`iptables -A OUTPUT  -p tcp -s $ip3 -j ACCEPT`
	    echo " $za1 "
	    za2=`iptables -A OUTPUT -p udp -s $ip3 -j ACCEPT`
	    echo " $za2 "
		echo
		echo " press enter to continue........ "
		read k ;;
	 4)
	    za1=`iptables -A OUTPUT -p tcp -j ACCEPT`
	    echo " $za1 "
	    za2=`iptables -A OUTPUT -p udp -j ACCEPT`
	    echo " $za2 "
		echo
		echo " press enter to continue........ "
		read k ;;
	esac  ;;
 0) iptables -L   
		
	echo
	echo
		echo " press enter to continue "
		read k ;;
 9) iptables -F
	iptables -L
	 echo "rules flushed"
	echo
	echo
		echo " press enter to continue "
		read k ;;
		


 v) vim ipt.sh
	echo
	echo " press enter to continue "
	read k ;;
	
 
esac 










}


# the functions are finished



bc=1
# Entering while loop for infinte time
while [ $bc = 1 ]
do
clear
echo
echo
echo
echo "				This is the iptables rules				  "
echo " ___________________________________________________________________________________"
echo
# The case options
echo " t) TCP  "
echo " u) UDP  "
echo " p) imcp "
echo " d) TCP & UDP "
echo " l) all  "
echo " *) EXIT "
echo
	echo
	echo " Double press enter to go back "
echo " ___________________________________________________________________________________"
echo
echo -n " ENTER YOUR CHOICE >....... "
read choice

# Case is starting

case "$choice" in

t) clear
	tcp_po
	read k ;;

u) clear
   udp_po
	read k ;;

p) clear
	 imcp_po
	read k ;;

l) clear
	all_po
	read k ;;

d) clear
	ut_po
	read k ;;

*) clear 
	exit ;;
	



 
	
esac







done




}












#
#
#		CALLING THE CASE  _ so that functions can be called
#
#







echo " HI, Welcome to Functions - Prepared by Harsh"
echo
echo
echo " ___________________________________________________________________________________________________"
echo
echo
echo " 1) ip checking and some configering "
echo " 2) Samba "
echo " 3) Dhcp "
echo " 4) Dns "
echo " 5) Iptable "
echo " *) exit "
echo
echo
echo " Double press enter When you want To go back "
echo
echo " ___________________________________________________________________________________________________"
echo
echo " Enter Your Choice ... "
echo -n " => "
read fn

case "$fn" in
1) ipcheck 
	read k ;;

2) sama 
	read k ;;
 
3) Dhcps 
	read k ;;

4) Dnss 
	read k ;;

5) iptab
	read k ;;

*) exit
	read k ;;

esac
