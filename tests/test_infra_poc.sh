#!/bin/bash

python3 -m venv validation

source validation/bin/activate

pip3 install --upgrade pip

pip3 install pytest-testinfra

pip3 install paramiko

pytest -v --connection=ansible --hosts=all --ansible-inventory=.vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory tests/test_web_connection.py

pytest -v --connection=ansible --hosts=webapp --ansible-inventory=.vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory tests/test_httpd_service.py

pytest -v --connection=ansible --hosts=lb --ansible-inventory=.vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory tests/test_docker_running.py

pytest -v tests/test_page_output.py
