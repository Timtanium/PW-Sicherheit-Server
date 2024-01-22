#!/bin/bash

#Add Demo Users
pam-auth-update

echo -n 'root:password' | chpasswd

useradd -m admin
echo -n 'admin:admin' | chpasswd

useradd -m michael
echo -n 'michael:cocacola' | chpasswd

useradd -m tim
echo -n 'tim:17071985' | chpasswd

useradd -m radio
echo -n 'radio:paloma' | chpasswd

#setup ssh
mkdir /etc/sysconfig
echo "OPTIONS=\"-ddd\" " >> /etc/sysconfig/sshd
#ssh-keygen -A
bash -c 'cat << EOF > /etc/ssh/sshd_config
PasswordAuthentication yes
PermitRootLogin yes
MaxAuthTries 2147483647
EOF'

#Start Services
cd /opt/juice-shop
(npm start &)
service ssh start && tail -f /dev/null




