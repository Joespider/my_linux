#!/bin/bash

help()
{
	local Name="${0}"
	Name=${Name##*/}
	Name=${Name%%.*}
	echo ${Name}
	echo "--info"
	echo "--root"
	echo "--home"
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
