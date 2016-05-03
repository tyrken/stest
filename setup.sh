#!/bin/sh

set -e

if ! command -v apt-get
then
  echo "This script has only been tested on an Ubuntu variant, and so will not work on you distro"
  echo "Please install the latest versions of VirtualBox, Vagrant and ChefDK manually"
  exit 1
fi

echo "Checking for VirtualBox, Vagrant and ChefDK..."

if ! command -v vboxmanage
then
  apt-get install -y virtualbox-nonfree
fi

cd /tmp

if ! command -v vagrant
then
  curl -OL https://releases.hashicorp.com/vagrant/1.8.1/vagrant_1.8.1_x86_64.deb
  dpkg -i vagrant_1.8.1_x86_64.deb
fi

if ! command -v chef
then
  curl -OL https://packages.chef.io/stable/ubuntu/12.04/chefdk_0.13.21-1_amd64.deb
  dpkg -i chefdk_0.13.21-1_amd64.deb
fi

echo "Checking Vagrant plugins..."

vagrant plugin list | grep vagrant-vbguest || vagrant plugin install vagrant-vbguest
vagrant plugin list | grep vagrant-berkshelf || vagrant plugin install vagrant-berkshelf

echo "Finished setup"
