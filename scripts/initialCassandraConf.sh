#!/bin/bash

#Initial configuration script for all NixOS that will run Cassandra services

if [ -d /home/adrianpr/my-repo/ ]; then
	rm -rf /home/adrianpr/*repo*
fi

curl -L "https://github.com/AdrianPastrianTFG/Tfg.git" -o /home/adrianpr/my-repo

rm -f /etc/nixos/configuration.nix
cp /home/adrianpr/my-repo/VMsConf/Cassandra/configuration.nix /etc/nixos/

rm -rf /home/adrianpr/*repo*

nixos-rebuild switch
