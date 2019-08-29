#!/bin/bash

dir="/root"

doja=$dir/doja

mkdir $doja
cp -r apps conf logs supervisord $doja

supervisord -c $doja/supervisord/supervisord.conf


