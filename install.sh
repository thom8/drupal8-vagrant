#!/bin/bash

git clone --recursive https://github.com/thom8/drupal8-vagrant.git
cd drupal8-vagrant
git submodule foreach git checkout 8.0.x
if !(vagrant plugin list | grep -q vagrant-hostsupdater); then
  vagrant plugin install vagrant-hostupdater
fi
vagrant up