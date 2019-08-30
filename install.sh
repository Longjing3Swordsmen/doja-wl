#!/bin/bash

dir="/root"

doja=$dir/doja

mkdir $doja
mkdir -p /var/run/supervisor

cp -r apps conf logs supervisord $doja
chown -R root:root .*

supervisord -c $doja/supervisord/supervisord.conf
echo "alias mysuper='supervisorctl -c /root/doja/supervisord/supervisord.conf'" >> ~/.bashrc
source ~/.bashrc


