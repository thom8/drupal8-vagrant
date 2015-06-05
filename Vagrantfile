# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'yaml'
if !File.exist?('./config.yml')
  raise 'Configuration file not found!'
end
vconfig = YAML::load_file("./config.yml")

Vagrant.configure(2) do |config|

    config.vm.box = vconfig['vagrant_box']

    # Site Install
    if vconfig['drush_site_install']

      # Copy site_install.sh.
      config.vm.provision "si_upload", type: "file" do |s|
       s.source = "./vagrant-includes/site_install.sh"
       s.destination = "/home/vagrant/site_install.sh"
      end

      # Run install
      config.vm.provision "site_install", type: "shell" do |s|
        s.inline = "/bin/bash /home/vagrant/site_install.sh $1 $2 $3 $4"
        s.args = [
          vconfig['mysql_databases'][0]['name'],
          vconfig['drupal_site_name'],
          vconfig['drupal_user'],
          vconfig['drupal_password']
        ]
      end
    end

end
