#!/bin/bash
echo "[*] Installing OpenLDAP Server..."
dnf install -y openldap-servers openldap-clients migrationtools
systemctl enable slapd
systemctl start slapd
echo "[*] OpenLDAP installed and started."