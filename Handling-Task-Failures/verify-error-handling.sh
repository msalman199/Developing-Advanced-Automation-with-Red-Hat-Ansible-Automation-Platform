#!/bin/bash

echo "=== Verifying Error Handling Implementation ==="

# Test 1: Verify retry functionality
echo "Test 1: Testing retry functionality..."
ansible-playbook -i inventory failure-handling-retries.yml --check

# Test 2: Verify ignore_errors functionality
echo "Test 2: Testing ignore_errors functionality..."
ansible-playbook -i inventory failure-handling-ignore.yml --check

# Test 3: Verify block/rescue/always functionality
echo "Test 3: Testing block error handling..."
ansible-playbook -i inventory advanced-error-handling.yml --check

# Test 4: Check log files
echo "Test 4: Checking error logs..."
ansible all -i inventory -m shell -a "ls -la /var/log/ansible-*.log" -b

echo "=== Verification Complete ==="
