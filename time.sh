#/bin/bash


IP==$(curl -s4 icanhazip.com)
echo -e "$ enter private key from windows wallet $" 
read KEY
sleep 2
echo ""
echo ""
echo -e 
sleep 5

sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install libboost-all-dev libevent-dev software-properties-common -y
sudo add-apt-repository ppa:bitcoin/bitcoin -y
sudo apt-get update
sudo apt-get install libdb4.8-dev libdb4.8++-dev -y
sudo apt-get install libpthread-stubs0-dev -y
sudo apt-get install libzmq3-dev -y
sudo apt install -y make build-essential libtool software-properties-common autoconf libssl-dev libboost-dev libboost-chrono-dev libboost-filesystem-dev \
libboost-program-options-dev libboost-system-dev libboost-test-dev libboost-thread-dev sudo automake git curl libdb4.8-dev \
bsdmainutils libdb4.8++-dev libminiupnpc-dev libgmp3-dev ufw pkg-config libevent-dev libdb5.3++ unzip libzmq5

sleep 2
echo -e 
sleep 5 
cd /var
sudo touch swap.img
sudo chmod 600 swap.img
sudo dd if=/dev/zero of=/var/swap.img bs=1024k count=2000
sudo mkswap /var/swap.img
sudo swapon /var/swap.img
sudo free
sudo echo "/var/swap.img none swap sw 0 0" >> /etc/fstab
cd
sleep 2
echo -e 
sleep 5
sudo apt-get install -y ufw
sudo ufw allow ssh/tcp
sudo ufw limit ssh/tcp
sudo ufw allow 11333/tcp
sudo ufw logging on
echo "y" | sudo ufw enable
sleep 2
echo ""
echo ""
echo -e 
cd TIMMN
sudo unzip daemon.zip
sudo chmod +x /root/TIMMN/timeismoney-cli /root/TIMMN/timeismoneyd /root/TIMMN/timeismoney-tx
sudo mv /root/TIMMN/timeismoney-cli /root/TIMMN/timeismoneyd /root/TIMMN/timeismoney-tx /usr/local/bin
sudo chmod 755 -R  /usr/local/bin/
cd
cd /root

sleep 1 

echo -e 

sudo timeismoney-cli stop

echo -e 

sudo timeismoneyd -daemon

echo -e

^C

cd
