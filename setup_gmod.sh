#!/usr/bin/env bash
if [ ! -d ~/gmodds/css/cstrike ]
then
    mkdir ~/gmodds/css
    ~/steamcmd/steamcmd.sh +login anonymous +force_install_dir ../gmodds/css +app_update 232330 validate +quit
fi
if [ ! -f ~/gmodds/srcds_run ]
then
    ~/steamcmd/steamcmd.sh +login anonymous +force_install_dir ../gmodds +app_update 4020 validate +quit
fi
if [ ! -d ~/gmodds/garrysmod/gamemodes/prop_hunt ]
then
    pushd ~/gmodds/garrysmod/gamemodes
    git clone https://github.com/Newbrict/ObjHunt.git prop_hunt
    popd
fi

cp ~/mount.cfg ~/gmodds/garrysmod/cfg
cp ~/server.cfg ~/gmodds/garrysmod/cfg
sed -i "s/sv_password/sv_password ${SERVER_PASSWORD}/" ~/gmodds/garrysmod/cfg/server.cfg
sed -i "s/rcon_password/rcon_password ${RCON_PASSWORD}/" ~/gmodds/garrysmod/cfg/server.cfg

~/gmodds/srcds_run -game garrysmod +gamemode prop_hunt +maxplayers 32 +map cs_italy +host_workshop_collection ${WORKSHOP_COLLECTION_ID:=2215505010} -ip 0.0.0.0 -port ${SERVER_PORT:=27015} -condebug