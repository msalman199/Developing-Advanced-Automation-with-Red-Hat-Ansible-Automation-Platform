#!/bin/bash

echo "=== Ansible Configuration Performance Test ==="

configs=("ansible.cfg" "ansible-performance.cfg")
playbook="playbooks/test-config.yml"

for config in "${configs[@]}"; do
    if [ -f "$config" ]; then
        echo "Testing configuration: $config"
        echo "Start time: $(date)"
        
        # Time the playbook execution
        time_output=$(ANSIBLE_CONFIG="./$config" time ansible-playbook "$playbook" 2>&1)
        
        echo "Execution completed"
        echo "Configuration: $config" >> performance-results.txt
        echo "Time: $(date)" >> performance-results.txt
        echo "$time_output" | grep "real\|user\|sys" >> performance-results.txt
        echo "---" >> performance-results.txt
        echo ""
    fi
done

echo "Performance results saved to performance-results.txt"
