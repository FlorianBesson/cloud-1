Vagrant.configure("2") do |config|

    config.vm.box = "debian/bookworm64"
    config.vm.synced_folder "./src", "/home/vagrant/src", disabled: false
    config.vm.synced_folder "./ansible", "/home/vagrant/ansible", disabled: false

    config.vm.network "private_network", ip: "192.168.56.110"
    
    # todo: the following line doesn't work at 42pc cuz it needs to access /etc/hosts and it is forbidden
    # config.vm.hostname = "cloud.com"
    # you need to install hostmanager plugin -> vagrant plugin install vagrant-hostmanager
    # config.hostmanager.enabled = true
    # config.hostmanager.manage_host = true

    config.vm.provider "virtualbox" do |vb|
        vb.gui = false
        vb.memory = "8192"
        vb.cpus = 4
    end

    # install docker
    config.vm.provision :docker

    # install ansible
    config.vm.provision "ansible_local" do |ansible|
        ansible.playbook = "./ansible/playbook.yml"
        ansible.inventory_path = "./ansible/hosts.ini"
        ansible.limit = "all"
    end
end
