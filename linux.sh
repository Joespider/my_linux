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
case ${Action} in
	-b|--battery)
		Run battery ${@}
		;;
	-d|--device)
		Run device ${@}
		;;
	-n|--network)
		Run network ${@}
		;;
	-i|--file)
		Run file ${@}
		;;
	-f|--filesystem)
		Run filesystem ${@}
		;;
	-s|--system)
		Run system ${@}
		;;
	-u|--users)
		Run users ${@}
		;;
	-h|--help)
		Run help ${@}
		;;
	*)
		;;
esac
