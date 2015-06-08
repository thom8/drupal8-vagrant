# Drupal 8 Vagrant Box

  1. Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads) & [Vagrant](https://www.vagrantup.com/downloads.html)

  2. Open terminal and run the following commands --

  ```
  git clone https://github.com/thom8/drupal8-vagrant.git
  cd drupal8-vagrant
  git submodule init
  git submodule update
  vagrant up
  ```

  3. If you have [Vagrant Host Updater](https://github.com/cogitatio/vagrant-hostsupdater) installed - skip this step..

  Update you hosts file - add the following line:

  ```
  192.168.8.8      d8.local
  ```

  4. Goto http://d8.local/

  username :: vagrant

  password :: vagrant

  5. Happy days.
