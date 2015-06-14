# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'yaml'
if !File.exist?('./config.yml')
  raise 'Configuration file not found!'
end
vconfig = YAML::load_file("./config.yml")

Vagrant.configure(2) do |config|

    config.vm.box = vconfig['vagrant_box']

end
