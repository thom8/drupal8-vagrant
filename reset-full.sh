#!/bin/bash

vagrant ssh -c "sudo chmod 775 /var/beetbox/docroot/sites/default && rm -rf /var/beetbox/docroot"
vagrant provision
