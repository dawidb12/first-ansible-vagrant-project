#!/bin/bash

# creating VMs
vagrant up

# copy the ssh key to VMs
ssh-copy-id vagrant@vagrant1
ssh-copy-id vagrant@vagrant2

# run an Ansible playbook
cd ansible
ansible-playbook -i hosts main.yml