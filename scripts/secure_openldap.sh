#!/bin/bash
echo "[*] Securing OpenLDAP..."
bash /usr/local/sbin/generate_ldap_certs.sh

ldapmodify -Y EXTERNAL -H ldapi:/// -f /usr/local/sbin/configure_tls.ldif

ldapmodify -Y EXTERNAL -H ldapi:/// <<EOF
dn: cn=config
changetype: modify
replace: olcDisallows
olcDisallows: bind_anon
EOF

systemctl restart slapd
echo "[*] LDAP secured with TLS and anonymous binds disabled."