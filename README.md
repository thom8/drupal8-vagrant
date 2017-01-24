# Drupal 8 Sprint Box

Simple Vagrant config to download and install the latest dev version of Drupal 8.

## Requirements

* [Composer](https://getcomposer.org/download/)
* [Vagrant](https://www.vagrantup.com/) >= 1.8
* [Virtualbox](https://www.virtualbox.org/)
* [Vagrant Hostsupdater](https://github.com/cogitatio/vagrant-hostsupdater)

## Installation

  1. Open terminal (or [git bash](https://msysgit.github.io/) for windows users) and run the following commands --

  ```
  git clone https://github.com/thom8/drupal8-vagrant.git drupal8-vagrant && cd $_
  composer install
  vagrant up
  ```

  2. Go to http://d8.local/

  ```
  username: admin
  password: admin
  ```

  3. Enjoy.

## More info

This is an implementation of [Beetbox](https://github.com/beetboxvm/beetbox) so please refer to this project for more info.
