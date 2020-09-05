FROM cm2network/steamcmd
COPY . /home/steam
RUN mkdir /home/steam/gmodds && chown steam /home/steam/gmodds
ENTRYPOINT /home/steam/setup_gmod.sh
EXPOSE 27015
EXPOSE 27016
EXPOSE 27005