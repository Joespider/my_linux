#!/bin/bash

help()
{
	local Name="${0}"
	Name=${Name##*/}
	Name=${Name%%.*}
	echo ${Name}
	echo "--list"
}

Action="${1}"
shift
case ${Action} in
	-l|--list)
		subcat="${1}"
		name="${2}"
		shift
		shift
		case ${subcat} in
			user)
				if [ ! -z "${name}" ]; then
					grep "^${name}" /etc/passwd #| tr ':' '\t'
				else
					echo "{name}:{password}:{UID}:{GID}:{GECOS}:{directory}:{shell}" #| tr ':' '\t'
					cat /etc/passwd #| tr ':' '\t'
				fi
				;;
			group)
				if [ ! -z "${name}" ]; then
					grep "^${name}" /etc/group #| tr ':' '\t'
				else
					echo "{name}:{password}:{GID}:{List}" #| tr ':' '\t'
					cat /etc/group #| tr ':' '\t'
				fi
				;;
			*)
				;;
		esac
		;;
	*)
		;;
esac
