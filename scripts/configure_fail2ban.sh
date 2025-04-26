#!/bin/bash
echo "[*] Installing Fail2Ban..."
dnf install -y fail2ban
cp /usr/local/sbin/slapd.conf /etc/fail2ban/filter.d/
cp /usr/local/sbin/slapd.local /etc/fail2ban/jail.d/
systemctl enable fail2ban
systemctl start fail2ban
echo "[*] Fail2Ban configured for LDAP protection."