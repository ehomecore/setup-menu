#!/bin/bash
# Created by Kang wahid
if [[ -e /etc/debian_version ]]; then
	OS=debian
	RCLOCAL='/etc/rc.local'
elif [[ -e /etc/centos-release || -e /etc/redhat-release ]]; then
	OS=centos
	RCLOCAL='/etc/rc.d/rc.local'
	chmod +x /etc/rc.d/rc.local
else
	echo "Sepertinya Anda tidak menjalankan installer ini pada sistem Debian, Ubuntu atau CentOS"
	exit
fi
color1='\e[031;1m'
color2='\e[34;1m'
color3='\e[0m'
echo "--------------- Selamat Datang Di Vps Anda Boss ---------------"
	echo ""
	cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
	cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
	freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
	tram=$( free -m | awk 'NR==2 {print $2}' )
	swap=$( free -m | awk 'NR==4 {print $2}' )
	up=$(uptime|awk '{ $1=$2=$(NF-6)=$(NF-5)=$(NF-4)=$(NF-3)=$(NF-2)=$(NF-1)=$NF=""; print }')

	echo -e "\e[032;1mCPU model:\e[0m $cname"
	echo -e "\e[032;1mNumber of cores:\e[0m $cores"
	echo -e "\e[032;1mCPU frequency:\e[0m $freq MHz"
	echo -e "\e[032;1mTotal amount of ram:\e[0m $tram MB"
	echo -e "\e[032;1mTotal amount of swap:\e[0m $swap MB"
	echo -e "\e[032;1mSystem uptime:\e[0m $up"
	echo -e "------------------------------------------------------------------------------"
	echo -e "Seputar SSH & OpenVPN"
	echo -e "\e[38;5;196m[1]\e[38;5;82m Buat akun SSH & OpenVPN"
        echo -e "\e[38;5;196m[2]\e[38;5;82m Generate akun SSH/OpenVPN"
	echo -e "\e[38;5;196m[3]\e[38;5;82m Buat account trial untuk SSH & OpenVPN"
	echo -e "\e[38;5;196m[4]\e[38;5;82m Tambah masa aktif akun SSH & OpenVPN"
	echo -e "\e[38;5;196m[5]\e[38;5;82m Ganti password akun SSH/OpenVPN"
	echo -e "\e[38;5;196m[6]\e[38;5;82m Bannned user yang melakukan multilogin"
	echo -e "\e[38;5;196m[7]\e[38;5;82m Unbanned user SSH & OpenVPN yang terbanned "
	echo -e "\e[38;5;196m[8]\e[38;5;82m Mengunci user SSH & OpenVPN"
	echo -e "\e[38;5;196m[9]\e[38;5;82m Membuka user SSH & OpenVPN yang terkunci "
	echo -e "\e[38;5;196m[10]\e[38;5;82m Hapus Akun SSH & OpenVPN"
	echo -e "\e[38;5;196m[11]\e[38;5;82m Lihat detail user SSH & OpenVPN "
	echo -e "\e[38;5;196m[12]\e[38;5;82m Tampilkan daftar user SSH & OpenVPN"
	echo -e "\e[38;5;196m[13]\e[38;5;82m Cek login Dropbear, OpenSSH, dan OpenVPN"
	echo -e "\e[38;5;196m[14]\e[38;5;82m Lihat log login Dropbear & OpenSSH "
	echo -e "\e[38;5;196m[15]\e[38;5;82m Kill Multi Login"
	echo -e "\e[38;5;196m[16]\e[38;5;82m Tampilkan user yang akan expired dalam waktu dekat"
	echo -e "\e[38;5;196m[17]\e[38;5;82m Tampilkan user yang telah expired "
	echo -e "\e[38;5;196m[18]\e[38;5;82m Hapus user SSH & OpenVPN yang telah expired"
	echo -e "\e[38;5;196m[19]\e[38;5;82m Kunci user SSH & OpenVPN yang telah expired"
	echo -e "\e[38;5;196m[20]\e[38;5;82m Lihat daftar user yang terkick"
	echo -e "\e[38;5;196m[21]\e[38;5;82m Lihat daftar user yang terbanned"
	echo -e "\e[38;5;196m[22]\e[38;5;82m Buat akun PPTP VPN "
	echo -e "\e[38;5;196m[23]\e[38;5;82m Hapus akun PPTP VPN "
	echo -e "\e[38;5;196m[24]\e[38;5;82m Lihat detail akun PPTP VPN "
	echo -e "\e[38;5;196m[25]\e[38;5;82m Cek login PPTP VPN"
	echo -e "\e[38;5;196m[26\e[38;5;82mL ihat daftar user "
	echo -e "\e[38;5;196m[27]\e[38;5;82m Speedtest server"
	echo -e "\e[38;5;196m[28]\e[38;5;82m Benchmark server"
	echo -e "\e[38;5;196m[29]\e[38;5;82m Lihat penggunaan RAM server"
if [[ "$OS" = 'debian' ]]; then 
	echo -e "\e[38;5;196m[30]\e[38;5;82m Restart OpenSSH "
	echo -e "\e[38;5;196m[31]\e[38;5;82m Restart Dropbear"
	echo -e "\e[38;5;196m[32]\e[38;5;82m Restart OpenVPN "
	echo -e "\e[38;5;196m[33]\e[38;5;82m Restart PPTP VPN "
	echo -e "\e[38;5;196m[34]\e[38;5;82m Restart Webmin"
	echo -e "\e[38;5;196m[35]\e[38;5;82m Restart Squid Proxy"
else
	echo -e "\e[38;5;196m[30]\e[38;5;82m Restart OpenSSH"
	echo -e "\e[38;5;196m]31]\e[38;5;82m Restart Dropbear"
	echo -e "\e[38;5;196m[32]\e[38;5;82m Restart OpenVPN "
	echo -e "\e[38;5;196m[33]\e[38;5;82mR  estart PPTP VPN"
	echo -e "\e[38;5;196m[34]\e[38;5;82m Restart Webmin"
	echo -e "\e[38;5;196m[35]\e[38;5;82m Restart Squid Proxy"
fi
echo -e "\e[38;5;196m[36]\e[38;5;82m Edit Port Server"
echo -e "\e[38;5;196m[37]\e[38;5;82m Set auto reboot pada server "
echo -e "\e[38;5;196m[38]\e[38;5;82m Reboot server"
echo -e "\e[38;5;196m[39]\e[38;5;82m Ganti Password Server"
echo -e "\e[38;5;196m[40]\e[38;5;82m Lihat log instalasi "
echo -e "\e[38;5;196m[41]\e[38;5;82m Update now"
echo "-------------------------------------------"
read -p "Tulis Pilihan Anda (angka): " x
if test $x -eq 1; then
user-add
elif test $x -eq 2; then
user-generate
elif test $x -eq 3; then
trial
elif test $x -eq 4; then
user-aktif
elif test $x -eq 5; then
user-password
elif test $x -eq 6; then
read -p "Isikan Jumlah Maximal Login (1-2): " MULTILOGIN
user-ban $MULTILOGIN
elif test $x -eq 7; then
user-unban
elif test $x -eq 8; then
user-lock
elif test $x -eq 9; then
user-unlock
elif test $x -eq 10; then
user-delete
elif test $x -eq 11; then
user-detail
elif test $x -eq 12; then
user-list
elif test $x -eq 13; then
user-login
elif test $x -eq 14; then
user-log
elif test $x -eq 15; then
read -p "Isikan Jumlah Maximal Login (1-2): " MULTILOGIN
user-limit $MULTILOGIN
elif test $x -eq 16; then
infouser
elif test $x -eq 17; then
expireduser
elif test $x -eq 18; then
user-delete-expired
elif test $x -eq 19; then
clear
echo "Script ini berjalan secara otomatis setiap jam 12 malam"
echo "Anda tidak perlu menjalankannya secara manual"
echo "Jika anda tetap ingin menjalankan script ini, ketik user-expire"
elif test $x -eq 20; then
log-limit
elif test $x -eq 21; then
log-ban
elif test $x -eq 22; then
user-add-pptp
elif test $x -eq 23; then
user-delete-pptp
elif test $x -eq 24; then
user-detail-pptp
elif test $x -eq 25; then
user-login-pptp
elif test $x -eq 26; then
alluser-pptp
elif test $x -eq 27; then
speedtest --share
elif test $x -eq 28; then
bench-network
elif test $x -eq 29; then
ram
elif test $x -eq 30; then
	if [[ "$OS" = 'debian' ]]; then 
		service ssh restart 
	else 
		service sshd restart 
	fi
elif test $x -eq 31; then
service dropbear restart
elif test $x -eq 32; then
service openvpn restart
elif test $x -eq 33; then
	if [[ "$OS" = 'debian' ]]; then 
		service pptpd restart 
	else 
		service pptpd restart 
	fi
elif test $x -eq 34; then
service webmin restart
elif test $x -eq 35; then
	if [[ "$OS" = 'debian' ]]; then 
		service squid3 restart 
	else 
		service squid restart 
	fi
elif test $x -eq 36; then
edit-port
elif test $x -eq 37; then
auto-reboot
elif test $x -eq 38; then
reboot
elif test $x -eq 39; then
passwd
elif test $x -eq 40; then
log-install
elif test $x -eq 41; then
wget https://raw.githubusercontent.com/ehomecore/new-menu/master/install-premiumscript.sh -O - -o /dev/null|sh
else
echo "Pilihan Tidak Terdapat Di Menu."
exit
fi
