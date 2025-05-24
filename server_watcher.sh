#!/bin/bash

SERVICE="nginx"

if ! systemctl is-active --quiet $SERVICE; then
    echo "[!] $SERVICE is down. Restarting..."
    systemctl restart $SERVICE
    echo "$(date): Restarted $SERVICE" >> /var/log/service_watcher.log
else
    echo "$(date): $SERVICE is running fine." >> /var/log/service_watcher.log
fi

