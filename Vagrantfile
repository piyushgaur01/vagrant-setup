VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

	config.vm.box = "ubuntu/xenial64"

	config.vm.network "forwarded_port", guest: 8081, host: 8081

	config.vm.provider :virtualbox do |vb|
		vb.customize ["modifyvm", :id, "--memory", "512"]
		vb.name = "express-app"
	end

	config.vm.provision :shell, :path => "system/prov.sh"

end