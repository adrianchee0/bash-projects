#!/bin/bash

hostname=$(hostname)
kernel=$(uname -r)
cpu_info=$(lscpu | awk '/Architecture/ {print $2}')
memory_info=$(awk '/MemTotal/ {total=$2/1024/1024} /MemAvailable/ {available=$2/1024/1024} END {printf "Total: %.1f GB | Used: %.1f GB\n", total, (total - available)}' /proc/meminfo)
disk_usage=$(df -h)
network_info=$(ip -o -4 addr show | awk '$2 !~ /^lo/ {print $2}' | while read -r interface; do echo "${interface}: IP Address: $(ip -4 addr show ${interface} | awk '$1 == "inet" {print $2}' | cut -d "/" -f 1), MAC Address: $(ip -o link show ${interface} | awk '{print $17}')"; done)

echo "Hostname: $hostname"
echo "Kernel Version: $kernel"
echo "CPU: $cpu_info"
echo "$memory_info"
echo "Disk Usage:"
echo "$disk_usage"
echo "Network Interfaces:"
echo "$network_info"
