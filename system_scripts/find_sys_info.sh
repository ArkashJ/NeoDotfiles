#!/bin/bash


# CPU Information
lscpu | grep -e "^CPU(s)" -e "Thread(s)" -e "Core(s)" -e "Socket(s)" -e "^CPU family" -e "Model" -e "Model name" -e "cache"

# GPU Information
nvidia-smi --query-gpu=index,utilization.gpu,memory.free,memory.total,memory.used --format=csv
nvidia-smi -L

# System Information
free -h

# Disk Information
df -h | grep -e "udev" -e "tmpfs" -e "^/dev/md0"
