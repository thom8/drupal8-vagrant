#!/bin/bash

vagrant ssh -c "sudo chmod 775 /drupal/docroot/sites/default && rm -rf /home/vagrant/vagrantup /home/vagrant/siteinstalled /drupal/docroot"
vagrant provision
