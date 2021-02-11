#!/bin/bash

docker run -d -p 80:5000 --restart always --name registry-priv registry:2

IP=`hostname -I|cut -f 1 -d " "`

python add_reg.py ${IP}

sudo systemctl restart docker
