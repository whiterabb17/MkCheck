#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'
RED='\033[0;31m'
LGRY='\033[0;37m'
INV='\e[7m'
BRED='\033[1;31m'
UPURPLE='\033[4;35m'
UBLUE='\033[4;34m'
URED='\033[4;31m'
LOPT='y'

# Root Check
if [[ $EUID -ne 0 ]]; then
   echo -e "${RED}This script must be run as root${NC}"
   exit 1
fi

###################
# Initial Install
##-----------------
#
sudo sed -i "s/FIRSTTIME=1/FIRST=DONE/g" /opt/sifter/sifter
sudo sed -i "s/FIRSTTIME=1/FIRST=DONE/g" /usr/sbin/sifter
##

# Apt Dependancies
sudo apt update
sudo apt-get install figlet python python3 python-tk python3-pip figlet python3.8 tor proxychains4 libboost-all-dev cmake
# MCheck install
if [[ -d /opt/MkCheck ]]; then
	sleep 1
	echo -e "${YLW}MkCheck is installed in the right place${NC}"
else
	echo -e "${W}Moving MkCheck to the correct directory${NC}"
	pwd && cd ..
	sudo mv MkCheck -t /opt
fi

# Python2 Dependancies
#apt-get remove python3-pip -y
cd /opt/
#wget http://ftp.us.debian.org/debian/pool/main/p/python-pip/python-pip_18.1-5_all.deb
#wget http://ftp.us.debian.org/debian/pool/main/p/python-pip/python-pip-whl_18.1-5_all.deb
#dpkg -i python-pip-whl_18.1-5_all.deb
#dpkg -i python-pip_18.1-5_all.deb
#rm python-*
python2 -m pip install paramiko
# Routersploit Setup
cd /root/
echo -e "${LP}"
figlet -f mini "RoutersSploit"
echo -e "${NC}"
if [[ -d "/root/routersploit" ]]; then
	echo -e "${W}Routersploit is already installed${NC}"
	sleep 1
else
	echo -e "${YLW}Installing RouterSploit${NC}"
	git clone https://github.com/threat9/routersploit.git
fi

# RouterSploit Dependancies

cd /root/routersploit																		# Readline Package Depreciated
python3 -m pip install gnureadline															# Which is causing runtime errors
python3 -m pip install -r requirements.txt
python3 -m pip install -r requirements-dev.txt


# ByTheWay Setup
if [[ -f '/opt/MkCheck/scripts/btw' ]]; then
	echo -e "${YLW}ByTheWay binary already compiled${NC}"
else
	echo -e "${YLW}Compiling ByTheWay binary${NC}"
	cd /opt/MkCheck/files/bytheway
	mkdir build
	cd build
	cmake ..
	make
	mv btw -t /opt/MkCheck/scripts
fi

chmod +x /opt/MkCheck --recursive
cd /opt/MkCheck
# Path Options
echo -e "${YLW}Would you like to add MkCheck to path to run it from anywhere?${LBBLUE}(y/n)${NC}"
read LOPT
if [[ ${LOPT} == "y" ]]; then
	sudo cp mkcheck mthread -t /usr/sbin
	sudo chown $USER:$USER /usr/sbin/mkcheck /usr/sbin/mthread
else
	echo -e "${RED}MkCheck installed${NC}"
fi

#####################################################______________ czFsM250NzggX18gUmFiYjE3J3MgRGVu ______________#####################################################
