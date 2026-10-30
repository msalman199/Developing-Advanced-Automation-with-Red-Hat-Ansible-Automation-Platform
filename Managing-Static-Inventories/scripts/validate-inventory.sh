#!/bin/bash

INVENTORY_FILE="inventories/production/hosts.yml"

echo "=== Inventory Validation Report ==="
echo "Date: $(date)"
echo "Inventory File: $INVENTORY_FILE"
echo

echo "=== All Hosts ==="
ansible-inventory -i $INVENTORY_FILE --list --yaml | grep -A 1 "hosts:"

echo
echo "=== Group Structure ==="
ansible-inventory -i $INVENTORY_FILE --graph

echo
echo "=== Host Count by Group ==="
for group in webservers databases loadbalancers monitoring; do
    count=$(ansible-inventory -i $INVENTORY_FILE --list | jq -r ".${group}.hosts | length" 2>/dev/null || echo "0")
    echo "$group: $count hosts"
done

echo
echo "=== Connectivity Test ==="
ansible -i $INVENTORY_FILE all -m ping --one-line

echo
echo "=== Variable Validation ==="
ansible-inventory -i $INVENTORY_FILE --list | jq '.all.vars' 2>/dev/null || echo "No global variables found"
