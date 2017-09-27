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
	echo "Maaf, Anda harus menjalankan ini sebagai root"
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

u="iqbalfaf"
p="debian7iqbal"

# get the VPS IP
#ip=`ifconfig venet0:0 | grep 'inet addr' | awk {'print $2'} | sed s/.*://`
ip=$(ifconfig | grep 'inet addr:' | grep -v inet6 | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | cut -d: -f2 | awk '{ print $1}' | head -1)
if [ "$ip" = "" ]; then
	ip=$(wget -qO- ipv4.icanhazip.com)
fi

echo ""
echo -e $green""
echo "######################################################"
echo "    ----- Downloading and Installing PoPToP  ------"
echo "######################################################"
apt-get update
apt-get -y install pptpd

echo
echo -e $yellow""
echo "######################################################"
echo "      ----- Creating Server Config   -------          "
echo "######################################################"
cat > /etc/ppp/pptpd-options <<END
name pptpd
refuse-pap
refuse-chap
refuse-mschap
require-mschap-v2
require-mppe-128
ms-dns 208.67.222.222
ms-dns 208.67.220.220
proxyarp
nodefaultroute
lock
nobsdcomp
END

# setting up pptpd.conf
echo -e $white"option /etc/ppp/pptpd-options" > /etc/pptpd.conf
echo "logwtmp" >> /etc/pptpd.conf
echo "localip $ip" >> /etc/pptpd.conf
echo "remoteip 10.1.0.1-100" >> /etc/pptpd.conf

# adding new user
echo "$u	*	$p	*" >> /etc/ppp/chap-secrets

echo
echo -e $BlueF"######################################################"
echo "Forwarding IPv4 and Enabling it on boot"
echo "######################################################"
cat >> /etc/sysctl.conf <<END
net.ipv4.ip_forward=1
END
sysctl -p

echo
echo -e $cyan"######################################################"
echo "Updating IPtables Routing and Enabling it on boot"
echo "######################################################"
iptables -t nat -A POSTROUTING -j SNAT --to $ip
# saves iptables routing rules and enables them on-boot
iptables-save > /etc/iptables.conf

cat > /etc/network/if-pre-up.d/iptables <<END
#!/bin/sh
iptables-restore < /etc/iptables.conf
END

chmod +x /etc/network/if-pre-up.d/iptables
cat >> /etc/ppp/ip-up <<END
ifconfig ppp0 mtu 1400
END

echo
echo -e $red""
echo "######################################################"
echo "        -------- Restarting PoPToP ------------       "
echo "######################################################"
sleep 5
/etc/init.d/pptpd restart

echo
echo -e $white"######################################################"
echo "Server setup complete!"
echo "Connect to your VPS at $ip with these credentials:"
echo "Username:$u ##### Password: $p"
echo "######################################################"

cd ~/
rm -f /root/IP
