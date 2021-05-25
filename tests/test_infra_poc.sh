#!/bin/bash

pytest -v --connection=ansible --hosts=all --ansible-inventory=../.vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory test_web_connection.py

pytest -v --connection=ansible --hosts=webapp --ansible-inventory=../.vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory test_httpd_service.py

pytest -v --connection=ansible --hosts=lb --ansible-inventory=../.vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory test_docker_running.py

pytest -v test_page_output.py
