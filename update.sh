#!/bin/bash

log=/var/log/update-script.log

#This colour
cyan='\e[0;36m'
green='\e[0;32m'
lightgreen='\e[1;32m'
white='\e[1;37m'
red='\e[1;31m'
yellow='\e[1;33m'
blue='\e[1;34m'

if [[ $USER != 'root' ]]; then
	echo -e $yellow"Maaf, Anda harus menjalankan ini sebagai root"
	exit
fi

MYIP=$(wget -qO- ipv4.icanhazip.com)

#vps="iqbalfaf";
vps="vps";

if [[ $vps = "iqbalfaf" ]]; then
	source="http://deb.mbahshondong.com"
else
	source="http://deb.mbahshondong.com"
fi

# go to root
cd

# check registered ip
wget -q -O IP $source/IP.txt
if ! grep -w -q $MYIP IP; then
	echo -e $yellow"Maaf, hanya IP yang terdaftar yang bisa menggunakan script ini"
	if [[ $vps = "iqbalfaf" ]]; then
		echo "Hubungi: Mbah Shondong Daftar IP Free"
	else
		echo -e $white"SMS 082322649802 https://facebook.com/ngamalembahe"
	fi
	rm -f /root/IP
	exit
fi

echo -e $yellow "[ ! ]  Updating Script VPS.....  "
wget -O /usr/bin/dropmon "http://deb.mbahshondong.com/Debian7/dropmon.sh" >> $log 2>&1
wget -O /usr/bin/menu "http://deb.mbahshondong.com/Debian7/menu.sh" >> $log 2>&1
wget -O /usr/bin/user-add "http://deb.mbahshondong.com/Debian7/user-add.sh" >> $log 2>&1
wget -O /usr/bin/user-add-vpn "http://deb.mbahshondong.com/Debian7/user-add-vpn.sh" >> $log 2>&1
wget -O /usr/bin/user-add-pptp "http://deb.mbahshondong.com/Debian7/user-add-pptp.sh" >> $log 2>&1
wget -O /usr/bin/user-expire "http://deb.mbahshondong.com/Debian7/user-expire.sh" >> $log 2>&1
wget -O /usr/bin/user-gen "http://deb.mbahshondong.com/Debian7/user-gen.sh" >> $log 2>&1
wget -O /usr/bin/user-limit "http://deb.mbahshondong.com/Debian7/user-limit.sh" >> $log 2>&1
wget -O /usr/bin/user-list "http://deb.mbahshondong.com/Debian7/user-list.sh" >> $log 2>&1
wget -O /usr/bin/user-login "http://deb.mbahshondong.com/Debian7/user-login.sh" >> $log 2>&1
wget -O /usr/bin/user-active-list "http://deb.mbahshondong.com/Debian7/user-active-list.sh" >> $log 2>&1
wget -O /usr/bin/user-renew "http://deb.mbahshondong.com/Debian7/user-renew.sh" >> $log 2>&1
wget -O /usr/bin/user-del "http://deb.mbahshondong.com/Debian7/user-del.sh" >> $log 2>&1
wget -O /usr/bin/user-pass "http://deb.mbahshondong.com/Debian7/user-pass.sh" >> $log 2>&1
wget -O /usr/bin/user-expire-list "http://deb.mbahshondong.com/Debian7/user-expire-list.sh" >> $log 2>&1
wget -O /usr/bin/user-banned "http://deb.mbahshondong.com/Debian7/user-banned.sh" >> $log 2>&1
wget -O /usr/bin/unbanned-user "http://deb.mbahshondong.com/Debian7/unbanned-user.sh" >> $log 2>&1
wget -O /usr/bin/delete-user-expire "http://deb.mbahshondong.com/Debian7/delete-user-expire.sh" >> $log 2>&1

chmod +x /usr/bin/dropmon >> $log 2>&1
chmod +x /usr/bin/menu >> $log 2>&1
chmod +x /usr/bin/user-add >> $log 2>&1
chmod +x /usr/bin/user-add-vpn >> $log 2>&1
chmod +x /usr/bin/user-add-pptp >> $log 2>&1
chmod +x /usr/bin/user-expire >> $log 2>&1
chmod +x /usr/bin/user-gen >> $log 2>&1
chmod +x /usr/bin/user-limit >> $log 2>&1
chmod +x /usr/bin/user-list >> $log 2>&1
chmod +x /usr/bin/user-login >> $log 2>&1
chmod +x /usr/bin/user-active-list >> $log 2>&1
chmod +x /usr/bin/user-renew >> $log 2>&1
chmod +x /usr/bin/user-del >> $log 2>&1
chmod +x /usr/bin/user-pass >> $log 2>&1
chmod +x /usr/bin/user-expire-list >> $log 2>&1
chmod +x /usr/bin/user-banned >> $log 2>&1
chmod +x /usr/bin/unbanned-user >> $log 2>&1
chmod +x /usr/bin/delete-user-expire >> $log 2>&1
echo -e $lightgreen "[ ✔ ]  Script Now Updated     "
echo -e $white "Terimakasih SUdah Menggunakan Script ./MBAH SHONDONG"
rm update.sh
history -c