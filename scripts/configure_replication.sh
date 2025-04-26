#!/bin/bash
echo "[*] Configuring replication..."
ldapmodify -Y EXTERNAL -H ldapi:/// -f /usr/local/sbin/setup_replication.ldif
echo "[*] Replication configuration applied."