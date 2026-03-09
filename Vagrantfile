Vagrant.configure("2") do |config|
 config.vm.box = "spox/ubuntu-arm"
 config.vm.box_version = "1.0.0"
 config.vm.hostname = "sysadmin-toolkit"
 
 # fixed IP so I don't have to look it up every time
 config.vm.network "private_network", ip: "192.168.56.10"

 config.vm.provider "vmware_desktop" do |vmware|
  vmware.gui = true
  vmware.allowlist_verified = true
  vmware.memory = "1024"
  vmware.cpus = 1
 end

 config.vm.provision "shell", inline: <<-SHELL
  apt-get update -y
  apt-get install -y git python3 python3-pip
 SHELL
end
