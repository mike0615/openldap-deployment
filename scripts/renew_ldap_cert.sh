#!/bin/bash
# Renew LDAP SSL Certificate via Let's Encrypt and reload slapd

DOMAIN="ldap.sys"
EMAIL="admin@example.com"
LDAP_CERT_DIR="/etc/ldap/certs"

echo "[*] Renewing SSL Certificate for $DOMAIN..."

certbot certonly --standalone -d $DOMAIN --noninteractive --agree-tos -m $EMAIL

if [ -f "/etc/letsencrypt/live/$DOMAIN/fullchain.pem" ]; then
  echo "[*] Updating LDAP certs..."
  cp /etc/letsencrypt/live/$DOMAIN/fullchain.pem $LDAP_CERT_DIR/ldap-cert.pem
  cp /etc/letsencrypt/live/$DOMAIN/privkey.pem $LDAP_CERT_DIR/ldap-key.pem
  chown openldap:openldap $LDAP_CERT_DIR/*.pem
  chmod 600 $LDAP_CERT_DIR/*.pem

  echo "[*] Restarting slapd..."
  systemctl restart slapd
else
  echo "[!] Certificate renewal failed."
fi