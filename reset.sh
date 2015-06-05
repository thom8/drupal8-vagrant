#!/bin/bash

vagrant ssh -c "rm -rf ~/vagrantup && rm -rf ~/siteinstalled"2&>/dev/null
vagrant provision
