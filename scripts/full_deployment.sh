#!/bin/bash
bash /usr/local/sbin/install_openldap.sh
bash /usr/local/sbin/secure_openldap.sh
bash /usr/local/sbin/configure_fail2ban.sh
bash /usr/local/sbin/configure_replication.sh
bash /usr/local/sbin/setup_backups.sh
echo "✅ OpenLDAP Full Deployment Completed Successfully!"