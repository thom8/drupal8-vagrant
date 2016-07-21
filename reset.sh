#!/bin/bash

vagrant ssh -c "cd /var/beetbox/docroot && drush sql-drop -y"
vagrant provision
