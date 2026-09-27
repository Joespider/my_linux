#!/bin/bash

help()
{
	local Name="${0}"
	Name=${Name##*/}
	Name=${Name%%.*}
	echo ${Name}
	echo "--traffic"
	echo "--ip"
	echo "--dep"
}

Action="${1}"
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
		hostname -I | tr ' ' '\n'
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
