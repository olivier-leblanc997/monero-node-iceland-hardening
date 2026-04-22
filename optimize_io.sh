#!/bin/bash
# Kernel tuning for Monero LMDB performance on NoData KVM nodes

echo "Setting I/O Scheduler to 'none' for NVMe performance..."
echo none | sudo tee /sys/block/vda/queue/scheduler

echo "Increasing max map count for LMDB..."
sudo sysctl -w vm.max_map_count=262144

echo "Optimizing network stack for high P2P peer counts..."
sudo sysctl -w net.core.somaxconn=4096
sudo sysctl -w net.ipv4.tcp_max_syn_backlog=8192

echo "Node optimization complete. Ready to launch monerod --config-file ./monerod.conf"
