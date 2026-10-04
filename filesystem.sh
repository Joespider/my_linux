#!/bin/bash

help()
{
	local Name="${0}"
	Name=${Name##*/}
	Name=${Name%%.*}
	echo "${Name} --config"
	echo "${Name} --temp"
	echo "${Name} -r"
	echo "${Name} --root"
	echo "${Name} -h"
	echo "${Name} --home"
}

Action="${1}"
shift
case ${Action} in
#	-i|--info)
#		df -h
#		;;
	--config)
		echo /etc/
		;;
	--temp)
		echo /tmp/
		;;
	--logs)
		echo /var/log/
		;;
	-r|--root)
		echo /
		;;
	-h|--home)
		echo ~/
		;;
	*)
		;;
esac
