FROM cm2network/steamcmd
COPY ./install_gmod.sh .
RUN ./install_gmod.sh
ENTRYPOINT ["../gmodds/srcds_run", "-game", "garrysmod", "+maxplayers", "32", "+map", "gm_construct", "-ip", "0.0.0.0", "-port", "27016"]
EXPOSE 27015
EXPOSE 27005