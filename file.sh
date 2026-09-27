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
		ls ${@}
		;;
	-i|--info)
		ls -lh ${@}
		;;
	-s|--size)
		stat -c "%s" ${@}
		;;
	-u|--user)
		stat -c "%U" ${@}
		;;
	-g|--group)
		stat -c "%G" ${@}
		;;
	-p|--permission)
		stat -c "%a" ${@}
		;;
	-t|--perm-tag)
		stat -c "%A" ${@}
		;;
	-y|--type)
		stat -c "%F" ${@}
		;;
	--help)
		help
		;;
	*)
		;;
esac
