Vagrant.configure("2") do |config|

    config.vm.box = "debian/bookworm64"
    config.vm.synced_folder ".", "/home/vagrant/cloud-1", disabled: false

    config.vm.network "private_network", ip: "192.168.56.110"
    
    # the following line doesn't work at 42pc cuz it needs to access /etc/hosts and it is forbidden
    # config.vm.hostname = "cloud.com"
    # you need to install hostmanager plugin -> vagrant plugin install vagrant-hostmanager
    # config.hostmanager.enabled = true
    # config.hostmanager.manage_host = true

    config.vm.provider "virtualbox" do |vb|
        vb.gui = false
        vb.memory = "8192"
        vb.cpus = 4
    end

    config.vm.provision :docker

    config.vm.provision "shell", reboot: true, inline: <<-SHELL
        sudo apt-get update -y
        sudo apt-get install -y make
    SHELL
end
