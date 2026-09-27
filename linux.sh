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
Run ${Action} ${@}
