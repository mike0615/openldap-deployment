# FreeIPA Enterprise LDAP Deployment on Rocky Linux 9.6

## Step 1: Prepare Rocky Linux 9.6 Minimal Installation
- Install Rocky Linux 9.6 Minimal on the target server.
- Configure a static IP address and hostname (e.g., ipa-server.example.local).

## Step 2: Install FreeIPA Server
```bash
sudo dnf install -y ipa-server ipa-server-dns
```

## Step 3: Run FreeIPA Installation
```bash
sudo ipa-server-install --setup-dns --allow-zone-overlap --no-forwarders --auto-reverse --no-ntp -n example.local -r EXAMPLE.LOCAL -p Passw0rd123 -a Passw0rd123 -U
```

## Step 4: Allow Firewall Ports
```bash
sudo firewall-cmd --permanent --add-service=freeipa-ldap
sudo firewall-cmd --permanent --add-service=freeipa-ldaps
sudo firewall-cmd --permanent --add-service=freeipa-replication
sudo firewall-cmd --reload
```

## Step 5: Verify FreeIPA Services
```bash
sudo ipa-healthcheck
sudo ipa user-find
```

## Step 6: Access FreeIPA Web UI
- URL: https://ipa-server.example.local
- Login: admin
- Password: Passw0rd123
