#!/usr/bin/env bash
#
# @(#) virtualbox-portforwarding.sh
#
# Usage:
#   virtualbox-portforwarding.sh PORT_FROM PORT_TO
#

if [ $# -lt 2 ]; then
    echo "Usage: $(basename $0) PORT_FROM PORT_TO"
    exit 1
fi

port_from=$1
port_to=$2

echo "Setting port forwarding for boot2docker-vm from $port_from to $port_to..."

for i in $(seq ${port_from} ${port_to}); do
    VBoxManage modifyvm "boot2docker-vm" --natpf1 "tcp-port$i,tcp,,$i,,$i";
    VBoxManage modifyvm "boot2docker-vm" --natpf1 "udp-port$i,udp,,$i,,$i";
done

echo "Done."



