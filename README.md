# **🤔 EXAMPLES ansible playbooks** 

This repository contains a collection of Ansible playbooks, written in YAML format, that automate the configuration and management of various aspects of a system.

## Getting Started
🚀 To get started with these Ansible playbooks, you will need to have Ansible installed on your machine. If you don't have Ansible installed, please refer to the official documentation:

- [Install Ansible](https://docs.ansible.com/ansible/latest/installation_guide/index.html)

## Usage
To run a playbook, use the ansible-playbook command followed by the path to the playbook file. For example, to run the 0-apt-playbook.yml playbook, use the following command:

`ansible-playbook 0-apt-playbook.yml`

🎯 Running a playbook will execute the defined tasks against the specified target hosts, automating the necessary configuration steps.

## Directory Structure
Here is an overview of the directory structure used in this repository:

- [templates](templates/): This directory contains the configuration files used by the playbooks. Included files:
  - [nginx.conf](templates/nginx.conf): Configuration file for Nginx.
  - [ntp.conf](templates/ntp.conf): Configuration file for NTP.

- [ansible.cfg](ansible.cfg): This file is the Ansible configuration file.

- [hosts](hosts): This file is the inventory file, containing the list of hosts that Ansible will manage.

## Available Playbooks
Here is a list of the available playbooks included in this repository:

- [0-apt-playbook.yml](0-apt-playbook.yml): Playbook to perform package management using the apt package manager.
- [1-timezone-playbook.yml](1-timezone-playbook.yml): Playbook to configure the system timezone.
- [2-ssh-playbook.yml](2-ssh-playbook.yml): Playbook to configure SSH access and settings.
- [3-nginx-playbook.yml](3-nginx-playbook.yml): Playbook to install and configure certbot & Nginx web server.

## Contributing
🤝 If you'd like to contribute to this repository by adding more docker-compose examples or improving existing ones, feel free to open an issue or submit a pull request.
