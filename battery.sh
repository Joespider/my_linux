#!/bin/bash

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
		*)
			;;
	esac
fi
