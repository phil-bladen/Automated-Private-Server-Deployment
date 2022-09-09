Role Name
=========

This role configures a private EC2 instance to be a bastion

Requirements
------------

None. This role uses builtin roles only

Role Variables
--------------

The only variable is employee_id. This should be set to the ID of the employee using
this role as part of the larger set of playbooks published in this git Repo.

As such, this variable should be defined in the top-level inventory file used by the
larger set of playbooks.

Dependencies
------------

None. This role uses builtin roles only

Example Playbook
----------------

The only variable (employee_id) is a user-specific variable dependent on the person deploying the bastion.yml playbook as part of a larger set. As such, this variable is defined in /PBLADEN_Project_Two_Ansible/inventory, since that is located at the base of the larger set.

License
-------

BSD

Author Information
------------------

Phil Bladen

