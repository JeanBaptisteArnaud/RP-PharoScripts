#/bin/sh
sudo apt-get install hostapd udhcpd -y

sudo echo "start 192.168.0.2 # This is the range of IPs that the hotspot will give to client devices.
end 192.168.0.20
interface wlan0 # The device udhcp listens on.
remaining yes
opt dns 8.8.8.8 4.2.2.2 # The DNS servers client devices will use.
opt subnet 255.255.255.0
opt router 192.168.0.1 # The Pi's IP address on wlan0 which we will set up shortly.
opt lease 864000 # 10 day DHCP lease time in seconds" >>  /etc/udhcpd.conf


sudo echo "
interface=wlan0
driver=nl80211
ssid=Raspi_wifi
hw_mode=g
channel=11
macaddr_acl=0
auth_algs=1
ignore_broadcast_ssid=0
wpa=2
wpa_passphrase=somepassword
wpa_key_mgmt=WPA-PSK
wpa_pairwise=TKIP
rsn_pairwise=CCMP" >> /etc/hostapd/hostapd.conf