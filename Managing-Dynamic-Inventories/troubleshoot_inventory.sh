#!/bin/bash

echo "Dynamic Inventory Troubleshooting Script"
echo "========================================"
echo

echo "1. Checking AWS CLI Configuration:"
echo "   AWS CLI Version: $(aws --version 2>&1)"
echo "   AWS Region: $(aws configure get region 2>/dev/null || echo 'Not configured')"
echo

echo "2. Checking AWS Credentials:"
if aws sts get-caller-identity >/dev/null 2>&1; then
    echo "   OK: AWS credentials are valid"
    aws sts get-caller-identity --query 'Account' --output text | sed 's/^/   Account: /'
else
    echo "   FAIL: AWS credentials are invalid or not configured"
fi
echo

echo "3. Checking Python Dependencies:"
python3 -c "import boto3; print('   OK: boto3 version', boto3.__version__)" 2>/dev/null || echo "   FAIL: boto3 not installed"
python3 -c "import botocore; print('   OK: botocore version', botocore.__version__)" 2>/dev/null || echo "   FAIL: botocore not installed"
echo

echo "4. Checking Ansible Configuration:"
echo "   Ansible Version: $(ansible --version | head -1)"
plugin_count=$(ansible-doc -t inventory -l 2>/dev/null | grep -c aws_ec2)
echo "   aws_ec2 plugin registered: ${plugin_count} match(es) found"
echo

echo "5. Testing Inventory File:"
if [ -f "inventory/aws_ec2.yml" ]; then
    echo "   Testing inventory/aws_ec2.yml..."
    if ansible-inventory -i inventory/aws_ec2.yml --list >/tmp/inv_test_output.json 2>/tmp/inv_test_error.log; then
        echo "   OK: inventory parsed successfully"
        host_count=$(python3 -c "import json; d=json.load(open('/tmp/inv_test_output.json')); print(len(d.get('_meta', {}).get('hostvars', {})))")
        echo "   Hosts discovered: ${host_count}"
    else
        echo "   FAIL: inventory parsing failed"
        echo "   Error details:"
        sed 's/^/     /' /tmp/inv_test_error.log
    fi
else
    echo "   FAIL: inventory/aws_ec2.yml not found in current directory"
fi
echo

echo "6. Checking EC2 Instance Visibility:"
if aws ec2 describe-instances --query 'Reservations[*].Instances[*].InstanceId' --output text >/tmp/ec2_ids.txt 2>/tmp/ec2_error.log; then
    total=$(wc -w < /tmp/ec2_ids.txt)
    running=$(aws ec2 describe-instances --filters "Name=instance-state-name,Values=running" --query 'Reservations[*].Instances[*].InstanceId' --output text | wc -w)
    echo "   OK: can query EC2 instances"
    echo "   Total instances visible: ${total}"
    echo "   Running instances: ${running}"
else
    echo "   FAIL: cannot query EC2 instances"
    sed 's/^/     /' /tmp/ec2_error.log
fi
echo

echo "Troubleshooting complete."
echo "If issues persist, check:"
echo "- AWS IAM permissions (ec2:DescribeInstances read access required)"
echo "- That the inventory file name ends in aws_ec2.yml or aws_ec2.yaml"
echo "- Network connectivity from the control node to AWS endpoints"
echo "- Collection installed: ansible-galaxy collection install amazon.aws"
