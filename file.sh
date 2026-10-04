#!/bin/bash

help()
{
	local Name="${0}"
	Name=${Name##*/}
	Name=${Name%%.*}
	echo "${Name} -l"
	echo "${Name} --list"
	echo "${Name} -i"
	echo "${Name} --info"
	echo "${Name} -s"
	echo "${Name} --size"
	echo "${Name} -u"
	echo "${Name} --user"
	echo "${Name} -g"
	echo "${Name} --group"
	echo "${Name} -p"
	echo "${Name} --permission"
	echo "${Name} -t"
	echo "${Name} --perm-tag"
	echo "${Name} -y"
	echo "${Name} --type"
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
