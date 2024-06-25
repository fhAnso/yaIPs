#!/bin/bash

# Specify the network potion: bash jaIPs.sh 192.168.111
# Use address of current machine: bash jaIPs.sh

[[ $# == 0 ]] && {
    local_ip="$(ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1')"
    network_portion="${local_ip%.*}"

    printf "No network potion given: using current address..\n"
} || {
    network_portion="$1"
}

output_file="temp.txt"

printf "Listing of reachable IPv4 addresses..\n"
printf "NOTE: The addresses will be saved to the following file: \"%s\"\n\n" $output_file

for host_portion in `seq 1 254`
do
    ping -c 1 $network_portion.$host_portion | grep "64 bytes" | cut -d " " -f 4 | tr -d ":" | tee -a $output_file & 
done

wait

printf "\nDone"
