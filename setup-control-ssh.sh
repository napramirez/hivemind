#!/bin/bash
#

cp /vagrant/ssh/id_rsa /home/vagrant/.ssh/
chown vagrant.vagrant /home/vagrant/.ssh/id_rsa
chmod 600 /home/vagrant/.ssh/id_rsa
