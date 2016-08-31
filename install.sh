#!/bin/bash
#Created By:	Richard L. Jackson
#Date Created:	2016-08-31
#Purpose:	Install a package.
####

#0: inactive
#1: active
exec_cmd=1
option=$1

check_reqs(){
	if [ ! -z "`rubyc -v 2> /dev/null`" ];
	then
		printf "\033[35mFound, ruby version \033[32m`ruby -v`\033[0m\n"
	else
		printf "\033[35mError:\033[0m\t\033[31mUnable to find ruby.\033[0m\n"
		printf "\033[33mRun\033[0m \033[45m'apt-get install ruby ruby-dev'\033[0m\n"
		printf "\t[-or-]\n"
		printf "\033[33mRun\033[0m \033[45m'brew install ruby ruby-dev'\033[0m\n"
	fi
	}

install_reqs(){
	systype=$1
	#Debug
	while :
	do
		if test ${exec_cmd} -ge 1;
		then
			case $systype in
				mac) printf  "$systype -> \033[3;44m\`brew install ruby && brew install ruby-dev\`\033[0m\n";;
				linux) printf "$systype ->  \033[3;44m\`apt-get -y install ruby ruby2.2-dev\`\033[0m\n";;
			esac
			read -p "Execute Command?[y|Y|N|n] " _choice
			case $_choice in
				y|Y|yes|Yes)
					case ${systype} in
						mac) brew install ruby && brew install ruby-dev;;
						linux) apt-get -y install ruby ruby2.2-dev;;
					esac
				;;
				n|No|N|no) read -p "Exit Execution?[y|Y|N|n] " _exit
					case $_exit in
						y|Y|yes|Yes) break;;
					esac
				;;
				*) printf "\033[35mExiting, installation process!"
				break
				;;
			esac
		else
			echo "Exiting, installation process!"
			exit 0
		fi
	done
	}

usage(){
	printf "USAGE:\n"
	printf "\t$0 [ COMMAND ] [[ ARGS ]]\n"
	}

example(){
	printf "EXAMPLE:\n"
	printf "\$$0 --install [ linux|mac ]\n"
	printf "\$$0 --check\n"
	}


help_menu(){
	printf "\033[1;35mTweety Bot Installation Script\033[0m\n"
	printf "\033[33mInstall Packages\033[0m\t\033[35m[ -i, -install, --install ] [OPERATING_SYSTEM]\033[0m\n"
	printf "\033[33mCheck Installation\033[0m\t\033[35m[ -c, -check, --check ]\033[0m\n"
	usage
	example
	}

case $option in
	-c|-check|--check) check_reqs;;
	-i|-install|--install)
		case "$2" in
			mac|linux) install_reqs $2;;
			*) printf "\033[35mError:\033[0m\t\033[31mMissing or invalid parameter was entered\033[0m\n";;
		esac
	;;
	-h|-help|--help) help_menu;;
	*) printf "\033[35mError:\033[0m\t\033[31mMissing or invalid parameter was entered!\033[0m\n"
	printf "\033[34mTry\033[0m \033[45m'-h'\033[0m \033[34mto view options.\033[0m\n"
	;;
esac
