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
        s.inline = "/bin/bash /home/vagrant/site_install.sh $1 \"$2\" $3 $4"
        s.args = [
          vconfig['mysql_databases'][0]['name'],
          vconfig['drupal_site_name'],
          vconfig['drupal_user'],
          vconfig['drupal_password']
        ]
      end
    end

end

# Create drush alias.
if vconfig['create_drush_alias']

  require 'erb'
  class DrushAlias
    attr_accessor :hostname, :uri, :ip, :root
    def template_binding
      binding
    end
  end

  alias_file = "#{Dir.home}/.drush/"+vconfig['vagrant_hostname']+".aliases.drushrc.php"
  if ARGV[0] == "destroy"
    File.delete(alias_file) if File.exist?(alias_file)
  else
     alias_file = File.open(alias_file, "w+")
     template = File.read("./vagrant-includes/drush_alias.erb")
     da = DrushAlias.new
     da.hostname = vconfig['vagrant_hostname']
     da.uri = vconfig['apache_vhosts'][0]['servername']
     da.ip = vconfig['vagrant_ip']
     da.root = vconfig['vagrant_synced_folders'][0]['destination']
     alias_file << ERB.new(template).result(da.template_binding)
     alias_file.close
  end

end
