MOUNT_BODY='//automatically maintained by the mount.sh script
//specify your mounts using environment variables
"mountcfg"
{'
MOUNT_FOOTER='}'
MOUNT_GAMES='none'

mount_game(){
	echo "Mounting $1..."
	mkdir /home/gmod/mounts/$1 -p
	
	if [ "${MOUNT_GAMES}" != "none"];
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
	\"$1\" \"/home/gmod/mounts/$1\" "
}

if [ -n "${MOUNT_CSS}" ] && [ "${MOUNT_CSS}" -ne 0 ];
then
	mount_game "cstrike" "232330"
fi

if [ -n "${MOUNT_TF}" ] && [ "${MOUNT_TF}" -ne 0 ];
then
	mount_game "tf" "232250"
fi

if [ "${MOUNT_GAMES}" != "none" ];
then
	mkdir /home/gmod/temp -p
	echo "@ShutdownOnFailedCommand 0
@NoPromptForPassword 1
login anonymous
${MOUNT_GAMES}
quit" > /home/gmod/temp/mounts.txt
	
	/home/gmod/steamcmd/steamcmd.sh +runscript /home/gmod/temp/mounts.txt +quit
	rm -rf /home/gmod/temp
fi

#replace the mount.cfg file
rm -f /home/gmod/server/garrysmod/cfg/mount.cfg
echo "${MOUNT_BODY}${MOUNT_FOOTER}" > /home/gmod/server/garrysmod/cfg/mount.cfg