#!/bin/bash

Action="${1}"
shift
case ${Action} in
	--info)
		df -h
		;;
	*)
		;;
esac
