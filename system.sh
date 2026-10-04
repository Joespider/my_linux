#!/bin/bash

help()
{
	local Name="${0}"
	Name=${Name##*/}
	Name=${Name%%.*}
	echo "${Name} --info"
	echo "${Name} --kernel"
	echo "${Name} --kernel-release"
	echo "${Name} --kernel-version"
	echo "${Name} --machine"
	echo "${Name} --os"
}

Action="${1}"
shift
case ${Action} in
	--help)
		help
		;;
	--kernel)
		uname -s
		;;
	--kernel-release)
		uname -r
		;;
	--kernel-version)
		uname -v
		;;
	--machine)
		uname -m
		;;
	--os)
		uname -o
		;;
	--info)
		uname -a
		;;
	*)
		;;
esac
