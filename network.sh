#!/bin/bash

help()
{
	local Name="${0}"
	Name=${Name##*/}
	Name=${Name%%.*}
	echo "${Name} --traffic"
	echo "${Name} --ip"
	echo "${Name} --ip-public"
	echo "${Name} --ip-private"
	echo "${Name} --ip-cidr"
	echo "${Name} --dep"
	echo "${Name} --scan"
}

Network()
{
	local Action="${1}"
	shift
	case ${Action} in
		--help)
			help
			;;
		--traffic)
			ss -t -u
			;;
		--ip)
			ip address
			;;
		--ip-public)
			curl http://ifconfig.me
			echo ""
			;;
		--ip-private)
			hostname -I | tr ' ' '\n' | grep "\."
			;;
		--ip-cidr)
			ip address | grep "\." | grep -w "inet" | sed "s/inet /|/g" | cut -d '|' -f 2 | cut -d ' ' -f 1
			;;
	#	--mac)
	#		ip address | grep "inet"
	#		;;
		--dep)
			which ip
			which nmap
			;;
		--scan-port)
			local IP="${1}"
			local Port="${2}"
			local IsInstalled=$(which nmap 2> /dev/null)
			if [ ! -z "${IsInstalled}" ]; then

				case ${IP} in
					*":"*)
						Port="${IP##*:}"
						IP="${IP%%:*}"
						;;
#					*"."*)
#						IP=""
#						if [ -z "${Port}" ]; then
#							shift
#						fi
#						echo "${@}"
#						;;
					*)
						;;
				esac

				if [ ! -z "${IP}" ] && [ ! -z "${Port}" ]; then
					local IsSudo=$(sudo whoami 2> /dev/null)
					if [ ! -z "${IsSudo}" ]; then
						echo "[SUDO]"
						echo sudo nmap -p "${Port}" "${IP}"
					else
						echo "[${USER}]"
						nmap -p "${Port}" "${IP}"
					fi
				else
					local cidrNum
					IP=""
					Port="${1}"
					case ${Port} in
						*"."*)
							;;
						*)
							for cidr in $(Network --ip-cidr | grep -v 127.0.0.1);
							do
								cidrNum=${cidr##*/}
								IP=${cidr%%/*}
								case ${IP} in
									*".com"|*".net")
										;;
									*)
										case ${cidrNum} in
											8)
												IP="${IP%%.*}.0.0.0"
												;;
											16)
												IP="${IP%.*}"
												IP="${IP%.*}.0.0"
												;;
											24)
												IP="${IP%.*}.0"
												;;
											*)
												;;
										esac
									;;
							esac
								if [ ! -z "${IP}" ] && [ ! -z "${Port}" ]; then
									Network --scan-port "${IP}/${cidrNum}" "${Port}"
								fi
							done
							;;
					esac
				fi
			fi
			;;
		--scan)
			local IP="${1}"
			local IsInstalled=$(which nmap 2> /dev/null)
			if [ ! -z "${IsInstalled}" ]; then
				if [ ! -z "${IP}" ]; then
					local IsSudo=$(sudo whoami 2> /dev/null)
					if [ ! -z "${IsSudo}" ]; then
						echo "[SUDO]"
						sudo nmap -sL "${IP}"| grep ")$" | sed "s/Nmap scan report for //g"
					else
						echo "[${USER}]"
						nmap -sL "${IP}"| grep ")$" | sed "s/Nmap scan report for //g"
					fi
				else
					local cidrNum
					for cidr in $(Network --ip-cidr | grep -v 127.0.0.1);
					do
						cidrNum=${cidr##*/}
						IP=${cidr%%/*}
						case ${IP} in
							*".com"|*".net")
								;;
							*)
								case ${cidrNum} in
									8)
										IP="${IP%%.*}.0.0.0"
										;;
									16)
										IP="${IP%.*}"
										IP="${IP%.*}.0.0"
										;;
									24)
										IP="${IP%.*}.0"
										;;
									*)
										;;
								esac
								;;
						esac
						Network	--scan "${IP}/${cidrNum}"
					done
				fi
			fi
			;;
		*)
			;;
	esac
}

Network $@
