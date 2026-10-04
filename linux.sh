#!/bin/bash

Root=$(dirname $(realpath $0))

Run()
{
	local Script="${1}.sh"
	shift
	if [ -f ${Root}/${Script} ]; then
		${Root}/${Script} ${@}
	fi
}

Action="${1}"
shift
if [ ! -z "${1}" ]; then
	case ${1} in
		--help)
			Run help ${@}
			;;
		*)
			Run ${Action} ${@}
			;;
	esac
else
	Run help ${@}
fi
