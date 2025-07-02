#!/bin/bash
hostnamectl set-hostname ipa-server.example.local
dnf install -y ipa-server ipa-server-dns
ipa-server-install --setup-dns --allow-zone-overlap --no-forwarders --auto-reverse --no-ntp -n example.local -r EXAMPLE.LOCAL -p Passw0rd123 -a Passw0rd123 -U
firewall-cmd --permanent --add-service=freeipa-ldap
firewall-cmd --permanent --add-service=freeipa-ldaps
firewall-cmd --permanent --add-service=freeipa-replication
firewall-cmd --reload
