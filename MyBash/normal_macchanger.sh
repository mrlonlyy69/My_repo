#!/bin/bash

#Check root

if [[ $EUID -ne 0 ]]; then
echo "This script must run as root"
exit
fi

#Change mac address

change(){

interface="enp2s0"
sudo macchanger -r enp2s0




}
 
#loop for every 2 sec
 while true; do
 change
    sleep 2
done
