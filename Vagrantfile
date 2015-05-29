# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    filename = './ansible/group_vars/all'
    if !File.exist?(filename) and !File.file?(filename)
        print "Create ./ansible/group_vars/all (based on dist)\n"
        exit
    end

    require './vagrant/configuration'
    parameters = Configuration.get_vars(filename)

    hostname = parameters['project'] + ".dev";

    config.vm.box = "ubuntu/trusty64"

    config.vm.boot_timeout = 5000
    config.ssh.forward_agent = true

    config.vm.provider :virtualbox do |provider, override|
        override.vm.hostname = hostname;
        override.vm.synced_folder ".", "/usr/share/nginx/www/app/", :mount_options => ["dmode=777","fmode=666"]

        override.vm.network :private_network, ip: parameters['ip']

        provider.name = parameters['project']
        provider.gui = false
        provider.customize ["modifyvm", :id, "--memory", parameters['memory']]
        provider.customize ["modifyvm", :id, "--cpus", parameters['cpu']]
    end

    config.vm.provision "shell", path: "ansible/provision.sh"
end
