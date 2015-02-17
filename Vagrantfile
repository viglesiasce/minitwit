# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  config.vm.box = "chef/ubuntu-12.04"
  config.vm.provider :aws do |aws, override|
    override.vm.box_url = 'https://github.com/mitchellh/vagrant-aws/raw/master/dummy.box'
    override.ssh.username = "ubuntu"
    override.ssh.private_key_path = '~/.ssh/id_rsa'
    aws.access_key_id = ENV['EC2_ACCESS_KEY']
    aws.secret_access_key = ENV['EC2_SECRET_KEY']
    aws.region = "us-west-1"
    aws.ami = "ami-3a5f457f"
    aws.instance_type = 't1.micro'
    aws.keypair_name = 'vic'
  end
  config.vm.provision "shell", path: "deployment/run.sh"
  config.vm.network "forwarded_port", guest: 5000, host: 5000
  config.vm.synced_folder ".", "/vagrant", type: "rsync"
end

