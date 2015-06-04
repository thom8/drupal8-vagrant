#!/bin/bash

# Reprovision the box.
# Skip if vagrantup_provision is false.

vagrantup_provision="$1"

if [ "$vagrantup_provision" == "false" ] ; then

  if [ ! -f vagrantup ] ; then

    # Create vagrantup file.
    touch vagrantup

    # Skip provisioning
    skip_provision="true"

    echo "Skipped provisioning on vagrant up."

  fi

fi

if [ ! "$skip_provision" ] ; then

  # Remove drush
  sudo rm -rf /usr/local/share/drush/

  # cd to Ansible staging directory
  cd /etc/ansible/staging

  echo "Reprovisioning box."
  ANSIBLE_FORCE_COLOR=1 PYTHONUNBUFFERED=1 ansible-playbook playbook.yml --sudo -c local -i "127.0.0.1vagrant,"

fi