# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  # Multi-server loop
  servers=[
    {
      :hostname => "vagrant1",
      :box => "bento/ubuntu-18.04",
      :ip => "192.168.33.10",
      :ssh_port => '2200'
    },
    {
      :hostname => "vagrant2",
      :box => "bento/ubuntu-18.04",
      :ip => "192.168.33.11",
      :ssh_port => '2201'
    },
  ]

  servers.each do |machine|
    config.vm.define machine[:hostname] do |node|
      node.vm.box = machine[:box]
      node.vm.hostname = machine[:hostname]
      node.vm.network :private_network, ip: machine[:ip]
      node.vm.network "forwarded_port", guest: 22, host: machine[:ssh_port], id: "ssh"
      node.vm.provider :virtualbox do |vb|
        vb.memory = 512
        vb.cpus = 1
      node.ssh.forward_agent = true
      node.vm.provision :shell, inline: <<-SHELL
        apt-get update
        apt-get install htop -y
        apt-get install python-simplejson
      SHELL
      end
    end
  end

end
