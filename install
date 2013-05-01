#!/bin/bash
sudo apt-get install iptables git-core libevent-1.4-2 libevent-dev
git clone http://github.com/darkk/redsocks.git
cd redsocks/
sudo make 
echo 'base{log_debug = on; log_info = on; log = "file:/tmp/reddi.log"; 
       daemon = on; redirector = iptables;}
       redsocks { local_ip = 127.0.0.1; local_port = 31338; ip = 127.0.0.1; 
       port = 31337; type = socks5; }' > redsocks.conf
       
