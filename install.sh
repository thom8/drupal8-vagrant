#!/bin/bash

git clone https://github.com/thom8/drupal8-vagrant.git
cd drupal8-vagrant
git submodule init
git submodule update
git submodule foreach git checkout 8.0.x
git submodule foreach git pull origin 8.0.x
vagrant up