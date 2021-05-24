ansible_groups = {
  "webapp" => [
    "web1",
    "web2"
  ],
  "lb" => [
    "nginx"
  ]
}


Vagrant.configure("2") do |config|
    config.vm.box = "centos/7"
    config.vm.box_check_update = false

    config.vm.define "web1" do |server|
        server.vm.hostname = "web1"
        server.vm.network "private_network", ip: "192.168.10.10"
        server.vm.provider "virtualbox" do |v|
            v.name = "web1"
            v.memory = 512
            v.cpus = 1
            v.gui = false
        end
        server.vm.provision "ansible" do |ansible|
            ansible.playbook = "ansible/playbook.yml"
            ansible.groups = ansible_groups
        end
    end

    config.vm.define "web2" do |server|
        server.vm.hostname = "web2"
        server.vm.network "private_network", ip: "192.168.10.11"
        server.vm.provider "virtualbox" do |v|
            v.name = "web2"
            v.memory = 512
            v.cpus = 1
            v.gui = false
        end
        server.vm.provision "ansible" do |ansible|
            ansible.playbook = "ansible/playbook.yml"
            ansible.groups = ansible_groups
        end
    end

    config.vm.define "nginx" do |server|
        server.vm.hostname = "nginx"
        server.vm.network "private_network", ip: "192.168.10.12"
        server.vm.network "forwarded_port", guest: 80, host: 8080
        server.vm.provider "virtualbox" do |v|
            v.name = "nginx"
            v.memory = 512
            v.cpus = 1
            v.gui = false
        end
        server.vm.provision "ansible" do |ansible|
            ansible.playbook = "ansible/playbook.yml"
            ansible.groups = ansible_groups
        end
    end
end
