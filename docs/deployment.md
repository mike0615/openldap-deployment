# Deployment Guide

## Requirements
- Rocky Linux 8/9 or compatible
- Ansible 2.9+
- Git
- Root SSH access to your servers

## Quick Setup

Clone the repo and deploy:
```bash
git clone https://github.com/YOUR-USERNAME/openldap-deployment.git
cd openldap-deployment
ansible-playbook -i ansible/inventory ansible/playbook.yml
```

This installs OpenLDAP, configures TLS/SSL, Fail2Ban protection, and sets up daily backups automatically.