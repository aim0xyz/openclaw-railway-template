#!/bin/bash
set -e

chown -R openclaw:openclaw /data
chmod 700 /data

if [ -d /app/skills ]; then
  mkdir -p /data/workspace/skills
  cp -R /app/skills/* /data/workspace/skills/
  chown -R openclaw:openclaw /data/workspace/skills
fi

if [ ! -d /data/.linuxbrew ]; then
  cp -a /home/linuxbrew/.linuxbrew /data/.linuxbrew
fi

rm -rf /home/linuxbrew/.linuxbrew
ln -sfn /data/.linuxbrew /home/linuxbrew/.linuxbrew

exec gosu openclaw node src/server.js
