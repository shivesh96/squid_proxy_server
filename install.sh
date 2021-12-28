echo "***Cybolite Squid Proxy Installer***"
echo "Updating System...."
sudo apt update -y && upgrade -y
echo "Installing Proxy"
#sudo apt install squid3
echo "Enabling Firewall..."
#sudo ufw enable
echo "Configuring Squid to port 3128"
#sudo ufw allow OpenSSH
#udo ufw allow Squid
#sudo ufw allow 3128
echo "Add 'cache deny all' just before 'http_access deny all'"
echo "change 'http_access deny all' to 'http_access allow all'"
echo "opening file..."
sleep 5
sudo nano /etc/squid/squid.conf
echo "Reloading Services, Please weit..."
sudo ufw reload
#sudo systemctl restart squid.service
echo "Done"
