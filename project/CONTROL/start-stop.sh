#!/bin/sh -e

case "$1" in
    start)
        echo "Start qBittorrent container..."
        docker start qBittorrent
        sleep 6

        ;;
    stop)
        echo "Stop qBittorrent container..."
        docker stop qBittorrent
        sleep 6
        ;;
    reload)
        echo "Reload qBittorrent container..."
        docker stop  qBittorrent
        sleep 6
        docker start qBittorrent
        sleep 6
        ;;
    *)
        echo "Usage: $0 {start|stop|reload}"
        exit 1
        ;;
esac
exit 0