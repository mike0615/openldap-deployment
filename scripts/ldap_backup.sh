#!/bin/bash
BACKUP_DIR="/var/backups/ldap"
TIMESTAMP=$(date +%F_%H-%M-%S)
LDAP_SERVER="localhost"
BASE_DN="dc=sys"
BACKUP_FILE="$BACKUP_DIR/ldap_backup_$TIMESTAMP.ldif"

mkdir -p "$BACKUP_DIR"
ldapsearch -x -H ldap://$LDAP_SERVER -b "$BASE_DN" > "$BACKUP_FILE"

find "$BACKUP_DIR" -type f -name "*.ldif" -mtime +30 -exec rm {} \;
echo "Backup completed: $BACKUP_FILE"