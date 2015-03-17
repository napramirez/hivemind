# -*- mode: ruby -*-
# vi: set ft=ruby :

# Define the network params
PRIVATE_NETWORK = "192.168.50.*"
PRIVATE_NETWORK_START = 100
$host_count = 0

# IP address counter
def next_ip_address
  ip_address = PRIVATE_NETWORK.sub('*', (PRIVATE_NETWORK_START+$host_count).to_s)
  $host_count += 1
  return ip_address
end

# Drone allocator
def allocate_generic_drones(drone_count, type, memory_in_mb)
  1.upto(drone_count) do |drone_index|
    drone_hostname = "drone-"+type+"-"+drone_index.to_s.rjust(2, '0')
    drone = HivemindHost.new drone_hostname, next_ip_address
    drone.memory_in_mb = memory_in_mb
    $hosts[drone_hostname.to_sym] = drone
  end
end

# Host files generator
def generate_hosts(output_dir)
  # Create the cache directory
  Dir.mkdir(output_dir) unless File.exists?(output_dir)

  # Create the ansible hosts file
  File.open(output_dir+"/ansible.hosts", "w+") do |f|
    f.write("# Generated by Hivemind\n\n")
    $hosts.each_value do |host|
      f.write("#{host.hostname}\n")
    end
    f.close
  end

  # Create the intermediary system hosts file
  File.open(output_dir+"/system.hosts", "w+") do |f|
    $hosts.each_value do |host|
      f.write("#{host.ip_address}\t#{host.hostname}\n")
    end
    f.close
  end
end

# HivemindHost
class HivemindHost
  attr_accessor :hostname, :ip_address, :is_control, :memory_in_mb, :box, :is_gui

  def initialize(hostname, ip_address)
    @hostname = hostname
    @ip_address = ip_address
    @is_control = false
    @memory_in_mb = 512
    @box = "napramirez/ubuntu-14.04.2-LTS-amd64-server"
    @is_gui = false
  end
end

$hosts = {}

# Ansible control machine
$hosts[:control] = HivemindHost.new :control, next_ip_address
$hosts[:control].memory_in_mb = 256
$hosts[:control].is_control = true

# Krails
$hosts[:krails] = HivemindHost.new :krails, next_ip_address
$hosts[:krails].memory_in_mb = 1024
$hosts[:krails].box = "napramirez/kubuntu-14.04.2-LTS-amd64-lite"
$hosts[:krails].is_gui = true

# The number of drones
allocate_generic_drones 4, "S",  512
allocate_generic_drones 2, "M", 1024
allocate_generic_drones 1, "L", 2048

generate_hosts "cache"

# Main
Vagrant.configure(2) do |config|

  $hosts.each_value do |host|
    config.vm.define host.hostname do |host_config|
      host_config.vm.box = host.box
      host_config.vm.network "private_network", ip: host.ip_address, virtualbox__intnet: true

      host_config.vm.provider "virtualbox" do |vb|
        vb.memory = host.memory_in_mb
        vb.gui = host.is_gui
      end

      if host.is_control
        host_config.vm.provision "shell", path: "scripts/setup-control-ssh.sh"
        host_config.vm.provision "shell", path: "scripts/install-ansible.sh"
        host_config.vm.provision "shell", path: "scripts/post-install-ansible.sh"
      end

      host_config.vm.provision "shell", path: "scripts/setup-drone-ssh.sh"
      host_config.vm.provision "shell", path: "scripts/update-system-hosts.sh"
    end
  end

end
