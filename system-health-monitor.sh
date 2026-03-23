#!/bin/bash
echo 
echo "===== SYSTEM HEALTH ======"

CPU="CPU Usage: $(mpstat 3 3 | awk '/Average/ {printf "%.0f%%\n", 100 - $NF}')"
MEM="Memory Usage: $(free -m | awk '/Mem:/ {printf "%.0f%%\n", (($2 - $7) / $2) * 100}')"
DISK="Disk Usage: $(df -h / | awk 'NR==2 {print $5}')"

if [[ $CPU== ` ]]
