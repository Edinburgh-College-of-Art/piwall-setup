# Pi Wall setup
# Original Project: https://go.nasa.gov/1DYEa2v
#
# How to automatically turn off and on your monitor from your Raspberry Pi:
# https://www.screenly.io/blog/2017/07/02/how-to-automatically-turn-off-and-on-your-monitor-from-your-raspberry-pi/
# Installs
sudo apt-get update -y
sudo apt-get upgrade -y

sudo apt-get install -y libav-tools \
                           libjpeg8 \
                   libegl1-mesa-dev

# If you are using a Linux PC as your master and don’t want to permanently alter your network configuration then execute the following commands after you have connected to the private PiWall network.
# sudo ifconfig eth0 192.168.0.??? netmask 255.255.255.0 up
# sudo route add -net 224.0.0.0 netmask 240.0.0.0 eth0

# OR

sudo nano /etc/network/interfaces

wget http://dl.piwall.co.uk/pwlibs1_1.1_armhf.deb
sudo dpkg -i /home/pi/pwlibs1_1.1_armhf.deb
wget http://dl.piwall.co.uk/pwomxplayer_20130815_armhf.deb
sudo dpkg -i /home/pi/pwomxplayer_20130815_armhf.deb

sudo sh -c "printf '
auto eth0
iface eth0 inet static
address 192.168.0.???
netmask 255.255.255.0
up route add -net 224.0.0.0 netmask 240.0.0.0 eth0
' >> /etc/network/interfaces"


# /media/pi/Untitled/ble_uart.m4v

# on each slave: $n=41 is the top left, 42 is the top right, 43 is the bottom left and 44
# pwomxplayer --tile-code=41 udp://239.0.1.23:1234?buffer_size=1200000B

# on master
# avconv -re -i ble_uart.m4v -vcodec copy -f avi -an udp://239.0.1.23:1234
