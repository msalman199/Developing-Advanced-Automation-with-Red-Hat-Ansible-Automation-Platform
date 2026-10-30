Lab 16: Handling Task Failures
Objectives

By the end of this lab, students will be able to:

    Understand different types of task failures in Ansible playbooks
    Configure retry mechanisms to handle transient failures
    Use the ignore_errors directive to continue playbook execution despite failures
    Implement error handling strategies using failed_when and changed_when
    Test and validate failure scenarios in controlled environments
    Create resilient playbooks that can handle unexpected conditions gracefully

Prerequisites

Before starting this lab, students should have:

    Basic understanding of Ansible playbooks and YAML syntax
    Experience with writing and executing Ansible tasks
    Familiarity with Ansible modules and their return values
    Knowledge of Linux command-line operations
    Understanding of SSH connectivity and inventory management

Lab Environment Setup

Ready-to-Use Cloud Machines: Al Nafi provides pre-configured Linux-based cloud machines for this lab. Simply click Start Lab to access your environment - no need to build your own VM or install software.

Your lab environment includes:

    Control Node: CentOS/RHEL 8 with Ansible installed
    Managed Nodes: Two target servers (node1 and node2)
    Pre-configured SSH keys and inventory files
    All necessary tools and dependencies

Task 1: Configure Retries and ignore_errors in Playbooks
Subtask 1.1: Understanding Task Failure Scenarios

First, let's create a directory structure for our lab and understand common failure scenarios.

    Connect to your control node and create the lab directory:

mkdir -p ~/lab16-task-failures
cd ~/lab16-task-failures

    Create a basic inventory file:

cat > inventory << EOF
[webservers]
node1 ansible_host=192.168.1.10
node2 ansible_host=192.168.1.11

[all:vars]
ansible_user=ansible
ansible_ssh_private_key_file=~/.ssh/id_rsa
EOF

    Test connectivity to ensure your managed nodes are accessible:

ansible all -i inventory -m ping

Subtask 1.2: Creating a Playbook with Potential Failures

Let's create a playbook that demonstrates various failure scenarios and how to handle them.

    Create a playbook with intentional failure points:

cat > failure-demo.yml << 'EOF'
---
- name: Demonstrate Task Failure Handling
  hosts: webservers
  become: yes
  vars:
    packages_to_install:
      - httpd
      - nonexistent-package
      - curl
    
  tasks:
    - name: Task 1 - This will succeed
      debug:
        msg: "Starting playbook execution on {{ inventory_hostname }}"
    
    - name: Task 2 - This might fail (network dependent)
      uri:
        url: "http://httpbin.org/delay/2"
        timeout: 1
      register: network_test
    
    - name: Task 3 - This will fail (invalid package)
      package:
        name: "{{ item }}"
        state: present
      loop: "{{ packages_to_install }}"
    
    - name: Task 4 - This should not execute (due to previous failure)
      debug:
        msg: "If you see this message, error handling worked!"
    
    - name: Task 5 - Service start (will fail if package not installed)
      service:
        name: httpd
        state: started
        enabled: yes
EOF

    Run the playbook to observe the default failure behavior:

ansible-playbook -i inventory failure-demo.yml

Expected Result: The playbook will stop execution when it encounters the nonexistent package, and subsequent tasks won't run.
Subtask 1.3: Implementing Retry Mechanisms

Now let's modify the playbook to handle failures gracefully using retries.

    Create an improved playbook with retry logic:

cat > failure-handling-retries.yml << 'EOF'
---
- name: Handling Task Failures with Retries
  hosts: webservers
  become: yes
  vars:
    max_retries: 3
    retry_delay: 2
    
  tasks:
    - name: Task 1 - Network operation with retries
      uri:
        url: "http://httpbin.org/delay/1"
        timeout: 5
      register: network_result
      retries: "{{ max_retries }}"
      delay: "{{ retry_delay }}"
      until: network_result.status == 200
      
    - name: Task 2 - Package installation with retries
      package:
        name: httpd
        state: present
      register: package_result
      retries: "{{ max_retries }}"
      delay: "{{ retry_delay }}"
      until: package_result is succeeded
      
    - name: Task 3 - Service start with retries
      service:
        name: httpd
        state: started
        enabled: yes
      register: service_result
      retries: "{{ max_retries }}"
      delay: "{{ retry_delay }}"
      until: service_result is succeeded
      
    - name: Task 4 - Verify service is running
      uri:
        url: "http://{{ inventory_hostname }}"
        timeout: 10
      register: service_check
      retries: 5
      delay: 3
      until: service_check.status == 200
EOF

    Execute the retry-enabled playbook:

ansible-playbook -i inventory failure-handling-retries.yml -v

Subtask 1.4: Using ignore_errors Directive

Let's create a playbook that uses ignore_errors to continue execution despite failures.

    Create a playbook with ignore_errors:

cat > failure-handling-ignore.yml << 'EOF'
---
- name: Handling Task Failures with ignore_errors
  hosts: webservers
  become: yes
  
  tasks:
    - name: Task 1 - Always succeeds
      debug:
        msg: "Starting execution on {{ inventory_hostname }}"
    
    - name: Task 2 - Install valid package
      package:
        name: curl
        state: present
      register: curl_install
      
    - name: Task 3 - Try to install invalid package (ignore failure)
      package:
        name: nonexistent-package-12345
        state: present
      register: invalid_package
      ignore_errors: yes
      
    - name: Task 4 - Report on invalid package attempt
      debug:
        msg: "Invalid package installation failed as expected: {{ invalid_package.msg }}"
      when: invalid_package is failed
      
    - name: Task 5 - Try to start non-existent service (ignore failure)
      service:
        name: nonexistent-service
        state: started
      register: invalid_service
      ignore_errors: yes
      
    - name: Task 6 - Continue with valid operations
      debug:
        msg: "Continuing execution despite previous failures"
        
    - name: Task 7 - Install and start Apache
      block:
        - name: Install Apache
          package:
            name: httpd
            state: present
            
        - name: Start Apache service
          service:
            name: httpd
            state: started
            enabled: yes
      
    - name: Task 8 - Final status report
      debug:
        msg: "Playbook completed successfully on {{ inventory_hostname }}"
EOF

    Run the ignore_errors playbook:

ansible-playbook -i inventory failure-handling-ignore.yml -v

Task 2: Test Task Failures and Observe Behavior
Subtask 2.1: Creating Controlled Failure Scenarios

Let's create specific scenarios to test different types of failures and their handling.

    Create a comprehensive failure testing playbook:

cat > failure-testing.yml << 'EOF'
---
- name: Comprehensive Failure Testing
  hosts: webservers
  become: yes
  vars:
    test_scenarios:
      - name: "Network Timeout"
        type: "network"
      - name: "File Permission"
        type: "permission"
      - name: "Service Dependency"
        type: "dependency"
        
  tasks:
    - name: Scenario 1 - Network timeout with custom failure handling
      uri:
        url: "http://httpbin.org/delay/10"
        timeout: 3
      register: network_timeout
      failed_when: false
      changed_when: network_timeout.status == 200
      
    - name: Report network test results
      debug:
        msg: |
          Network test results:
          - Status: {{ network_timeout.status | default('Failed') }}
          - Failed: {{ network_timeout is failed }}
          - Message: {{ network_timeout.msg | default('No message') }}
    
    - name: Scenario 2 - File operation with permission handling
      file:
        path: /root/test-file.txt
        state: touch
        mode: '0644'
        owner: root
        group: root
      register: file_operation
      ignore_errors: yes
      
    - name: Handle file operation results
      debug:
        msg: "File operation {{ 'succeeded' if file_operation is succeeded else 'failed' }}"
        
    - name: Scenario 3 - Command execution with error handling
      command: /bin/false
      register: command_result
      failed_when: command_result.rc > 1
      changed_when: false
      
    - name: Scenario 4 - Package management with conditional failure
      package:
        name: "{{ item }}"
        state: present
      register: package_results
      failed_when: false
      loop:
        - curl
        - wget
        - nonexistent-package-xyz
        
    - name: Report package installation results
      debug:
        msg: |
          Package: {{ item.item }}
          Status: {{ 'Success' if item is succeeded else 'Failed' }}
          {% if item is failed %}
          Error: {{ item.msg }}
          {% endif %}
      loop: "{{ package_results.results }}"
      loop_control:
        label: "{{ item.item }}"
EOF

    Execute the failure testing playbook:

ansible-playbook -i inventory failure-testing.yml -v

Subtask 2.2: Advanced Error Handling with Blocks

Let's implement advanced error handling using Ansible blocks with rescue and always sections.

    Create a playbook with block-based error handling:

cat > advanced-error-handling.yml << 'EOF'
---
- name: Advanced Error Handling with Blocks
  hosts: webservers
  become: yes
  
  tasks:
    - name: Web server setup with error handling
      block:
        - name: Install web server packages
          package:
            name: "{{ item }}"
            state: present
          loop:
            - httpd
            - mod_ssl
            
        - name: Create web directory
          file:
            path: /var/www/html/test
            state: directory
            mode: '0755'
            
        - name: Deploy test page
          copy:
            content: |
              <html>
              <head><title>Test Page</title></head>
              <body><h1>Server: {{ inventory_hostname }}</h1></body>
              </html>
            dest: /var/www/html/test/index.html
            mode: '0644'
            
        - name: Start and enable web server
          service:
            name: httpd
            state: started
            enabled: yes
            
        - name: Test web server response
          uri:
            url: "http://{{ inventory_hostname }}/test/"
            return_content: yes
          register: web_test
          
      rescue:
        - name: Handle web server setup failure
          debug:
            msg: "Web server setup failed, attempting recovery..."
            
        - name: Check if httpd is installed
          package_facts:
            
        - name: Install minimal web server if main installation failed
          package:
            name: nginx
            state: present
          when: "'httpd' not in ansible_facts.packages"
          
        - name: Start alternative web server
          service:
            name: nginx
            state: started
            enabled: yes
          when: "'httpd' not in ansible_facts.packages"
          
        - name: Create simple nginx test page
          copy:
            content: "Backup web server running on {{ inventory_hostname }}"
            dest: /usr/share/nginx/html/index.html
          when: "'httpd' not in ansible_facts.packages"
          
      always:
        - name: Ensure firewall allows HTTP traffic
          firewalld:
            service: http
            permanent: yes
            state: enabled
            immediate: yes
          ignore_errors: yes
          
        - name: Log completion status
          lineinfile:
            path: /var/log/ansible-deployment.log
            line: "{{ ansible_date_time.iso8601 }} - Web server deployment completed on {{ inventory_hostname }}"
            create: yes
            
        - name: Display final status
          debug:
            msg: "Web server deployment process completed for {{ inventory_hostname }}"
EOF

    Run the advanced error handling playbook:

ansible-playbook -i inventory advanced-error-handling.yml -v

Subtask 2.3: Creating Custom Failure Conditions

Let's create a playbook that demonstrates custom failure conditions using failed_when.

    Create a playbook with custom failure conditions:

cat > custom-failure-conditions.yml << 'EOF'
---
- name: Custom Failure Conditions
  hosts: webservers
  become: yes
  
  tasks:
    - name: Check disk space
      shell: df -h / | tail -1 | awk '{print $5}' | sed 's/%//'
      register: disk_usage
      changed_when: false
      failed_when: disk_usage.stdout | int > 90
      
    - name: Report disk usage
      debug:
        msg: "Disk usage is {{ disk_usage.stdout }}% - {{ 'WARNING: High usage!' if disk_usage.stdout | int > 80 else 'OK' }}"
        
    - name: Check memory usage
      shell: free | grep Mem | awk '{printf "%.0f", $3/$2 * 100.0}'
      register: memory_usage
      changed_when: false
      failed_when: memory_usage.stdout | int > 95
      
    - name: Check system load
      shell: uptime | awk -F'load average:' '{print $2}' | awk '{print $1}' | sed 's/,//'
      register: system_load
      changed_when: false
      failed_when: system_load.stdout | float > 5.0
      
    - name: Verify critical services
      command: systemctl is-active {{ item }}
      register: service_status
      changed_when: false
      failed_when: service_status.stdout != "active"
      ignore_errors: yes
      loop:
        - sshd
        - NetworkManager
        - systemd-logind
        
    - name: Report service status
      debug:
        msg: "Service {{ item.item }}: {{ item.stdout }}"
      loop: "{{ service_status.results }}"
      loop_control:
        label: "{{ item.item }}"
        
    - name: Custom application health check
      uri:
        url: "http://{{ inventory_hostname }}"
        method: GET
        status_code: [200, 404]
      register: app_health
      failed_when: 
        - app_health.status is defined
        - app_health.status not in [200, 404]
      ignore_errors: yes
      
    - name: Conditional task based on previous results
      debug:
        msg: "All system checks passed for {{ inventory_hostname }}"
      when: 
        - disk_usage.stdout | int < 90
        - memory_usage.stdout | int < 95
        - system_load.stdout | float < 5.0
EOF

    Execute the custom failure conditions playbook:

ansible-playbook -i inventory custom-failure-conditions.yml -v

Subtask 2.4: Implementing Comprehensive Error Reporting

Let's create a playbook that provides detailed error reporting and logging.

    Create an error reporting playbook:

cat > error-reporting.yml << 'EOF'
---
- name: Comprehensive Error Reporting
  hosts: webservers
  become: yes
  vars:
    log_file: "/var/log/ansible-error-report.log"
    
  tasks:
    - name: Initialize error tracking
      set_fact:
        error_count: 0
        errors_encountered: []
        
    - name: Test 1 - Package installation
      package:
        name: "{{ item }}"
        state: present
      register: package_test
      ignore_errors: yes
      loop:
        - curl
        - wget
        - invalid-package-name
        
    - name: Record package errors
      set_fact:
        error_count: "{{ error_count | int + 1 }}"
        errors_encountered: "{{ errors_encountered + [{'task': 'Package Installation', 'item': item.item, 'error': item.msg}] }}"
      when: item is failed
      loop: "{{ package_test.results }}"
      loop_control:
        label: "{{ item.item }}"
        
    - name: Test 2 - Service operations
      service:
        name: "{{ item }}"
        state: started
      register: service_test
      ignore_errors: yes
      loop:
        - sshd
        - nonexistent-service
        
    - name: Record service errors
      set_fact:
        error_count: "{{ error_count | int + 1 }}"
        errors_encountered: "{{ errors_encountered + [{'task': 'Service Operation', 'item': item.item, 'error': item.msg}] }}"
      when: item is failed
      loop: "{{ service_test.results }}"
      loop_control:
        label: "{{ item.item }}"
        
    - name: Test 3 - File operations
      file:
        path: "{{ item }}"
        state: touch
      register: file_test
      ignore_errors: yes
      loop:
        - /tmp/test-file.txt
        - /root/restricted-file.txt
        - /invalid/path/file.txt
        
    - name: Record file operation errors
      set_fact:
        error_count: "{{ error_count | int + 1 }}"
        errors_encountered: "{{ errors_encountered + [{'task': 'File Operation', 'item': item.item, 'error': item.msg}] }}"
      when: item is failed
      loop: "{{ file_test.results }}"
      loop_control:
        label: "{{ item.item }}"
        
    - name: Generate error report
      template:
        content: |
          ========================================
          ANSIBLE ERROR REPORT
          ========================================
          Host: {{ inventory_hostname }}
          Date: {{ ansible_date_time.iso8601 }}
          Total Errors: {{ error_count }}
          
          {% if errors_encountered | length > 0 %}
          ERRORS ENCOUNTERED:
          {% for error in errors_encountered %}
          
          Task: {{ error.task }}
          Item: {{ error.item }}
          Error: {{ error.error }}
          ---
          {% endfor %}
          {% else %}
          No errors encountered during execution.
          {% endif %}
          
          ========================================
        dest: "{{ log_file }}"
        
    - name: Display error summary
      debug:
        msg: |
          Error Summary for {{ inventory_hostname }}:
          - Total errors: {{ error_count }}
          - Error report saved to: {{ log_file }}
          {% if error_count | int > 0 %}
          - Review the log file for detailed error information
          {% else %}
          - All tasks completed successfully
          {% endif %}
          
    - name: Fail playbook if critical errors found
      fail:
        msg: "Playbook failed due to {{ error_count }} errors. Check {{ log_file }} for details."
      when: error_count | int > 3
EOF

    Run the error reporting playbook:

ansible-playbook -i inventory error-reporting.yml -v

    Check the generated error report:

ansible all -i inventory -m shell -a "cat /var/log/ansible-error-report.log" -b

Verification and Testing
Verify Error Handling Implementation

    Create a verification script:

cat > verify-error-handling.sh << 'EOF'
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
EOF

    Make the script executable and run it:

chmod +x verify-error-handling.sh
./verify-error-handling.sh

Troubleshooting Common Issues
Issue 1: Retries Not Working as Expected

Problem: Tasks are not retrying despite retry configuration.

Solution:

    Ensure the until condition is properly defined
    Check that the registered variable name matches in the until clause
    Verify that the condition can actually be met

Issue 2: ignore_errors Not Preventing Playbook Failure

Problem: Playbook still fails even with ignore_errors: yes.

Solution:

    Check if the failure is occurring in a different task
    Verify the ignore_errors directive is at the correct indentation level
    Ensure there are no syntax errors in the task

Issue 3: Block Rescue Not Triggering

Problem: Rescue section is not executing when tasks in block fail.

Solution:

    Verify proper indentation of block, rescue, and always sections
    Check that tasks in the block are actually failing
    Ensure rescue tasks don't have their own failures

Conclusion

In this lab, you have successfully learned how to handle task failures in Ansible playbooks through various mechanisms:

Key Accomplishments:

    Retry Mechanisms: You implemented retry logic using retries, delay, and until parameters to handle transient failures gracefully.

    Error Ignoring: You used the ignore_errors directive to continue playbook execution despite specific task failures.

    Custom Failure Conditions: You created custom failure conditions using failed_when to define when tasks should be considered failed based on specific criteria.

    Advanced Error Handling: You implemented sophisticated error handling using blocks with rescue and always sections for comprehensive error management.

    Error Reporting: You created detailed error reporting mechanisms to track, log, and analyze failures across your infrastructure.

Why This Matters:

    Resilience: Your playbooks can now handle unexpected conditions and continue operating, making your automation more reliable.
    Debugging: Comprehensive error handling and reporting make it easier to identify and resolve issues in complex environments.
    Production Readiness: These techniques are essential for production deployments where failures must be handled gracefully.
    Maintenance: Proper error handling reduces the need for manual intervention and makes automated systems more self-healing.

Best Practices Learned:

    Always consider what types of failures might occur in your tasks
    Use retries for transient issues like network timeouts
    Implement proper logging and error reporting for troubleshooting
    Use blocks for complex error handling scenarios
    Test your error handling logic thoroughly before production deployment

These error handling techniques will make your Ansible automation more robust and suitable for enterprise environments where reliability and resilience are critical requirements.
