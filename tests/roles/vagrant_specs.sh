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
    cp ~vagrant/specs /usr/local/bin/specs
    chmod 755 /usr/local/bin/specs
    if [[ -x '/usr/bin/apt-get' ]]; then
      sudo apt-get install -qqy git
    else
      sudo yum install -q -y git
    fi
    su vagrant -c 'git clone --depth 1 https://github.com/nickjj/rolespec'
    cd ~vagrant/rolespec && make install
    su vagrant -c '/usr/local/bin/rolespec -i ~/testdir'
    su vagrant -c "ln -s /vagrant/$2/$3 ~/testdir/$2/$3"
    su vagrant -c "ln -s /vagrant/tests/$2/$3 ~/testdir/tests/$3"
    chmod -R 777 "/home/vagrant/testdir/"
    exit
fi

cd ~vagrant/testdir && rolespec -r $(ls roles) "$*"