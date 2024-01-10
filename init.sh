#!/bin/ash

#Add Demo Users
adduser -h /home/admin -s /bin/sh -D admin
echo -n 'admin:admin' | chpasswd

#setup ssh
ssh-keygen -A
ash -c 'cat << EOF > /etc/ssh/sshd_config
PasswordAuthentication yes
PermitRootLogin yes
MaxAuthTries 999999999
EOF'

echo "admin" | tee -a /etc/vsftpd.user_list

#Start Services
exec /usr/sbin/sshd -D -e "$@"

