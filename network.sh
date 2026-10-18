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
		*)
			;;
	esac
}

Network $@
