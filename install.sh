#!/bin/bash

git clone https://github.com/thom8/drupal8-vagrant.git
cd drupal8-vagrant
if !(vagrant plugin list | grep -q vagrant-hostsupdater); then
  vagrant plugin install vagrant-hostupdater
fi
vagrant up