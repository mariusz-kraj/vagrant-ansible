#!/usr/bin/env bash

sudo apt-add-repository ppa:ansible/ansible -y
sudo apt-get update
sudo apt-get install ansible -y

ansible-playbook --connection=local --inventory=/vagrant/ansible/hosts /vagrant/ansible/playbook.yml
