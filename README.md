# Hivemind
The Ansible starter kit for Windows users

Ansible wasn't intended to be run in a Windows control machine [1].
In answer to that, Hivemind has been designed to be launched in a Windows host system
with the control machine deployed as a VM in the same internal network as the drones (nodes).

Hivemind relieves the user of the trouble nitpicking workarounds in Windows
and instead encourages him to go straight to tinkering with Ansible.

The versions of the software used are:
* Ubuntu 14.04.2 LTS Server 64-bit [2]
* The latest Ansible (1.5+)

Feel free to modify the Vagrantfile as needed.

[1] http://docs.ansible.com/intro_installation.html#control-machine-requirements
[2] https://atlas.hashicorp.com/dhoppe/boxes/ubuntu-14.04.2-amd64-nocm
