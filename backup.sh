#!/bin/bash

SOURCE_DIR="/var/www/html"
BACKUP_DIR="/backup"
DATE=$(date +%F_%H-%M)

mkdir -p "$BACKUP_DIR"
tar -czf "$BACKUP_DIR/html_backup_$DATE.tar.gz" "$SOURCE_DIR"

echo "[✓] Backup complete at $BACKUP_DIR/html_backup_$DATE.tar.gz"

