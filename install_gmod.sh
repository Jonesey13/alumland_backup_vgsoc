#!/usr/bin/env bash
if [ ! -d "~/gmodds" ]
then
    ./steamcmd.sh +login anonymous +force_install_dir ../gmodds +app_update 4020 validate +quit
fi