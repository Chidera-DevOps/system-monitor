#!/bin/bash
echo 
echo "===== SYSTEM HEALTH ======"
echo
CPU="$(mpstat 3 3 | awk '/Average/ {printf "%.0f\n", 100 - $NF}')"
echo "CPU Usage is:    $CPU%"
MEM="$(free -m | awk '/Mem:/ {printf "%.0f\n", (($2 - $7) / $2) * 100}')"
echo "Memory Usage is: $MEM%"
DISK="$(df -h / | awk 'NR==2 {gsub("%",""); print $5}')"
echo "Disk Usage is:   $DISK%"

echo 
echo "STATUS:"

if [[ $CPU -le 33 ]]; then
	echo "✔ CPU Usage is Optimal"
elif [[ $CPU -le 67 ]]; then 
	echo "✔ CPU usage is Medium"
else
	echo "⚠CPU usage is High"
fi
if [[ $MEM -le 33 ]]; then
	echo "✔ Memory Usage is Optimal" 
elif [[ $MEM -le 67 ]]; then
        echo "✔ Memory usage is Medium"
else 
	echo "⚠ Memory usage is High" 
fi
if (( $DISK <= 33 )); then
	echo "✔ Disk Usage is Optimal"
elif (( $DISK <= 67 )); then
 	echo "✔ Disk usage is Medium"
else
 	echo "⚠ Disk usage is High"
fi

echo

echo "===== SYSTEM HEALTH ANALYSIS COMPLETE ===="
echo

