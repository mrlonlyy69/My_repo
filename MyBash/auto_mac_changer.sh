#!/bin/bash

# Check for root privilege
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root." 
    exit 1
fi

# Function to change MAC address
change_mac() {
    interface="enp2s0"
    new_mac=$(printf '52:%02x:%02x:%02x:%02x:%02x\n' $((RANDOM%256)) $((RANDOM%256)) $((RANDOM%256)) $((RANDOM%256)) $((RANDOM%256)))

    # Bring down the network interface
    ip link set dev $interface down

    # Change the MAC address
    ip link set dev $interface address $new_mac

    # Bring up the network interface
    ip link set dev $interface up

    echo "MAC address of $interface changed to $new_mac"
}

# Loop to change MAC address every 2 seconds
while true; do
    change_mac
    sleep 2
done

