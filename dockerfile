FROM cm2network/steamcmd
USER root
RUN apt-get update && apt-get install -y git
USER steam
COPY . /home/steam
RUN mkdir /home/steam/gmodds && chown steam /home/steam/gmodds
ENTRYPOINT /home/steam/setup_gmod.sh
EXPOSE 27015