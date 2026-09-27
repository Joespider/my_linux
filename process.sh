#!/bin/bash

help()
{
	local Name="${0}"
	Name=${Name##*/}
	Name=${Name%%.*}
	echo ${Name}
}

Action="${1}"
shift
case ${Action} in
	--help)
		help
		;;
	--all)
		ps aux
		;;
	--root)
		ps aux | egrep "^USER|^root"
		;;
	--user)
		user="${1}"
		shift
		if [ ! -z "${user}" ]; then
			ps aux | egrep "^USER|^${user:0:7}"
		else
			ps aux | egrep "^USER|^${USER:0:7}"
		fi
		;;
	*)
		;;
esac
