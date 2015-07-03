#!/bin/bash

vagrant ssh -c "sudo rm -rf ~/vagrantup && sudo rm -rf ~/siteinstalled"2&>/dev/null
vagrant provision
