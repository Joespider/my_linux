#!/bin/bash

help()
{
	local Name="${0}"
	Name=${Name##*/}
	Name=${Name%%.*}
	echo ${Name}
	echo "--status"
	echo "--power"
	echo "--power-percent"
	echo "--company"
	echo "--type"
}

#Dirs
powerDir="/sys/class/power_supply"
batteryInfo="${powerDir}/BAT0"

if [ -d ${batteryInfo} ]; then
	Action="${1}"
	case ${Action} in
		-s|--status)
			cat "${batteryInfo}/status"
			;;
		-p|--power)
			cat "${batteryInfo}/capacity"
			;;
		-pp|--power-percent)
			cat "${batteryInfo}/capacity" | sed -e 's/$/%/'
			;;
		-c|--company)
			cat "${batteryInfo}/manufacturer"
			;;
		-t|--type)
			cat "${batteryInfo}/technology"
			;;
		--help)
			help
			;;
		*)
			;;
	esac
fi
