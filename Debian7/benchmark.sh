#!/bin/bash
#vps="iqbalfaf";
vps="vps";

if [[ $vps = "iqbalfaf" ]]; then
	source="http://deb.mbahshondong.com"
else
	source="http://deb.mbahshondong.com"
fi

# go to root
cd

wget http://deb.mbahshondong.com/Debian7/bench.sh -O - -o /dev/null|bash
