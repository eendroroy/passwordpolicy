# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"

  config.vm.box_check_update = true

  config.vm.network "private_network", ip: "192.168.33.10"

  config.vm.synced_folder ".", "/home/vagrant/passwordpolicy"

  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.memory = 1024
  end

  config.vm.provision "shell", inline: <<-SHELL
    yum -y update
    rpm -Uvh https://yum.postgresql.org/10/redhat/rhel-7-x86_64/pgdg-centos10-10-2.noarch.rpm
    yum -y install postgresql10-server postgresql10-libs postgresql10-devel postgresql10-contrib
    yum -y install cracklib cracklib-devel
    # default data directory is '/var/lib/pgsql/10/data/'
    /usr/pgsql-10/bin/postgresql-10-setup initdb
    sudo cp /home/vagrant/passwordpolicy/postgresql.conf /var/lib/pgsql/10/data/postgresql.conf
    systemctl start postgresql-10.service
    systemctl enable postgresql-10.service
  SHELL
end