#!/bin/bash
cyan='\e[0;36m'
green='\e[0;34m'
okegreen='\033[92m'
lightgreen='\e[1;32m'
white='\e[1;37m'
red='\e[1;31m'
yellow='\e[1;33m'
BlueF='\e[1;34m'

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

echo -e $yellow""
echo "---------------- MEMBUAT AKUN  OPENVPN ----------------"
echo ""
echo "#######################################################"
echo "#                SCRYPT MBAH SHONDONG                 #"
echo "#            http://www.mbahshondong.com              #"
echo "#-----------------------------------------------------#"
echo "#                     HAWOK JOZZ                      #"
echo "#      https://www.facebook.com/groups/pokoemelu      #"
echo "#-----------------------------------------------------#"
echo "#         [== INTERNET GRATIS SAK MODARRE ==]         #"
echo "#######################################################"
echo -e $White""             

read -p "Isikan username: " USER

egrep "^$USER" /etc/passwd >/dev/null
if [ $? -eq 0 ]; then
	echo "Username [$USER] sudah ada!"
	exit 1
else
	read -p "Isikan password akun [$USER]: " PASS
	read -p "Berapa hari akun [$USER] aktif: " AKTIF

	today="$(date +"%Y-%m-%d")"
	expire=$(date -d "$AKTIF days" +"%Y-%m-%d")
	useradd -M -N -s /bin/false -e $expire $USER
	echo $USER:$PASS | chpasswd

	echo ""
	echo "-----------------------------------"
	echo "Data Login:"
	echo "-----------------------------------"
	echo "Host/IP: $MYIP"
	echo "Dropbear Port: 80, 443"
	echo "OpenSSH Port: 22, 143"
	echo "Squid Proxy: 8000, 3128"
	echo "Download Config : $MYIP:81/client.ovpn"
	echo "Username: $USER"
	echo "Password: $PASS"
	echo "Aktif s/d: $(date -d "$AKTIF days" +"%d-%m-%Y")"
	echo "-----------------------------------"
fi

cd ~/
rm -f /root/IP
