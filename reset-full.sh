#!/bin/bash
#
# Reset Drupal installation and vagrant box.
#

vagrant ssh -c "sudo chmod 775 /var/www/drupal/docroot/sites/default && rm -rf /home/vagrant/vagrantup /home/vagrant/siteinstalled /var/www/drupal/docroot"
vagrant provision
