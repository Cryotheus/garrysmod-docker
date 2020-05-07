#!/bin/bash
sleep 1
export INTERNAL_IP=`ip route get 1 | awk '{print $NF;exit}'`

if [ -n "${NAME}" ]; then
    ARGS="+hostname \"${NAME}\" ${ARGS}"
fi

if [ -n "${GSLT}" ]; then
    ARGS="+sv_setsteamaccount \"${GSLT}\" ${ARGS}"
fi

if [ -n "${AUTHKEY}" ]; then
    ARGS="-authkey \"${AUTHKEY}\" ${ARGS}"
fi

if [ -n "${PRODUCTION}" ] && [ "${PRODUCTION}" -ne 0 ]; then
    MODE="production"
    ARGS="-disableluarefresh ${ARGS}"
else
    MODE="development"
    ARGS="-gdb gdb -debug ${ARGS}"
fi

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