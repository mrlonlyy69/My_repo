#!/bin/bash

#banner
banner(){
    echo ""
    echo ""
    
    
    echo "****  Created by  ****"
    echo "*                    *"
    echo "*    mr._.lonlyy     *"
    echo "*                    *"
    echo "****    Sayam     ****"
    
    echo ""
    echo ""
    }
    
# Check for root privilege
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root." 
    exit 1
fi

message (){
    echo ""
    echo "Press 1 to get your IP address"
    echo "Press 2 to get your MAC address"
    echo "Press 0 to exit"
    echo ""
}

get_interface() {
    ip link | awk -F: '$0 !~ "lo|vir|wl|^[^0-9]"{print $2a;getline}'
}

main(){
    read -p "Select your option: " option

    if [ $option == 1 ]; then
        echo "Your IP address is: $(hostname -I)"
    elif [ $option == 2 ]; then
        echo "Your MAC address is: $(get_interface | ip link show $interface | grep link/ether | awk '{print $2}')"
    elif [ $option == 0 ]; then
        echo "Bye Bye"
        echo "#####Creat By Sayam#####"
        exit
    else
        echo "Wrong Option!"
    fi
}

for (( ; ; ))
do
    banner
    message
    main
done
