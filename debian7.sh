#!/bin/bash

if [ $USER != 'root' ]; then
	echo "Maaf, Anda harus menjalankan ini sebagai root"
	exit
fi

# initialisasi var
export DEBIAN_FRONTEND=noninteractive
OS=`uname -m`;
MYIP=$(wget -qO- ipv4.icanhazip.com);
MYIP2="s/xxxxxxxxx/$MYIP/g";
ether=`ifconfig | cut -c 1-8 | sort | uniq -u | grep venet0 | grep -v venet0:`
if [ "$ether" = "" ]; then
        ether=eth0
fi

# go to root
cd

# disable ipv6


# install wget and curl
apt-get update;apt-get -y install wget curl;

# set time GMT +7
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime

# set locale


# set repo
wget -O /etc/apt/sources.list "https://raw.githubusercontent.com/Mbah-Shondong/Debian732/master/Debian7/sources.list.debian7"
wget "http://www.dotdeb.org/dotdeb.gpg"
wget "http://www.webmin.com/jcameron-key.asc"
cat dotdeb.gpg | apt-key add -;rm dotdeb.gpg
cat jcameron-key.asc | apt-key add -;rm jcameron-key.asc

# remove unused

#apt-get -y autoremove;

# update
apt-get update;apt-get -y upgrade;

# install webserver


# install essential package


# disable exim


# update apt-file


# setting vnstat


# install neofetch


# Swap Ram


# install webserver


# install openvpn


#konfigurasi openvpn



# install badvpn

# install mrtg
#apt-get update;apt-get -y install snmpd;


# setting port ssh


# install dropbear


# install vnstat gui


# install fail2ban


# install squid3


# install webmin


# download script
cd
wget -O /usr/bin/benchmark "https://raw.githubusercontent.com/Mbah-Shondong/Debian732/master/Debian7/benchmark.sh"
wget -O /usr/bin/speedtest "https://raw.githubusercontent.com/Mbah-Shondong/Debian732/master/Debian7/speedtest.py"
wget -O /usr/bin/ps_mem "https://raw.githubusercontent.com/Mbah-Shondong/Debian732/master/Debian7/ps_mem.py"
wget -O /etc/issue.net "https://raw.githubusercontent.com/Mbah-Shondong/Debian732/master/Debian7/banner"
wget -O /usr/bin/dropmon "https://raw.githubusercontent.com/Mbah-Shondong/Debian732/master/Debian7/dropmon.sh"
wget -O /usr/bin/menu "https://raw.githubusercontent.com/Mbah-Shondong/Debian732/master/Debian7/menu.sh"
wget -O /usr/bin/user-add "https://raw.githubusercontent.com/Mbah-Shondong/Debian732/master/Debian7/user-add.sh"
wget -O /usr/bin/user-add-vpn "https://raw.githubusercontent.com/Mbah-Shondong/Debian732/master/Debian7/user-add-vpn.sh"
wget -O /usr/bin/user-add-pptp "https://raw.githubusercontent.com/Mbah-Shondong/Debian732/master/Debian7/user-add-pptp.sh"
wget -O /usr/bin/user-expire "https://raw.githubusercontent.com/Mbah-Shondong/Debian732/master/Debian7/user-expire.sh"
wget -O /usr/bin/user-gen "https://raw.githubusercontent.com/Mbah-Shondong/Debian732/master/Debian7/user-gen.sh"
wget -O /usr/bin/user-limit "https://raw.githubusercontent.com/Mbah-Shondong/Debian732/master/Debian7/user-limit.sh"
wget -O /usr/bin/user-list "https://raw.githubusercontent.com/Mbah-Shondong/Debian732/master/Debian7/user-list.sh"
wget -O /usr/bin/user-login "https://raw.githubusercontent.com/Mbah-Shondong/Debian732/master/Debian7/user-login.sh"
wget -O /usr/bin/user-active-list "https://raw.githubusercontent.com/Mbah-Shondong/Debian732/master/Debian7/user-active-list.sh"
wget -O /usr/bin/user-renew "https://raw.githubusercontent.com/Mbah-Shondong/Debian732/master/Debian7/user-renew.sh"
wget -O /usr/bin/user-del "https://raw.githubusercontent.com/Mbah-Shondong/Debian732/master/Debian7/user-del.sh"
wget -O /usr/bin/user-pass "https://raw.githubusercontent.com/Mbah-Shondong/Debian732/master/Debian7/user-pass.sh"
wget -O /usr/bin/user-expire-list "https://raw.githubusercontent.com/Mbah-Shondong/Debian732/master/Debian7/user-expire-list.sh"
wget -O /usr/bin/user-banned "https://raw.githubusercontent.com/Mbah-Shondong/Debian732/master/Debian7/user-banned.sh"
wget -O /usr/bin/unbanned-user "https://raw.githubusercontent.com/Mbah-Shondong/Debian732/master/Debian7/unbanned-user.sh"
wget -O /usr/bin/delete-user-expire "https://raw.githubusercontent.com/Mbah-Shondong/Debian732/master/Debian7/delete-user-expire.sh"
echo "0 0 * * * root /usr/bin/user-expire" > /etc/cron.d/user-expire
echo "* * * * * service dropbear restart" > /etc/cron.d/dropbear
chmod +x /usr/bin/benchmark
chmod +x /usr/bin/speedtest
chmod +x /usr/bin/ps_mem
chmod +x /usr/bin/dropmon
chmod +x /usr/bin/menu
chmod +x /usr/bin/user-add
chmod +x /usr/bin/user-add-vpn
chmod +x /usr/bin/user-add-pptp
chmod +x /usr/bin/user-expire
chmod +x /usr/bin/user-gen
chmod +x /usr/bin/user-limit
chmod +x /usr/bin/user-list
chmod +x /usr/bin/user-login
chmod +x /usr/bin/user-active-list
chmod +x /usr/bin/user-renew
chmod +x /usr/bin/user-del
chmod +x /usr/bin/user-pass
chmod +x /usr/bin/user-expire-list
chmod +x /usr/bin/user-banned
chmod +x /usr/bin/unbanned-user
chmod +x /usr/bin/delete-user-expire

# finishing
chown -R www-data:www-data /home/vps/public_html
service cron restart
service nginx start
service php5-fpm start
service vnstat restart
service snmpd restart
service ssh restart
service dropbear restart
service fail2ban restart
service squid3 restart
service webmin restart
cd
rm -f /root/.bash_history && history -c
echo "unset HISTFILE" >> /etc/profile

# info
clear
echo "Fitur yang Tersedia" | tee log-install.txt
echo "=======================================================" | tee -a log-install.txt
echo "Service :" | tee -a log-install.txt
echo "---------" | tee -a log-install.txt
echo "OpenSSH  : 22, 143" | tee -a log-install.txt
echo "Dropbear : 80, 443" | tee -a log-install.txt
echo "Squid3   : 8080, 3128 (limit to IP $MYIP)" | tee -a log-install.txt
echo "OpenVPN  : TCP 1194 (client config : http://$MYIP:81/client.ovpn)"  | tee -a log-install.txt
echo "badvpn   : badvpn-udpgw port 7300" | tee -a log-install.txt
echo "nginx    : 81" | tee -a log-install.txt
echo "" | tee -a log-install.txt

echo "Tools :" | tee -a log-install.txt
echo "-------" | tee -a log-install.txt
echo "axel, bmon, htop, iftop, mtr, rkhunter, nethogs: nethogs $ether" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "Script :" | tee -a log-install.txt

echo "--------" | tee -a log-install.txt
echo "  - menu (Menu Script VPS via Putty) :" | tee -a log-install.txt
echo "  - Buat Akun SSH/OpenVPN (user-add)" | tee -a log-install.txt
echo "  - Banned Akun Nakal (user-banned)" | tee -a log-install.txt
echo "  - Buka Kunci Akun Nakal (unbanned-user)" | tee -a log-install.txt
echo "  - Hapus Akun SSH/OpenVPN (user-del)" | tee -a log-install.txt
echo "  - Ganti Kata Sandi Akun SSH/OpenVPN (user-pass)" | tee -a log-install.txt
echo "  - Tambah Masa Aktif SSH/OpenVPN (user-renew)" | tee -a log-install.txt
echo "  - Generate SSH/OpenVPN (user-gen)" | tee -a log-install.txt
echo "  - Monitoring Dropbear (dropmon [PORT])" | tee -a log-install.txt
echo "  - Cek Login Dropbear, OpenSSH, PPTP VPN dan OpenVPN (user-login)" | tee -a log-install.txt
echo "  - Kill Multi Login Manual (1-2 Login) (user-limit [x])" | tee -a log-install.txt
echo "  - Daftar Akun Aktif (user-active-list)" | tee -a log-install.txt
echo "  - Daftar List User (user-list)" | tee -a log-install.txt
echo "  - Daftar Akun Kadaluwarsa (user-expire-list)" | tee -a log-install.txt
echo "  - Akun Kadaluwarsa (user-expire)" | tee -a log-install.txt
echo "  - Hapus Akun Kadaluwarsa (delete-user-expire)" | tee -a log-install.txt
echo "  - Memory Usage (ps-mem)" | tee -a log-install.txt
echo "  - Speedtest (speedtest --share)" | tee -a log-install.txt
echo "  - Benchmark (benchmark)" | tee -a log-install.txt
echo "  - Reboot Server" | tee -a log-install.txt
echo "" | tee -a log-install.txt

echo "Fitur lain :" | tee -a log-install.txt
echo "------------" | tee -a log-install.txt
echo "Webmin         : http://$MYIP:10000/" | tee -a log-install.txt
echo "vnstat         : http://$MYIP:81/vnstat/ (Cek Bandwith)" | tee -a log-install.txt
echo "MRTG           : http://$MYIP:81/mrtg/" | tee -a log-install.txt
echo "Timezone       : Asia/Jakarta (GMT +7)" | tee -a log-install.txt
echo "Fail2Ban       : [on]" | tee -a log-install.txt
echo "(D)DoS Deflate : [on]" | tee -a log-install.txt
echo "Block Torrent  : [off]" | tee -a log-install.txt
echo "IPv6           : [off]" | tee -a log-install.txt
echo "Auto Lock User Expire tiap jam 00:00" | tee -a log-install.txt
echo "Auto Reboot tiap jam 00:00" | tee -a log-install.txt
echo "" | tee -a log-install.txt

echo "Edited By MUHAMMAD AMAN" | tee -a log-install.txt
echo "ADMIN WWW MBAH SHONDONG COM" | tee -a log-install.txt
echo "Internet Gratis Sak Modarre" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "Log Instalasi --> /root/log-install.txt" | tee -a log-install.txt
echo "" | tee -a log-install.txt

echo "***************SETUP COMPLETED********************" | tee -a log-install.txt
echo "-----------SILAHKAN REBOOT VPS ANDA---------------" | tee -a log-install.txt
echo "==================================================" | tee -a log-install.txt
echo "=============Ketik reboot ENTER =================="  | tee -a log-install.txt
cd ~/
rm -f /root/mrtg-mem
rm -f /root/pptp.sh
rm -f /root/dropbear-2016.74.tar.bz2
rm -rf /root/dropbear-2016.74
rm -f /root/debian7.sh
