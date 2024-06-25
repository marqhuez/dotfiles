#!/bin/bash

# free --mebi | sed -n '2{p;q}' | awk '{printf (" %2.2fGB \n", ( $3 / 1024))}'

asd=$(nmcli con show --active | grep -i vpn | awk '{print $3}')

if [ "$asd" = "vpn" ]; then
	echo "󰖂"
else 
	echo ""
fi
