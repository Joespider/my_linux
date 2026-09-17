#!/bin/bash

Action="${1}"
shift
case ${Action} in
	--traffic)
		ss -t -u
		;;
	--ip)
		ip address
		;;
	--dep)
		which ip
		;;
	*)
		;;
esac
