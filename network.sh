#!/bin/bash

help()
{
	local Name="${0}"
	Name=${Name##*/}
	Name=${Name%%.*}
	echo "${Name} --traffic"
	echo "${Name} --ip"
	echo "${Name} --ip-public"
	echo "${Name} --ip-private"
	echo "${Name} --ip-cidr"
	echo "${Name} --dep"
	echo "${Name} --scan"
}

Network()
{
	local Action="${1}"
	shift
	case ${Action} in
		--help)
			help
			;;
		--traffic)
			ss -t -u
			;;
		--ip)
			ip address
			;;
		--ip-public)
			curl http://ifconfig.me
			echo ""
			;;
		--ip-private)
			hostname -I | tr ' ' '\n' | grep "\."
			;;
		--ip-cidr)
			ip address | grep "\." | grep -w "inet" | sed "s/inet /|/g" | cut -d '|' -f 2 | cut -d ' ' -f 1
			;;
	#	--mac)
	#		ip address | grep "inet"
	#		;;
		--dep)
			which ip
			;;
		--scan)
			local IsSudo=$(sudo whoami 2> /dev/null)
			local IsInstalled=$(which nmap 2> /dev/null)
			if [ ! -z "${IsInstalled}" ]; then
				local cidrNum
				local IP
				for cidr in $(Network --ip-cidr | grep -v 127.0.0.1);
				do
					cidrNum=${cidr##*/}
					IP=${cidr%%/*}
					IP="${IP%.*}"
					if [ ! -z "${IsSudo}" ]; then
						echo "[SUDO]"
						sudo nmap "${IP}.0/${cidrNum}"
					else
						echo "[${USER}]"
						nmap "${IP}.0/${cidrNum}"
					fi
				done
			fi
			;;
		*)
			;;
	esac
}

Network $@
