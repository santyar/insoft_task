# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
 
# config.vm.network "public_network", auto_config: false
 
 config.vm.box = "hashicorp/precise32"
 config.vm.network "forwarded_port", guest: 80, host: 8080
   
 config.vm.provider "virtualbox" do |vb|
     vb.name = "ServerShell"
     vb.memory = "512"
     vb.cpus = "1"
   end
 config.vm.provision :shell, path: "serv.sh"
end

