# Cloud-1

[![Vagrant](https://img.shields.io/badge/Vagrant-1868F2?style=flat-square&logo=vagrant&logoColor=white)](https://www.vagrantup.com/)
[![Ansible](https://img.shields.io/badge/Ansible-EE0000?style=flat-square&logo=ansible&logoColor=white)](https://www.ansible.com/)
[![Docker](https://img.shields.io/badge/Docker-2496ED?style=flat-square&logo=docker&logoColor=white)](https://www.docker.com/)
[![Docker Compose](https://img.shields.io/badge/Compose-2496ED?style=flat-square&logo=docker&logoColor=white)](https://docs.docker.com/compose/)
[![NGINX](https://img.shields.io/badge/NGINX-009639?style=flat-square&logo=nginx&logoColor=white)](https://nginx.org/)
[![WordPress](https://img.shields.io/badge/WordPress-21759B?style=flat-square&logo=wordpress&logoColor=white)](https://wordpress.org/)
[![phpMyAdmin](https://img.shields.io/badge/phpMyAdmin-6C78AF?style=flat-square&logo=phpmyadmin&logoColor=white)](https://www.phpmyadmin.net/)

## Project Overview

This repository implements a Cloud subject project using Vagrant, Ansible, and Docker Compose. The goal is to provision a virtual machine, automate the environment setup, and deploy a multi-service web application in a reproducible way.
The project creates an isolated infrastructure where:
- Vagrant provisions a Debian-based virtual machine.
- Ansible automates the installation of Docker and the required runtime dependencies.
- Docker Compose runs a web application stack composed of Nginx, WordPress, phpMyAdmin, and MariaDB.

This setup is designed to follow the objectives of the Cloud subject: automation, infrastructure reproducibility, and service orchestration.

## Main Components

- Vagrant: defines the virtual machine environment and shared folders.
- Ansible: installs and configures the necessary tools inside the VM.
- Docker Compose: manages the containerized application services.
- Docker volumes: ensure persistence for database and application data.

## Repository Structure

```text
cloud-1/
├── README.md
├── subject/
│   ├── Makefile
│   ├── Vagrantfile
│   ├── .env.example
│   ├── ansible/
│   │   ├── playbook.yml
│   │   └── config/
│   │       ├── hosts.ini.example
│   │       ├── requirements.yml
│   │       └── vars.yml
│   └── src/
│       ├── docker-compose.yml
│       ├── .env.example
│       └── requirement/
│           ├── MariaDB/
│           │   ├── Dockerfile
│           │   └── conf/
│           │       └── setup.sh
│           ├── NGINX/
│           │   ├── Dockerfile
│           │   └── conf/
│           │       └── nginx.conf
│           ├── Phpmyadmin/
│           │   ├── Dockerfile
│           │   └── conf/
│           │       └── setup.sh
│           └── WordPress/
│               ├── Dockerfile
│               └── conf/
│                   └── setup.sh
└── test_server/
    ├── Makefile
    └── Vagrantfile
```

- subject/Vagrantfile: VM definition for VirtualBox.
- subject/ansible/: provisioning playbooks and role configuration.
- subject/src/docker-compose.yml: container orchestration configuration.
- subject/src/requirement/: custom Dockerfiles and setup scripts for each service.
- subject/src/.env.example: example environment variables for the stack.

## Prerequisites

Before starting, make sure the following tools are installed on the host machine:
- VirtualBox
- Vagrant
- Ansible
- Docker (optional for local debugging, but the VM is the main execution environment)

## Setup Instructions

1. Move to the subject directory:

```bash
cd subject
```

2. Create the required configuration files before starting the environment:

```bash
cp .env.example .env
cp src/.env.example src/.env
cp ansible/config/hosts.ini.example ansible/config/hosts.ini
```

3. Review and adjust the configuration files as needed:
- subject/.env: Vagrant and VM-related settings such as VAGRANT_HOME and VBOX_VM_PATH.
- subject/src/.env: Docker Compose environment variables for services such as MariaDB, WordPress, and phpMyAdmin.
- subject/ansible/config/hosts.ini: Ansible inventory for the target VM.

4. Start the virtual machine using the provided Makefile:

```bash
make up
```

5. Connect to the VM if needed:

```bash
vagrant ssh
```

6. To stop and destroy the VM:

```bash
make down
make clean
```

## Access

Once the services are running, the platform can be accessed through the configured domain or VM IP address, depending on the environment setup.

## Notes

- Environment values such as database credentials and volume paths should be adjusted in the .env file.
- Sensitive information should not be committed directly to the repository.
- The project is intended to demonstrate a practical cloud-style deployment workflow using automation tools and containerization.

## AI usage
This README was drafted with assistance from an AI to help structure sections and example commands.
