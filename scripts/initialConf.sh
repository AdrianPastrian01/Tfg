#!/bin/bash

#Initial configuration script for all NixOS that will run Cassandra services

if [ "$#" -ne 1 ]; then 
	echo "ERROR: Script accepts only one parameter." >&2
	echo "Correct usage: $0 [ Service ]"
	exit 1
fi

service="$1"

if [ -d /home/adrianpr/my-repo/ ]; then
	rm -rf /home/adrianpr/*repo*
fi

curl -L "https://github.com/AdrianPastrianTFG/Tfg.git" -o /home/adrianpr/test

rm -f /etc/nixos/configuration.nix

if cp "/home/adrianpr/my-repo/VMsConf/$service/configuration.nix" /etc/nixos/ ; then
	rm -rf /home/adrianpr/*repo*
	nixos-rebuild switch
fi
