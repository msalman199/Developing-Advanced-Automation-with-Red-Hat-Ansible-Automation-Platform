Role Name
=========

A brief description of the role goes here.

Requirements
------------

Any pre-requisites that may not be covered by Ansible itself or the role should be mentioned here. For instance, if the role uses the EC2 module, it may be a good idea to mention in this section that the boto package is required.

Role Variables
--------------

A description of the settable variables for this role should go here, including any variables that are in defaults/main.yml, vars/main.yml, and any variables that can/should be set via parameters to the role. Any variables that are read from other roles and/or the global scope (ie. hostvars, group vars, etc.) should be mentioned here as well.

Dependencies
------------

A list of other roles hosted on Galaxy should go here, plus any details in regards to parameters that may need to be set for other roles, or variables that are used from other roles.

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: username.rolename, x: 42 }

License
-------

BSD

Author Information
------------------

# Webserver Role

This role installs and configures a web server (Apache) on target systems.

## Requirements

- Target system should be RHEL/CentOS or Ubuntu/Debian based
- Sudo/root access required

## Role Variables

- `web_package_name`: Package name for web server
- `web_service_name`: Service name for web server
- `web_port`: Port number for web server (default: 80)
- `company_name`: Company name for web page

## Example Playbook

```yaml
- hosts: webservers
  roles:
    - mycompany.infrastructure.webserver



An optional section for the role authors to include contact information, or a website (HTML is not allowed).
