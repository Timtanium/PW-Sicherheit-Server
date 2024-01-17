#!/bin/bash

#Add Demo Users
echo -n 'root:password' | chpasswd

useradd -m admin
echo -n 'admin:admin' | chpasswd

useradd -m michael
echo -n 'cocacola:cocacola' | chpasswd

useradd -m tim
echo -n '17071985:17071985' | chpasswd

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
#service ssh start && bash


