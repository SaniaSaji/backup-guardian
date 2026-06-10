#!/bin/bash

# ======================
# PATHS (Docker-safe)
# =================
BASE_DIR=$(pwd)

SOURCE_DIR="$BASE_DIR/data"
BACKUP_DIR="$BASE_DIR/backups"
LOG_DIR="$BASE_DIR/logs"
LOG_FILE="$LOG_DIR/backup.log"

mkdir -p "$SOURCE_DIR"
mkdir -p "$BACKUP_DIR"
mkdir -p "$LOG_DIR"

mkdir -p "$SOURCE_DIR" "$BACKUP_DIR" "$BASE_DIR/logs"

# ======================
# BACKUP CREATION
# ======================
DATE=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="backup_$DATE.tar.gz"

echo "Backup started at $DATE" >> "$LOG_FILE"

tar -czf "$BACKUP_DIR/$BACKUP_FILE" "$SOURCE_DIR"

# ======================
# SUCCESS / FAILURE
# ======================
if [ $? -eq 0 ]; then
    echo "Backup successful: $BACKUP_FILE" >> "$LOG_FILE"

    # ======================
    # AZURE UPLOAD (NO KEY VAULT IN DOCKER)
    # ======================
    echo "Uploading to Azure Blob..." >> "$LOG_FILE"

    az storage blob upload \
        --account-name "$AZURE_STORAGE_ACCOUNT" \
        --account-key "$AZURE_STORAGE_KEY" \
        --container-name backups \
        --file "$BACKUP_DIR/$BACKUP_FILE" \
        --name "$BACKUP_FILE"

    if [ $? -eq 0 ]; then
        echo "Upload successful: $BACKUP_FILE" >> "$LOG_FILE"
    else
        echo "Azure upload failed: $BACKUP_FILE" >> "$LOG_FILE"
    fi

else
    echo "Backup failed at $DATE" >> "$LOG_FILE"
fi
