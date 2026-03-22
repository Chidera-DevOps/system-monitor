#!/bin/bash
echo 
echo "===== SYSTEM HEALTH ======"

echo "CPU Usage: $(mpstat 1 1 | awk '/Average/ {printf("%.0f%%\n", 100 - $NF)}')"
echo "Memory Usage: $(free -m | awk '/Mem:/ {printf("%.0f%%\n", (($2 - $7) / $2) * 100}')"
:
