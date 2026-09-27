#!/bin/bash

Root=$(dirname $(realpath $0))

Run()
{
	local Script="${1}"
	shift
	if [ -f ${Root}/${Script} ]; then
		${Root}/${Script} --help
	fi
}

Action="${1}"
shift
case ${Action} in
	-b|--battery)
		Run battery.sh
		;;
	-n|--network)
		Run network.sh
		;;
	-f|--filesystem)
		Run filesystem.sh
		;;
	*)
		echo "--battery"
		echo "--network"
		echo "--filesystem"
		;;
esac
