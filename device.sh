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
	--help)
		help
		;;
	--tty)
		ls /dev/tty* | sed "s/^\/dev\///g" | sort -u
		;;
	--list)
#		lsblk -o MOUNTPOINTS,KNAME,TYPE,SIZE,MODEL
		lsblk -P
		;;
	--usb)
		lsusb
		;;
	--info)
		for name in $(lsblk -o KNAME | grep -v "^KNAME");
		do
			udevadm info --name=/dev/${name} 2> /dev/null
		done
		;;
	*)
		;;
esac
