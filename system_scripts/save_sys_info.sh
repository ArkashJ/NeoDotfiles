#!/bin/bash

# Function to generate a Markdown table
generate_markdown() {
    echo "| **Component**           | **Specification**                         |"
    echo "|-------------------------|-------------------------------------------|"
    echo "| **CPU(s)**              | $cpus                                     |"
    echo "| **Thread(s) per core**  | $threads_per_core                         |"
    echo "| **Core(s) per socket**  | $cores_per_socket                         |"
    echo "| **Socket(s)**           | $sockets                                  |"
    echo "| **CPU Family**          | $cpu_family                               |"
    echo "| **Model**               | $model                                    |"
    echo "| **Model Name**          | $model_name                               |"
    echo "| **L1d Cache**           | $l1d_cache                                |"
    echo "| **L1i Cache**           | $l1i_cache                                |"
    echo "| **L2 Cache**            | $l2_cache                                 |"
    echo "| **L3 Cache**            | $l3_cache                                 |"
    echo "| **Total Memory**        | $total_mem                                |"
    echo "| **Used Memory**         | $used_mem                                 |"
    echo "| **Free Memory**         | $free_mem                                 |"
    echo "| **Total Swap**          | $total_swap                               |"
    echo "| **Free Swap**           | $free_swap                                |"
    echo "| **Disk Info**           | /dev/md0: $disk_used / $disk_total (Used: $disk_used) |"
    echo "| **GPU**                 | $gpu_info                                 |"
    echo "| **GPU Utilization**     | $gpu_utilization                          |"
}

# Capture CPU information
cpus=$(lscpu | grep "^CPU(s)" | awk '{print $2}')
threads_per_core=$(lscpu | grep "Thread(s) per core" | awk '{print $4}')
cores_per_socket=$(lscpu | grep "Core(s) per socket" | awk '{print $4}')
sockets=$(lscpu | grep "Socket(s)" | awk '{print $2}')
cpu_family=$(lscpu | grep "CPU family" | awk '{print $3}')
model=$(lscpu | grep "Model:" | awk '{print $2}')
model_name=$(lscpu | grep "Model name" | awk -F: '{print $2}')
l1d_cache=$(lscpu | grep "L1d cache" | awk '{print $3}')
l1i_cache=$(lscpu | grep "L1i cache" | awk '{print $3}')
l2_cache=$(lscpu | grep "L2 cache" | awk '{print $3}')
l3_cache=$(lscpu | grep "L3 cache" | awk '{print $3}')

# Capture GPU information
gpu_info=$(nvidia-smi -L)
gpu_utilization=$(nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits | tr '\n' ', ' | sed 's/, $//')

# Capture Memory information
total_mem=$(free -h | grep "Mem:" | awk '{print $2}')
used_mem=$(free -h | grep "Mem:" | awk '{print $3}')
free_mem=$(free -h | grep "Mem:" | awk '{print $4}')
total_swap=$(free -h | grep "Swap:" | awk '{print $2}')
free_swap=$(free -h | grep "Swap:" | awk '{print $4}')

# Capture Disk information
disk_info=$(df -h | grep "/dev/md0")
disk_used=$(echo $disk_info | awk '{print $3}')
disk_total=$(echo $disk_info | awk '{print $2}')



# Summary
echo -e "\n### Summary"
echo "This system is powered by $cpus CPUs, with $cores_per_socket cores per socket and $threads_per_core threads per core. The model in use is $model_name. The system's memory is $total_mem, with $used_mem currently in use. It features multiple NVIDIA A100-SXM4-40GB GPUs with a total memory of 40 GiB each. GPU utilization varies, with several GPUs running at 100% utilization."
