FROM ubuntu:20.04

LABEL maintainer="Moinul05" \
      name="my_minecraft_server with docker" \
      version="1.0"

#set environment variables
ENV DEBIAN_FRONTEND noninterective
#install packages
RUN apt update -y \
    && apt upgrade -y \
    && apt install -y \
       openjdk-8-jre-headless \ 
       wget \
    && apt-get clean autoclean \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*
#add dedicated minecraft user
RUN useradd -m -d /srv minecraft

# add entrypoint script
ADD start.sh /start.sh

#create required data directory and dedicated user minecraft as a owner
RUN mkdir -p /srv \
     && chown -R minecraft:minecraft /srv
RUN chmod +x /start.sh \
     && chown minecraft:minecraft /start.sh

# expose a volume - for server data persistancy
VOLUME /srv
# minecraft port
EXPOSE 25565

#switch to the dedicated minecraft user before executing the entrypoint script
USER minecraft
ENTRYPOINT [ "/start.sh" ]







