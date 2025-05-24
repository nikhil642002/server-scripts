#!/bin/bash

LOG_FILE="/var/log/system_monitor.log"
DATE=$(date '+%Y-%m-%d %H:%M:%S')

CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
MEM=$(free -m | awk '/Mem:/ {printf("%.2f"), $3/$2 * 100.0}')
DISK=$(df -h / | awk 'NR==2 {print $5}')

echo "$DATE | CPU: $CPU% | Memory: $MEM% | Disk: $DISK" >> "$LOG_FILE"
