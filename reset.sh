#!/bin/bash
#
# Re-install Drupal.
#

vagrant ssh -c "sudo rm -rf /home/vagrant/vagrantup /home/vagrant/siteinstalled"
vagrant provision
