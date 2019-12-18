#!/bin/sh


CONTAINER_TEST=$(docker ps -a | grep qBittorrent | awk '{print $1}')

if [ -n $CONTAINER_TEST ]; then
        docker rm -f qBittorrent
fi

docker create -i -t --name=qBittorrent \
        -p 18181:18181 \
        -p 8999:8999 \
        -p 8999:8999/udp \
        -e PUID=999 -e PGID=999 \
        -e WEBUI_PORT=18181 \
        -v /etc/localtime:/etc/localtime:ro \
        -v /volume1/Docker/qBittorrent/config:/config:rw \
        -v /volume1/Download/qBittorrent:/downloads:rw \
        --restart unless-stopped \
        markusmcnugen/qbittorrentvpn:latest

docker start qBittorrent

exit 0