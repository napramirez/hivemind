Java Oracle
=========

A lean and quick Ansible role to install Oracle Java in Vagrant machines.

To make it as lean as possible

- there is no dependency to the webupd8 PPA
- basic installation from tarball was followed

Requirements
------------

- wget
- tar

Role Variables
--------------

Given a Java version of 8u40-b25,

- major_version: 8
- minor_version: 40
- build_number: 25

Example Playbook
----------------

    - hosts: servers
      roles:
         - { role: java-oracle, major_version: 8, minor_version: 40, build_number: 25 }

License
-------

BSD

Author Information
------------------

Nap Ramirez
