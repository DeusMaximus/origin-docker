#!/bin/bash
mkdir -p /mnt/user/data/data /data/logs
docker rm -f cache

docker run --name cache -d --restart=always -p 80:80 -v /mnt/user/data/data:/cache -v /mnt/user/data/logs:/var/log/nginx cache
