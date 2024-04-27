#!/bin/bash

echo "System Information"
echo "------------------"

# Public IP
public_ip=$(curl ifconfig.me)
echo "Public IP: $public_ip"

# Private IP
private_ip=$(ip addr show | grep -w inet | awk '{print $2}' | cut -d/ -f1)
echo "Private IP: $private_ip"

# MAC Address
mac_address=$(ip addr show | grep -w ether | awk '{print $2}')
echo "MAC Address: ${mac_address:0:8}.."

# CPU Usage
echo "Top 5 Processes by CPU Usage:"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 6

# Memory Usage
echo "Memory Usage:"
free -h

# System Services
echo "Active System Services:"
systemctl list-units --type=service --state=active

# Top 10 Largest Files in /home
echo "Top 10 Largest Files in /home:"
find /home -type f -exec du -sh {} + | sort -rh | head -n 10