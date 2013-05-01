#!/bin/bash
./redsocks/redsocks -c ./redsocks/redsocks.conf
sudo iptables -t nat -N REDSOCKS
sudo iptables -t nat -A REDSOCKS -d 0.0.0.0/8 -j RETURN
sudo iptables -t nat -A REDSOCKS -d 10.0.0.0/8 -j RETURN
sudo iptables -t nat -A REDSOCKS -d 127.0.0.0/8 -j RETURN
sudo iptables -t nat -A REDSOCKS -d 169.254.0.0/16 -j RETURN
sudo iptables -t nat -A REDSOCKS -d 172.16.0.0/12 -j RETURN
sudo iptables -t nat -A REDSOCKS -d 192.168.0.0/16 -j RETURN
sudo iptables -t nat -A REDSOCKS -d 224.0.0.0/4 -j RETURN
sudo iptables -t nat -A REDSOCKS -d 240.0.0.0/4 -j RETURN
sudo iptables -t nat -A REDSOCKS -p tcp -o eth0 -j DNAT --to 127.0.0.1:31338
sudo iptables -t nat -A OUTPUT -p tcp -j REDSOCKS
sudo iptables -t nat -I REDSOCKS -d 192.81.209.89 -j RETURN
echo "Connecting ..."
ssh -CfqND 31337 USERNAME@192.81.209.89
echo "Connected :)"

