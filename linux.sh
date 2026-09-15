#!/bin/bash

Root=~/Programs/Bash/bin

Action="${1}"
shift
case ${Action} in
	--battery)
		if [ -f ${Root}/battery.sh ]; then
			${Root}/battery.sh ${@}
		fi
		;;
	--network)
		if [ -f ${Root}/network.sh ]; then
			${Root}/network.sh ${@}
		fi
		;;
	*)
		echo "I work!"
		;;
esac
