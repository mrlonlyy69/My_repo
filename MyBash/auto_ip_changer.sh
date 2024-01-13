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
#!/bin/bash

# Function to change IP address
changeIP() {
  echo "Changing IP address..."
  # Replace the command below with the command to change the IP address
  # Example command: sudo ifconfig eth0 192.168.1.100 netmask 255.255.255.0 up
  sudo ifconfig enp2s0 192.168.1.$((RANDOM%256)) netmask 255.255.255.0 up
}

# Loop to change IP address every 2 seconds
while true
do
  changeIP
  sleep 2
done


