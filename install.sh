#!/bin/bash

dir="/root"

doja=$dir/doja

mkdir $doja
mkdir -p /var/run/supervisor

mkdir -p logs apps conf /var/run/supervisor/
cp -r apps conf logs supervisord $doja
chown -R root:root .*

supervisord -c $doja/supervisord/supervisord.conf > /dev/null 2>&1
echo "alias mysuper='supervisorctl -c $doja/supervisord/supervisord.conf'" >> ~/.bashrc
echo "alias mystart='supervisord -c $doja/supervisord/supervisord.conf'" >> ~/.bashrc
source /root/.bashrc
mysuper status


