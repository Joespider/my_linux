#!/bin/bash

Root=$(dirname $(realpath $0))

Run()
{
	local Script="${1}"
	shift
	if [ -f ${Root}/${Script}.sh ]; then
		${Root}/${Script}.sh --help
	fi
}

#Action="${1}"
#shift
#case ${Action} in
#	-b|--battery)
#		Run battery.sh
#		;;
#	-n|--network)
#		Run network.sh
#		;;
#	-f|--filesystem)
#		Run filesystem.sh
#		;;
#	*)
#		echo "--battery"
#		echo "--network"
#		echo "--filesystem"
#		;;
#esac

Parent_Command=$(ps -o comm= $PPID)
for Script in $(find ${Root} -name '*.sh' 2> /dev/null);
do
	ScriptName="${0##*/}"
	Script=${Script##*/}
	case ${Script} in
		${0##*/}|${Parent_Command})
			;;
		*)
			ScriptName=${Parent_Command%%.*}
			Script=${Script%%.*}
			Run ${Script} | sed "s/^${Script}/${ScriptName} ${Script}/1"
			;;
	esac
done
