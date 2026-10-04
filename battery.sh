#!/bin/bash

help()
{
	local Name="${0}"
	Name=${Name##*/}
	Name=${Name%%.*}
	echo "${Name} -s"
	echo "${Name} --status"
	echo "${Name} -p"
	echo "${Name} --power"
	echo "${Name} -pp"
	echo "${Name} --power-percent"
	echo "${Name} -c"
	echo "${Name} --company"
	echo "${Name} -t"
	echo "${Name} --type"

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
