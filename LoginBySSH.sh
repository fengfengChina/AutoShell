#!/bin/sh
scp ~/.ssh/id_rsa.pub root@192.168.1.181:/root/
cat id_rsa.pub >> ~/.ssh/authorized_keys 
chmod 600 .ssh/authorized_keys
