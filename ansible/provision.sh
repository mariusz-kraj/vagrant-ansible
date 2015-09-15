#!/usr/bin/env bash

sudo apt-add-repository ppa:ansible/ansible -y
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install ansible -y

ansible-playbook -v --connection=local --inventory=/usr/share/nginx/www/app/vagrant-ansible/ansible/hosts /usr/share/nginx/www/app/vagrant-ansible/ansible/playbook.yml

sudo apt-get autoremove -y