#!/bin/bash

INTERVAL=5
PAGE_SIZE=$(sysctl -n hw.pagesize)
TOTAL_MEM=$(sysctl -n hw.memsize)
TOTAL_MEM_GB=$(echo "$TOTAL_MEM / 1024 / 1024 / 1024" | bc -l)

echo "Monitoring CPU, RAM, and Disk usage every $INTERVAL seconds. Press Ctrl+C to stop."
printf "Total RAM: %.2f GB\n" "$TOTAL_MEM_GB"

while true; do
  echo "------------------------------"
  echo "Timestamp: $(date)"

  echo "CPU Usage:"
  top -l 1 | grep "CPU usage"

  echo "RAM Usage:"
  vm_stat_output=$(vm_stat)
  pages_free=$(echo "$vm_stat_output" | grep "Pages free" | awk '{print $3}' | sed 's/\.//')
  pages_active=$(echo "$vm_stat_output" | grep "Pages active" | awk '{print $3}' | sed 's/\.//')
  pages_wired=$(echo "$vm_stat_output" | grep "Pages wired down" | awk '{print $4}' | sed 's/\.//')
  pages_compressed=$(echo "$vm_stat_output" | grep "Pages occupied by compressor" | awk '{print $5}' | sed 's/\.//')
  pages_inactive=$(echo "$vm_stat_output" | grep "Pages inactive" | awk '{print $3}' | sed 's/\.//')

  let "used_pages = pages_active + pages_wired + pages_compressed"
  let "free_pages = pages_free + pages_inactive"

  used_gb=$(echo "$used_pages * $PAGE_SIZE / 1024 / 1024 / 1024" | bc -l)
  free_gb=$(echo "$free_pages * $PAGE_SIZE / 1024 / 1024 / 1024" | bc -l)

  printf "Used RAM: %.2f GB\n" "$used_gb"
  printf "Free RAM: %.2f GB\n" "$free_gb"

  echo "Disk Usage (/):"
  df -h / | tail -n 1

  sleep $INTERVAL
done
