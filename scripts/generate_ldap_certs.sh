#!/bin/bash
CERT_DIR="/etc/ldap/certs"
mkdir -p "$CERT_DIR"

openssl req -new -x509 -days 3650 -nodes -out "$CERT_DIR/ldap-cert.pem" -keyout "$CERT_DIR/ldap-key.pem" -subj "/C=US/ST=Florida/L=Sebastian/O=YourCompany/OU=IT Department/CN=ldap.sys"

chown openldap:openldap "$CERT_DIR"/*.pem
chmod 600 "$CERT_DIR"/*.pem

echo "Certificates generated in $CERT_DIR"