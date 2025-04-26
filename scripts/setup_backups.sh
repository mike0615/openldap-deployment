#!/bin/bash
echo "[*] Setting up daily LDAP backups..."
cp /usr/local/sbin/ldap_backup.sh /usr/local/sbin/
chmod +x /usr/local/sbin/ldap_backup.sh
(crontab -l 2>/dev/null; echo "0 2 * * * /usr/local/sbin/ldap_backup.sh") | crontab -
echo "[*] Backup cron job installed."