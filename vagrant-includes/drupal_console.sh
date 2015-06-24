#!/bin/bash

if [ ! -f /usr/local/bin/drupal ] ; then

  # Install Drupal Console.
  curl -LSs http://drupalconsole.com/installer | php
  mv console.phar /usr/local/bin/drupal

fi