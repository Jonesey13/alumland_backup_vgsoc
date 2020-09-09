#!/usr/bin/env bash
if [ ! -f ~/gmodds/srcds_run ]
then
    ~/steamcmd/steamcmd.sh +login anonymous +force_install_dir ../gmodds +app_update 4020 validate +quit
fi
if [ ! -d ~/gmodds/cstrike ]
then
    ~/steamcmd/steamcmd.sh +login anonymous +force_install_dir ../gmodds/cstrike +app_update 232330 validate +quit
fi

cp ~/mount.cfg ~/gmodds/garrysmod/cfg
cp ~/server.cfg ~/gmodds/garrysmod/cfg
sed -i "s/sv_password/sv_password ${SERVER_PASSWORD}/" ~/gmodds/garrysmod/cfg/server.cfg
sed -i "s/sv_password/rcon_password ${RCON_PASSWORD}/" ~/gmodds/garrysmod/cfg/server.cfg

~/gmodds/srcds_run -game garrysmod +gamemode prop_hunt +maxplayers 32 +map gm_construct +host_workshop_collection 2215505010 -ip 0.0.0.0 -port ${SERVER_PORT} -condebug