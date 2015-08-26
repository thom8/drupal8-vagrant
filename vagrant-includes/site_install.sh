#!/bin/bash

dbName="$1"
siteName="$2"
drupalUser="$3"
drupalPass="$4"

if [ ! -f /home/vagrant/siteinstalled ] ; then

  # Override default path
  echo "
  if [ -e /drupal/docroot ] ; then
    cd /drupal/docroot
  fi" > /home/vagrant/.bashrc

  # Checkout drupal project
  if [ ! -f /drupal/docroot/core/install.php ] ; then
    mkdir -p /drupal/docroot/
    cp -r /home/vagrant/drupal8/.git /drupal/docroot/
    cd /drupal/docroot/ && git fetch origin && git reset --hard origin/8.0.x
  fi

  echo "Starting Drupal 8 installation. This takes a few mins."

cat  << "EOF"


      __                                   ___          __
     /\ \                                 /\_ \       /'_ `\
     \_\ \  _ __   __  __  _____      __  \//\ \     /\ \L\ \
     /'_` \/\`'__\/\ \/\ \/\ '__`\  /'__`\  \ \ \    \/_> _ <_
    /\ \L\ \ \ \/ \ \ \_\ \ \ \L\ \/\ \L\.\_ \_\ \_    /\ \L\ \
    \ \___,_\ \_\  \ \____/\ \ ,__/\ \__/.\_\/\____\   \ \____/
     \/__,_ /\/_/   \/___/  \ \ \/  \/__/\/_/\/____/    \/___/
                             \ \_\
                              \/_/

--
EOF

  # Tidy up
  sudo chmod 775 /drupal/docroot/sites/default/ >/dev/null
  sudo rm -rf /drupal/docroot/sites/default/services.yml >/dev/null
  sudo rm -rf /drupal/docroot/sites/default/settings.php >/dev/null

  # Install Drupal
  drush --root=/drupal/docroot site-install -y -q \
  --db-url="mysql://root:root@localhost:3306/$dbName" \
  --account-name="$drupalUser" \
  --account-pass="$drupalPass" \
  --site-name="$siteName" >/dev/null

  # Set permissions
  sudo chgrp -R www-data /drupal/docroot

  echo "Install complete."

  echo "Open http://d8.ddns.net/ or use the one-time login link below."
  drush --root=/drupal/docroot --uri=http://d8.ddns.net/ user-login

  # Create dbimported file.
  touch /home/vagrant/siteinstalled

fi