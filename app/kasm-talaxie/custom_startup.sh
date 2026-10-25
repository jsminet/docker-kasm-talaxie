#!/usr/bin/env bash
# Autorestart
set -x

cd /opt/talaxie

while true; do
    if ! pgrep -f $TALAXIE_EXE > /dev/null; then
        ./$TALAXIE_EXE -nosplash -data $HOME/workspace -consoleLog
    fi
    sleep 10
done