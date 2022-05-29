#!/bin/bash
if [ -n "${GSLT}" ];
then
	ARGS="+sv_setsteamaccount \"${GSLT}\" ${ARGS}"
fi

if [ -n "${PRODUCTION}" ];
then
	if [ "${PRODUCTION}" -ne 0 ];
	then
		MODE="production"
		ARGS="-disableluarefresh ${ARGS}"
	else
		MODE="debug"
		ARGS="-gdb gdb -debug ${ARGS}"
	fi
else
	MODE="development"
	ARGS="-gdb gdb -debug ${ARGS}"
fi

# UPDATE MOUNTED GAMES
echo "Updating mounts..."
sh /home/gmod/mount.sh

# START THE SERVER
echo "Starting server on ${MODE} mode..."
/home/gmod/server/srcds_run \
	-game garrysmod \
	-norestart \
	-strictportbind \
	-autoupdate \
	-steam_dir "/home/gmod/steamcmd" \
	-steamcmd_script "/home/gmod/update.txt" \
	-port "${PORT}" \
	-maxplayers "${MAXPLAYERS}" \
	+gamemode "${GAMEMODE}" \
	+map "${MAP}" "${ARGS}"