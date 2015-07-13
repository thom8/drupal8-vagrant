#!/bin/bash

vagrant ssh -c "sudo rm -rf ~/vagrantup ~/siteinstalled"
vagrant provision
