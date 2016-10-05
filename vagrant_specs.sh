#!/bin/bash
#
# Vagrant provisionning script
#
# Usage for provisionning VM & running (in Vagrant file):
# 
# script.sh --install <role>
#
# e.g. : 
# script.sh --install ansible-nginx
# 
# Usage for running only (from host):
#
# vagrant ssh -c specs
#
if [ "x$1" == "x--install" ]; then
    # rolespec
    sudo yum install rpm yum unzip git wget make vim -y
    mv ~vagrant/specs /usr/local/bin/specs
    chmod 755 /usr/local/bin/specs
    su vagrant -c 'git clone --depth 1 https://github.com/nickjj/rolespec'
    cd /home/vagrant/rolespec && make install
    /usr/local/bin/rolespec -i /home/vagrant/testdir 
    ln -s /vagrant/ /home/vagrant/testdir/roles/$2 
    ln -s /vagrant/tests/$2/ /home/vagrant/testdir/tests/ 
    sudo chown -R vagrant:vagrant /home/vagrant/testdir 
    sudo chmod -R 777 /home/vagrant/testdir 
    echo "alias specs='sudo chmod -R 777 /home/vagrant/testdir/ ; chmod 777 /home/vagrant/testdir/tests/setup_xenforo/test ; specs'" >> ~/.bashrc # @TODO : improve  
    exit
fi

cd /home/vagrant/testdir && rolespec -r $(ls roles) "$*" && sudo chmod -R 777 /home/vagrant/testdir/tests ; 