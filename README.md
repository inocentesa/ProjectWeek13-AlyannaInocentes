# ELK_STACK_PROJECT
In this project, I set up a cloud monitoring system by configuring an ELK stack server.

## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![ELK_DIAGRAM](https://github.com/inocentesa/ProjectWeek13-AlyannaInocentes/blob/main/scripts/diagram/Cloud%20Diagram.jpg)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the [install-elk.yml] file may be used to install only certain pieces of it, such as Filebeat.

```
  GNU nano 2.9.3                                                               install-elk.yml                                                                         
---
- name: Configure Elk VM with Docker
  hosts: elk
  become: true
  tasks:
    # Use apt module
    - name: Install docker.io
      apt:
        update_cache: yes
        force_apt_get: yes
        name: docker.io
        state: present
      # Use apt module
    - name: Install python3-pip
      apt:
        force_apt_get: yes
        name: python3-pip
        state: present
      # Use pip module (It will default to pip3)
    - name: Install Docker module
      pip:
        name: docker
        state: present
      # Use command module
    - name: Increase virtual memory
      command: sysctl -w vm.max_map_count=262144
      # Use sysctl module
    - name: Use more memory
      sysctl:
        name: vm.max_map_count
        value: "262144"
        state: present
        reload: yes
      # Use docker_container module
    - name: download and launch a docker elk container
      docker_container:
        name: elk
        image: sebp/elk:761
        state: started
        restart_policy: always
        # Please list the ports that ELK runs on
        published_ports:
          -  5601:5601
          -  9200:9200
          -  5044:5044

```
This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly [available], in addition to restricting [traffic] to the network.

- What aspect of security do load balancers protect? A load balancer protects against Distributed Denial-of-Service (DDoS) attacks.
- What is the advantage of a jump box? A Jump Box controls access to other machines by allowing connections from specific IP addresses, then forwarding those connections to their repsective machines.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the [Logs] and system [traffic].
*What does Filebeat watch for? Filebeat watches and collects data about the file system.
*What does Metricbeat record? Metricbeat records and collects operating machine metrics.

The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name            | Function     | IP Address              | Operating System |
|-----------------|--------------|-------------------------|------------------|
| Jump-Box        | Gateway      | 10.1.0.11               | Linux            |
| Web-1           | UbuntuServer | 10.1.0.13               | Linux            |
| Web-2           | UbuntuServer | 10.1.0.14               | Linux            |
| ELKVM           | UbuntuServer | 10.2.0.5                | Linux            |


### Access Policies

The machines on the internal network are not exposed to the public Internet. 

- Only the [Jump-Box-Provisioner] machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
98.115.XXX.XX/32

Machines within the network can only be accessed by [Jump-Box through SSH].
- Which machine did you allow to access your ELK VM? Jump-Box-Provisioner.
- What is the machines IP address? 138.91.114.101

A summary of the access policies in place can be found in the table below.

| Name     | Publicly | Allowed IP Addresses |
|----------|----------|----------------------|
| Jump-Box | Yes      | 138.91.114.101       |
| Web-1    | No       | 10.1.0.13             |
| Web-2    | No       | 10.1.0.14             |
| ELKVM    | NO       | 10.2.0.5             |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually.

What is the main advantage of automating configuration with Ansible? Automating with Ansible allows you create consistent, reproducable results throughout multiple machine configurations.
- The playbook implements the following tasks:

Explain the steps of the ELK installation play.
- Install docker.io
- Install python3.pip
- Install docker module
- Increase virtual memory
- Use more memory

Download and lauch a docker elk container through published ports:
- 5601:5601
- 9200:9200
- 5044:5044

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![ELK_Docker](https://github.com/inocentesa/ProjectWeek13-AlyannaInocentes/blob/main/scripts/ansible/Images/Elkstack.jpg)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:

- eb-1: 10.1.0.13
- eb-2: 10.1.0.14
- eb-3: 10.1.0.11
- LK: 10.2.0.5

We have installed the following Beats on these machines:

- Filebeat
- Metricbeat

These Beats allow us to collect the following information from each machine:

In 1-2 sentences, explain what kind of data each beat collects, and provide 1 example of what you expect to see.
- Filebeat: Filebeat monitors the log files or locations that you specify, such as Syslogs, visualized by Kibana below.
- Metricbeat: Metricbeat monitors the metrics and statistics of the operating system, such as CPU usage, visualized by Kibana below.
![ELK_DIAGRAM](https://github.com/inocentesa/ProjectWeek13-AlyannaInocentes/blob/main/scripts/ansible/Images/metricbeat.JPG)

Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned:

SSH into the control node and follow the steps below:
- Copy the .yml file to the ansible directory.
- Update the config file to include remote users, host ip address, and published ports.
- Run the playbook, and navigate to the Kibana website to check that the installation worked as expected.

Answer the following questions:
- Which file is the playbook? .yml file.
- Where do you copy it? /etc/ansible, /etc/ansible/files, and /etc/ansible/roles depending on the .yml file.
- Which files do you update to make Ansible run the playbook on a specific machine? /etc/ansible/hosts and /etc/ansible/ansible.cfg.
- How do I specify which machine to install the ELK server on versus which to install Filebeat on? Editing the /etc/ansible/hosts file with the approriate IP addresses.
- Which URL do you navigate to in order to check that the ELK server is running? http://<local.host>/app/kibana#/home.
As a Bonus, provide the specific commands the user will need to run to download the playbook, update the files, etc.

- nano /etc/ansible/ansible.cfg
- nano /etc/ansible/hosts
- ansible all -m ping
- nano <your-playbook.yml>
- ansible-playbook <your-playbook.yml>
- ssh ansible@<XX.X.X.X>
- curl <local.host>/setup.php
