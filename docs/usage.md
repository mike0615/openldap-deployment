# Usage Guide

## Daily Operations
- Monitor LDAP status in Grafana
- Check `/var/backups/ldap/` for daily backup files
- Fail2Ban automatically protects against brute-force attacks

## Renew SSL Certificates
Run this Ansible Playbook every 90 days:
```bash
ansible-playbook -i ansible/inventory ansible/tasks/renew_cert.yml
```

This keeps your LDAP server secured with fresh Let's Encrypt certificates!