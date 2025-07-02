#version=RHEL9
ignoredisk --only-use=sda
autopart --type=lvm
keyboard us
lang en_US.UTF-8
network --bootproto=static --device=eth0 --ip=192.168.1.50 --netmask=255.255.255.0 --gateway=192.168.1.1 --nameserver=192.168.1.1 --hostname=ipa-server.example.local
rootpw Passw0rd123
firewall --enabled --service=ssh
authselect --useshadow --passalgo=sha512
selinux --enforcing
timezone America/New_York --isUtc
bootloader --location=mbr
reboot

%packages
@^minimal-environment
ipa-server
ipa-server-dns
%end

%post --log=/root/ks-post.log
systemctl enable ipa.service
%end
