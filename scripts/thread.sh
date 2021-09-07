#!/bin/bash
LPATH='/opt/MkCheck/'
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
LCYN='\033[1;36m'
Z=1
#########################################
#  Insert new target for MCheck Attack  #
#########################################

g51(){
	RARG=$(python3 scripts/get/g51.py)
	VAR=$(echo ${RARG})
	FARG='host = "ARG"'
	mv files/file_51.txt files/small_file_51.txt
	# Start
	TARG=$(cat scripts/miko/m51.py | grep "host = *")
	sed -i "s/${TARG}/${FARG}/g" scripts/miko/m51.py
	sed -i "s/ARG/${VAR}/g" scripts/miko/m51.py
	#echo -e "${UPURPLE}${Z}.${UBLUE}Next Target is ${YLW}${VAR}${NC}"
}

g102(){
	RARG=$(python3 scripts/get/g102.py)
	VAR=$(echo ${RARG})
	FARG='host = "ARG"'
	mv files/file_102.txt files/small_file_102.txt
	# Start
	TARG=$(cat scripts/miko/m102.py | grep "host = *")
	sed -i "s/${TARG}/${FARG}/g" scripts/miko/m102.py
	sed -i "s/ARG/${VAR}/g" scripts/miko/m102.py
	#echo -e "${UPURPLE}${Z}.${UBLUE}Next Target is ${YLW}${VAR}${NC}"
}

g153(){
	RARG=$(python3 scripts/get/g153.py)
	VAR=$(echo ${RARG})
	FARG='host = "ARG"'
	mv files/file_153.txt files/small_file_153.txt
	# Start
	TARG=$(cat scripts/miko/m153.py | grep "host = *")
	sed -i "s/${TARG}/${FARG}/g" scripts/miko/m153.py
	sed -i "s/ARG/${VAR}/g" scripts/miko/m153.py
	#echo -e "${UPURPLE}${Z}.${UBLUE}Next Target is ${YLW}${VAR}${NC}"
}

g204(){
	RARG=$(python3 scripts/get/g204.py)
	VAR=$(echo ${RARG})
	FARG='host = "ARG"'
	mv files/file_204.txt files/small_file_204.txt
	# Start
	TARG=$(cat scripts/miko/m204.py | grep "host = *")
	sed -i "s/${TARG}/${FARG}/g" scripts/miko/m204.py
	sed -i "s/ARG/${VAR}/g" scripts/miko/m204.py
	#echo -e "${UPURPLE}${Z}.${UBLUE}Next Target is ${YLW}${VAR}${NC}"
}

g255(){
	RARG=$(python3 scripts/get/g255.py)
	VAR=$(echo ${RARG})
	FARG='host = "ARG"'
	mv files/file_255.txt files/small_file_255.txt
	# Start
	TARG=$(cat scripts/miko/m255.py | grep "host = *")
	sed -i "s/${TARG}/${FARG}/g" scripts/miko/m255.py
	sed -i "s/ARG/${VAR}/g" scripts/miko/m255.py
	#echo -e "${UPURPLE}${Z}.${UBLUE}Next Target is ${YLW}${VAR}${NC}"
}

apresults(){
  Y='1'
  for log in `cat /opt/MkCheck/files/tiks_res.txt`
		do
			Y=$(( ${Y} + 1 ))
			IP=$(cat results/Vulns/${SESSION}/${log}.results)
			echo "${log} ${IP}" >> results/Vulns/${SESSION}/final.results
			echo "==========================================================================="
			if [[ ${Y} -eq ${Z} ]] || [[ ${Y} -gt ${Z} ]]; then

				    ######################
				    ######################
				    #  Targetted Lookup  #
				    ######################
				    echo -e "${W}Was there a specific target you were looking for?${YLW}(y/n)${NC}"
				    read GETTED
				    if [[ ${GETTED} == "y" ]]; then
					       echo -e "${W}Please specify a keyword for your target Access Point${NC}"
					       echo -e "${RED}eg. ${YLW}123 Apartment${RED} <-- target access point name${NC}"
					       echo -e "${RED}Keyword to search for would be ${YLW}Apartment${RED} or ${YLW}123${NC}"
					       read KEY
					       cat /opt/MkCheck/results/Vulns/${SESSION}/final.results | grep ${KEY}
				    fi

				  ####################
				  ####################
				  #  Return To Main  #
				  ####################
				  break
			fi
		done
}

############################################
#  Mikro Network AP Name Check (No Proxy)  #
############################################
m51(){
	while [[ $Z -le 51 ]];
	do
		echo -e "${UBLUE}${Z}${NC}${RED}. Press <CTRL+C> to exit.${NC}"
		g51
		echo ""
		sudo python2 scripts/miko/m51.py | tee m51.log
		NAME=$(cat m51.log | grep 'name:')
		VER=$(cat m51.log | grep 'RouterOS')
		echo "${NAME}" >> results/Vulns/${SESSION}/${VAR}.results
		echo "${VER}" >> results/Vulns/${SESSION}/${VAR}.results
		echo "=================================================" >> results/Vulns/${SESSION}/${VAR}.results
		sudo rm m51.log
        sleep 3
		Z=$(( $Z + 1 ))
		if [[ ${Z} -eq 51 ]]; then
			echo -e "${LP}Sorting Results${NC}"
			break
		fi
	done
}

m102(){
	while [[ $Z -le 51 ]];
	do
		echo -e "${UBLUE}${Z}${NC}${RED}. Press <CTRL+C> to exit.${NC}"
		g102
		echo ""
		sudo python2 scripts/miko/m102.py | tee m102.log
		NAME=$(cat m102.log | grep 'name:')
		VER=$(cat m102.log | grep 'RouterOS')
		echo "${NAME}" >> results/Vulns/${SESSION}/${VAR}.results
		echo "${VER}" >> results/Vulns/${SESSION}/${VAR}.results
		echo "=================================================" >> results/Vulns/${SESSION}/${VAR}.results
		sudo rm m102.log
        sleep 3
		Z=$(( $Z + 1 ))
		if [[ ${Z} -eq 51 ]]; then
			echo -e "${LP}Sorting Results${NC}"
			break
		fi
	done
}

m153(){
	while [[ $Z -le 51 ]];
	do
		echo -e "${UBLUE}${Z}${NC}${RED}. Press <CTRL+C> to exit.${NC}"
		g153
		echo ""
		sudo python2 scripts/miko/m153.py | tee m153.log
		NAME=$(cat m153.log | grep 'name:')
		VER=$(cat m153.log | grep 'RouterOS')
		echo "${NAME}" >> results/Vulns/${SESSION}/${VAR}.results
		echo "${VER}" >> results/Vulns/${SESSION}/${VAR}.results
		echo "=================================================" >> results/Vulns/${SESSION}/${VAR}.results
		sudo rm m153.log
        sleep 3
		Z=$(( $Z + 1 ))
		if [[ ${Z} -eq 51 ]]; then
			echo -e "${LP}Sorting Results${NC}"
			break
		fi
	done
}

m204(){
	while [[ $Z -le 51 ]];
	do
		echo -e "${UBLUE}${Z}${NC}${RED}. Press <CTRL+C> to exit.${NC}"
		g204
		echo ""
		sudo python2 scripts/miko/m204.py | tee m204.log
		NAME=$(cat m204.log | grep 'name:')
		VER=$(cat m204.log | grep 'RouterOS')
		echo "${NAME}" >> results/Vulns/${SESSION}/${VAR}.results
		echo "${VER}" >> results/Vulns/${SESSION}/${VAR}.results
		echo "=================================================" >> results/Vulns/${SESSION}/${VAR}.results
		sudo rm m204.log
        sleep 3
		Z=$(( $Z + 1 ))
		if [[ ${Z} -eq 51 ]]; then
			echo -e "${LP}Sorting Results${NC}"
			break
		fi
	done
}

m255(){
	while [[ $Z -le 51 ]];
	do
		echo -e "${UBLUE}${Z}${NC}${RED}. Press <CTRL+C> to exit.${NC}"
		g255
		echo ""
		sudo python2 scripts/miko/m255.py | tee m255.log
		NAME=$(cat m255.log | grep 'name:')
		VER=$(cat m255.log | grep 'RouterOS')
		echo "${NAME}" >> results/Vulns/${SESSION}/${VAR}.results
		echo "${VER}" >> results/Vulns/${SESSION}/${VAR}.results
		echo "=================================================" >> results/Vulns/${SESSION}/${VAR}.results
		sudo rm m255.log
        sleep 3
		Z=$(( $Z + 1 ))
		if [[ ${Z} -eq 51 ]]; then
			echo -e "${LP}Sorting Results${NC}"
			break
		fi
	done
}

#######################################
#  Network AP Discovery (with Proxy)  #
#######################################
p51(){
	while [[ $Z -le 51 ]];
	do
		echo -e "${UBLUE}${Z}${NC}${RED}. Press <CTRL+C> to exit.${NC}"
		g51
		echo ""
		proxychains4 sudo python2 scripts/miko/m51.py | tee p51.log
		NAME=$(cat p51.log | grep 'name:')
		VER=$(cat p51.log | grep 'RouterOS')
		echo "${NAME}" >> results/Vulns/${SESSION}/${VAR}.results
		echo "${VER}" >> results/Vulns/${SESSION}/${VAR}.results
		echo "=================================================" >> results/Vulns/${SESSION}/${VAR}.results
		sudo rm p51.log
        sleep 3
		Z=$(( $Z + 1 ))
		if [[ ${Z} -eq 51 ]]; then
			echo -e "${LP}Sorting Results${NC}"
			break
		fi
	done
}

p102(){
	while [[ $Z -le 51 ]];
	do
		echo -e "${UBLUE}${Z}${NC}${RED}. Press <CTRL+C> to exit.${NC}"
		g102
		echo ""
		proxychains4 sudo python2 scripts/miko/m102.py | tee p102.log
		NAME=$(cat p102.log | grep 'name:')
		VER=$(cat p102.log | grep 'RouterOS')
		echo "${NAME}" >> results/Vulns/${SESSION}/${VAR}.results
		echo "${VER}" >> results/Vulns/${SESSION}/${VAR}.results
		echo "=================================================" >> results/Vulns/${SESSION}/${VAR}.results
		sudo rm p102.log
        sleep 3
		Z=$(( $Z + 1 ))
		if [[ ${Z} -eq 51 ]]; then
			echo -e "${LP}Sorting Results${NC}"
			break
		fi
	done
}

p153(){
	while [[ $Z -le 51 ]];
	do
		echo -e "${UBLUE}${Z}${NC}${RED}. Press <CTRL+C> to exit.${NC}"
		g153
		echo ""
		proxychains4 sudo python2 scripts/miko/m153.py | tee p153.log
		NAME=$(cat p153.log | grep 'name:')
		VER=$(cat p153.log | grep 'RouterOS')
		echo "${NAME}" >> results/Vulns/${SESSION}/${VAR}.results
		echo "${VER}" >> results/Vulns/${SESSION}/${VAR}.results
		echo "=================================================" >> results/Vulns/${SESSION}/${VAR}.results
		sudo rm p153.log
        sleep 3
		Z=$(( $Z + 1 ))
		if [[ ${Z} -eq 51 ]]; then
			echo -e "${LP}Sorting Results${NC}"
			break
		fi
	done
}

p204(){
	while [[ $Z -le 51 ]];
	do
		echo -e "${UBLUE}${Z}${NC}${RED}. Press <CTRL+C> to exit.${NC}"
		g204
		echo ""
		proxychains4 sudo python2 scripts/miko/m204.py | tee p204.log
		NAME=$(cat p204.log | grep 'name:')
		VER=$(cat p204.log | grep 'RouterOS')
		echo "${NAME}" >> results/Vulns/${SESSION}/${VAR}.results
		echo "${VER}" >> results/Vulns/${SESSION}/${VAR}.results
		echo "=================================================" >> results/Vulns/${SESSION}/${VAR}.results
		sudo rm p204.log
        sleep 3
		Z=$(( $Z + 1 ))
		if [[ ${Z} -eq 51 ]]; then
			echo -e "${LP}Sorting Results${NC}"
			break
		fi
	done
}

p255(){
	while [[ $Z -le 51 ]];
	do
		echo -e "${UBLUE}${Z}${NC}${RED}. Press <CTRL+C> to exit.${NC}"
		g255
		echo ""
		proxychains4 sudo python2 scripts/miko/m255.py | tee p255.log
		NAME=$(cat p255.log | grep 'name:')
		VER=$(cat p255.log | grep 'RouterOS')
		echo "${NAME}" >> results/Vulns/${SESSION}/${VAR}.results
		echo "${VER}" >> results/Vulns/${SESSION}/${VAR}.results
		echo "=================================================" >> results/Vulns/${SESSION}/${VAR}.results
		sudo rm p255.log
        sleep 3
		Z=$(( $Z + 1 ))
		if [[ ${Z} -eq 51 ]]; then
			echo -e "${LP}Sorting Results${NC}"
			break
		fi
	done
}

while getopts "12345abcde" options; do            	            # Loop: Get the next option;
	case "${options}" in
        1)
            m51
            #apresults
            ;;

        2)
            m102
            #apresults
            ;;

        3)
            m153
            #apresults
            ;;

        4)
            m204
            #apresults
            ;;

        5)
            m255
            #apresults
            ;;

        a)
            p51
            #apresults
            ;;

        b)
            p102
            #apresults
            ;;

        c)
            p153
            #apresults
            ;;

        d)
            p204
            #apresults
            ;;

        e)
            p255
            #apresults
            ;;
    esac
done
