#!/bin/bash
#banner
    echo ""
    echo ""
    
    
    echo "****  Created by  ****"
    echo "*                    *"
    echo "*    mr._.lonlyy     *"
    echo "*                    *"
    echo "****    Sayam     ****"
    
    echo ""
    echo ""
    
# Check for root privilege
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root." 
    exit 1
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
