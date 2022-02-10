echo "***Cybolite Squid Proxy Installer***"
echo "Updating System...."
sudo apt update -y && sudo apt full-upgrade -y && sudo apt autoremove -y && sudo apt clean -y && sudo apt autoclean -y
echo "Installing Proxy"
read -p "Set Proxy Port : " proxy_port
echo -e "Selected Port:\n$proxy_port"
read -p "Continue? (Y/N): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1
sudo apt install squid3
echo "Enabling Firewall..."
sudo ufw enable
echo "Configuring Squid to port 3128"
sudo ufw allow OpenSSH
udo ufw allow Squid
#allow $proxy_port
sudo ufw allow 3128
echo "Add 'cache deny all' just before 'http_access deny all'"
echo "change 'http_access deny all' to 'http_access allow all' just after line '#  And finally deny all other access to this proxy'"
echo -ne 'opening file.                     (33%)\r'
sleep 1
echo -ne 'opening file..             (66%)\r'
sleep 1
echo -ne 'opening file...   (99%)\r'
sleep 1
echo -ne 'opening file...   (100%)\r'
echo -ne '\n'
sudo nano /etc/squid/squid.conf
#sed -i 's/http_access deny all/http_access allow all/' /etc/squid/squid.conf
echo "Reloading Services, Please weit..."
sudo ufw reload
sudo systemctl restart squid.service
sudo systemctl status squid.service
echo "Done"


#sed -i 's/# And finally deny all other access to this proxy\nhttp_access deny all/http_access allow all/g' squid.cong




#Centos
# sudo yum -y update
# yum -y install squid
# systemctl start squid
# systemctl enable squid
# systemctl status squid
# sudo vi /etc/squid/squid.conf
# echo "Add 'cache deny all' just before 'http_access deny all'"
# http_access deny all to http_access allow all
# sudo systemctl restart squid

# https://stackoverflow.com/questions/24729024/open-firewall-port-on-centos-7
# firewall-cmd --get-active-zones
# firewall-cmd --zone=public --add-port=2888/tcp --permanent
# firewall-cmd --reload
# firewall-cmd --zone=dmz --add-port=2888/tcp --permanent
# firewall-cmd --permanent --zone=public --add-service=http
# history -c
