#!/bin/bash

dir="/root"

mkdir $dir/doja
cp -r apps conf logs supervisord $dir/doja

supervisorctl -c $dir/supervisord/supervisord.conf reload


