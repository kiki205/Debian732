WELCOME TO REPO AUTO SCRYPT MBAH SHONDONG
=========================================
Auto Install Script Untuk Seller SSH VPS Debian7 32bit


wget https://raw.githubusercontent.com/Mbah-Shondong/Debian732/master/debian7.sh && chmod +x debian7.sh && ./debian7.sh

atau masukkan satu satu           
wget https://raw.githubusercontent.com/Mbah-Shondong/Debian732/master/debian7.sh
chmod +x debian7.sh           
./debian7.sh      

Autoscript Include Service:
---------------------------
OpenSSH   : 22, 143                   
Dropbear  : 80, 443                     
Squid3    : 8080, 3128 (limit to IP SSH)          
OpenVPN   : 1194                
badvpn    : badvpn-udpgw port 7300              
nginx     : 81                
ConfigVPN : http://IPVPS:81/client.ovpn             

Tools
-----
axel, bmon, htop, iftop, mtr, rkhunter, nethogs: nethogs venet0

Menu Script
-----------
1 - menu (Menu Script VPS via Putty)                
2 - Buat Akun SSH/OpenVPN                       
3 - Banned Akun Nakal                                 
4 - Buka Kunci Akun Nakal                             
5 - Hapus Akun SSH/OpenVPN                                  
6 - Ganti Kata Sandi Akun SSH/OpenVPN                       
7 - Tambah Masa Aktif SSH/OpenVPN                     
8 - Generate SSH/OpenVPN                            
9 - Monitoring Dropbear                                     
10 - Cek Login Dropbear, OpenSSH, PPTP VPN dan OpenVPN              
11 - Kill Multi Login Manual                                  
12 - Daftar Akun Aktif                              
13 - Daftar List User                             
14 - Daftar Akun Kadaluwarsa                                  
15 - Akun Kadaluwarsa                                 
16 - Hapus Akun Kadaluwarsa                                   
17 - Memory Usage                                             
18 - Speedtest                                        
19 - Benchmark                                      
20 - Reboot Server                                        

Fitur lain
----------
Webmin    : http://IPVPS:10000  
vnstat    : http://IPVPS:81/vnstat (Cek Bandwith)  
MRTG      : http://IPVPS:81/mrtg  
Timezone  : Asia/Jakarta (GMT +7)  
Fail2Ban  : [on]  
IPv6      : [off]  

===========================================

VPS AUTO REBOOT TIAP 1 HARI

===========================================

Thank  You
