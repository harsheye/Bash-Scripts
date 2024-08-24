#!/bin/bash
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



