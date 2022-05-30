MOUNT_BODY='//automatically maintained by the mount.sh script
//specify your mounts using environment variables
"mountcfg"
{'
MOUNT_FOOTER='}'
MOUNT_GAMES='none'

mount_game(){
	echo "Mounting $1..."
	mkdir /home/gmod/mounts/$1 -p
	
	if [ "${MOUNT_GAMES}" != "none" ];
	then
		MOUNT_GAMES="${MOUNT_GAMES}
force_install_dir /home/gmod/mounts/$1
app_update $2 validate"
	else
		MOUNT_GAMES="force_install_dir /home/gmod/mounts/$1
app_update $2 validate"
	fi
	
	#add this game to the list of mounted games
	MOUNT_BODY="${MOUNT_BODY}
	\"$1\" \"/home/gmod/mounts/$1/$1\" "
}

#game mounting
if [ "${MOUNT_CSGO}" -ne 0 ];
then
	MOUNT_ANON="1"
	mount_game "csgo" "740"
fi

if [ "${MOUNT_CSS}" -ne 0 ];
then
	MOUNT_ANON="1"
	mount_game "cstrike" "232330"
fi

if [ "${MOUNT_DOD}" -ne 0 ];
then
	MOUNT_ANON="1"
	mount_game "dod" "232290"
fi

if [ "${MOUNT_L4D}" -ne 0 ];
then
	MOUNT_ANON="1"
	mount_game "left4dead" "222840"
fi

if [ "${MOUNT_L4D2}" -ne 0 ];
then
	MOUNT_ANON="1"
	mount_game "left4dead2" "222860"
fi

if [ "${MOUNT_TF}" -ne 0 ];
then
	MOUNT_ANON="1"
	mount_game "tf" "232250"
fi

#mounts that need login
if [ "${MOUNT_HL1}" -ne 0 ];
then
	MOUNT_LOGIN="1"
	MOUNT_HL1="0"
	mount_game "hl1" "280"
fi

if [ "${MOUNT_HL2_EP1}" -ne 0 ];
then
	MOUNT_LOGIN="1"
	MOUNT_HL2_EP1="0"
	mount_game "episodic" "380"
fi

if [ "${MOUNT_HL2_EP2}" -ne 0 ];
then
	MOUNT_LOGIN="1"
	MOUNT_HL2_EP2="0"
	mount_game "ep2" "420"
fi

if [ "${MOUNT_HL2_LOST_COAST}" -ne 0 ];
then
	MOUNT_LOGIN="1"
	MOUNT_HL2_LOST_COAST="0"
	mount_game "lostcoast" "340"
fi

if [ "${MOUNT_PORTAL}" -ne 0 ];
then
	MOUNT_LOGIN="1"
	MOUNT_PORTAL="0"
	mount_game "portal" "400"
fi

if [ "${MOUNT_PORTAL2}" -ne 0 ];
then
	MOUNT_LOGIN="1"
	MOUNT_PORTAL2="0"
	mount_game "portal2" "620"
fi

#do the mounting
if [ "${MOUNT_GAMES}" != "none" ];
then
	mkdir /home/gmod/temp -p
	if [ "${MOUNT_LOGIN}" -ne 0 ];
	then
		MOUNT_LOGIN="0"
		echo "${MOUNT_GAMES}
quit" > /home/gmod/temp/mounts.txt
		echo "A mounted game requires you to login to mount its content."
		echo "Please note the mounted games which require a login will not autoupdate."
		echo "Once you have logged in, type the following command:"
		echo "runscript /home/gmod/temp/mounts.txt"
		/home/gmod/steamcmd/steamcmd.sh
	fi
	
	if [ "${MOUNT_ANON}" -ne 0 ];
	then
		echo "@ShutdownOnFailedCommand 0
@NoPromptForPassword 1
login anonymous
${MOUNT_GAMES}
quit" > /home/gmod/temp/mounts.txt
		/home/gmod/steamcmd/steamcmd.sh +runscript /home/gmod/temp/mounts.txt +quit
	fi
	
	rm -rf /home/gmod/temp
fi

#replace the mount.cfg file
rm -f /home/gmod/server/garrysmod/cfg/mount.cfg
echo "${MOUNT_BODY}${MOUNT_FOOTER}" > /home/gmod/server/garrysmod/cfg/mount.cfg