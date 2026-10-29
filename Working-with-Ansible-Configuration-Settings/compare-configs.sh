#!/bin/bash

echo "=== Comparing Ansible Configurations ==="

configs=("ansible.cfg" "ansible-performance.cfg" "ansible-debug.cfg")

for config in "${configs[@]}"; do
    if [ -f "$config" ]; then
        echo "--- Configuration: $config ---"
        ANSIBLE_CONFIG="./$config" ansible-config dump --only-changed | head -10
        echo ""
    fi
done

echo "=== Performance Test Results ==="
for config in "${configs[@]}"; do
    if [ -f "$config" ]; then
        echo "Testing with $config:"
        time ANSIBLE_CONFIG="./$config" ansible all -m ping > /dev/null 2>&1
        echo ""
    fi
done
