# Hivemind

### (DEPRECATED. Please refer to [Hivemind Plugin for Vagrant](https://github.com/napramirez/vagrant-hivemind))

The Ansible starter kit for Windows users that doesn't bite!

Ansible wasn't intended to be run in a Windows control machine as stated [here](http://docs.ansible.com/intro_installation.html#control-machine-requirements).

In answer to that, Hivemind was designed to be launched in a Windows host system
with the control machine deployed as a VM in the same private network as the drones (managed nodes).

Hivemind relieves the user of the trouble nitpicking workarounds in Windows
and instead encourages the user to go straight to tinkering with Ansible.

The versions of the software used are:

* Ubuntu 14.04.2 LTS
  * [Kubuntu](https://atlas.hashicorp.com/napramirez/boxes/kubuntu-14.04.2-LTS-amd64-lite)
  * [Unity](https://atlas.hashicorp.com/napramirez/boxes/ubuntu-14.04.2-LTS-amd64-desktoplite)
  * [Unity i386](https://atlas.hashicorp.com/napramirez/boxes/ubuntu-14.04.2-LTS-amd64-server)
  * [Server](https://atlas.hashicorp.com/napramirez/boxes/ubuntu-14.04.2-LTS-i386-desktoplite)

* The latest Ansible
