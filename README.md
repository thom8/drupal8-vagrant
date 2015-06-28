# Drupal 8 Vagrant Box

  1. Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads) & [Vagrant](https://www.vagrantup.com/downloads.html)

  2. Open terminal (or [git bash](https://msysgit.github.io/) for windows users) and run the following commands --

  ```
  git clone --recursive https://github.com/thom8/drupal8-vagrant.git
  cd drupal8-vagrant
  git submodule foreach git checkout 8.0.x
  vagrant plugin install vagrant-hostupdater
  vagrant up
  ```

  3. If [Vagrant Host Updater](https://github.com/cogitatio/vagrant-hostsupdater) was successfully installed - skip this step..

  Update your [hosts file](http://www.howtogeek.com/howto/27350/beginner-geek-how-to-edit-your-hosts-file/) - add the following line:

  ```
  192.168.8.8      d8.local
  ```

  4. Go to http://d8.local/

  ```
  username: vagrant
  password: vagrant
  ```

  5. Enjoy.

## Demo

[![Demo video](https://lh3.googleusercontent.com/Bugy6wSJ8Z7cqFbG1sLTQFT4HIcFrgG5xy3lvYVBYC02=w854-h510-no)](https://www.youtube.com/watch?v=JNG_y0rCZFc)

## More info

This is an implementation of [Acquia Vagrant](https://github.com/thom8/acquia-vagrant) so please refer to this project for more info.