# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  require 'yaml'
  if File.exist?('./config.yml')
    # Load config.yml
    vconfig = YAML::load_file("./config.yml")
    # Set base box.
    config.vm.box = vconfig['vagrant_box']
  end

  # Install drupal console.
  if vconfig['drupal_console_install']
    config.vm.provision "drupal_console", type: "shell" do |s|
      s.privileged = true
      s.path = "./vagrant-includes/drupal_console.sh"
    end
  end

end
