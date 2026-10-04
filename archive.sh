#!/bin/bash

help()
{
	local Name="${0}"
	Name=${Name##*/}
	Name=${Name%%.*}
	echo "${Name} -x"
	echo "${Name} --unzip"
	echo "${Name} -z"
	echo "${Name} --zip"
	echo "${Name} -l"
	echo "${Name} --list"
}

Action="${1}"
shift
case ${Action} in
	-x|--unzip)
		TheFile="${1}"
		shift
		case ${TheFile} in
			*".tar.gz")
				tar -xzvf ${TheFile}
				;;
			*".zip")
				unzip ${TheFile}
				;;
			*".7z"|*".iso")
				7z x ${TheFile}
				;;
			*)
				;;
		esac
		;;
	-z|--zip)
		TheFile="${1}"
		shift
		AllFiles="${@}"
		case ${TheFile} in
			*".tar.gz")
				tar -czvf ${TheFile} ${AllFiles}
				;;
			*".zip")
				zip -r ${TheFile} ${AllFiles}
				;;
			*".7z")
				echo 7z
				;;
			*)
				;;
		esac
		;;
	-l|--list)
		TheFile="${1}"
		shift
		case ${TheFile} in
			*".tar.gz")
				tar -t ${TheFile}
				;;
			*".zip")
				unzip -l ${TheFile}
				;;
			*".7z"|*".iso")
				7z l ${TheFile}
				;;
			*)
				;;
		esac
		;;
	--help)
		help
		;;
	*)
		;;
esac
