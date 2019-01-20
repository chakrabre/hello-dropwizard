Vagrant.configure('2') do |config|
	
	  config.vm.hostname = 'chak-hello-dropwizard'
	  config.vm.box = 'chakbox-centos-7.2'
	  config.vm.box_url = 'http://-vm-dropwz.s3.amazonaws.com/vagrant/virtualbox/chak_centos-7.2_chef-provisionerless.box'
	
	  config.vm.synced_folder './', '/vagrant'
	
	  config.vm.define 'jar' do |jar|
	    jar.vm.network :forwarded_port, guest: 8080, host: 8181
	    jar.vm.network :forwarded_port, guest: 8080, host: 8181
	
	    jar.vm.provider :virtualbox do |vb|
	      vb.name = 'hello-dropwizard-jar'
	    end
	
	    jar.vm.provision :shell do |shell|
	      shell.inline = <<-SHELL
	        sudo service hello-dropwizard stop
	        sudo yum -y install java
	        sudo mkdir -p /var/hello-dropwizard
	        sudo mkdir -p /var/hello-dropwizard/logs
	        sudo cp /vagrant/target/hello-dropwizard-1.0-SNAPSHOT.jar /var/hello-dropwizard/hello-dropwizard.jar
	        sudo cp /vagrant/example-vagrant.yml /var/hello-dropwizard/example.yml
	        sudo cp /vagrant/linux_service_file /etc/init.d/hello-dropwizard
	
	        sudo sed -i -e 's/\r//g' /etc/init.d/hello-dropwizard
	        sudo service dropwizard start
	      SHELL
	    End
	  End
	
	  config.vm.define 'docker' do |docker|
	    docker.vm.network :forwarded_port, guest: 8080, host: 8080
	    docker.vm.network :forwarded_port, guest: 8081, host: 8081
	
	    docker.vm.provider :virtualbox do |vb|
	      vb.name = 'hello-dropwizard'
	      vb.customize ['modifyvm', :id, '--memory', '768', '--cpus', '2']
	    end
	  
	    docker.vm.provision :shell do |shell|
	      shell.inline = <<-SHELL
	        sudo yum -y install epel-release
	        sudo yum -y install python-pip
	        sudo pip install --upgrade pip
	        sudo pip install six==1.4
	        sudo pip install docker-py
	      SHELL
	    end
	  
	    docker.vm.provision :docker do |docker|
	      docker.build_image '/vagrant/.', args: '-t hello-dropwizard’

	      docker.run 'hello-dropwizard', args: '-it -p 8080:8080 -p 8081:8081 version=2.0.0'
	    end
	  end
	  
	end

