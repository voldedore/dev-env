# Vagrant setting files

This is a personal place to store vagrant dev env setting.

Mainly used: homestead2 (based on laravel dev en), to dev magento.

### Pre-requirements

1. Installed VirtualBox.
2. Installed vagrant
3. Installed vagrant's extension bindfs

  > vagrant plugin install vagrant-bindfs

### Instructions

1. Clone the repo

  > git clone https://github.com/voldedore/dev-env.git

2. Created ssh key inside Vagrant/homestead2/.ssh

  > cd dev-env/Vagrant/homestead2
  >
  > ssh-keygen -t rsa -C "your@mail.com" -f .ssh/id_rsa

3. Edit the following info in the Homestead.yaml file

 * IP address: IP address of your virtual machine (guest)
 * folders.map: Source code located in your machine (host)
 * sites.to: Change mage-dev to what you have in your source code directory, which is going to be linked to virtual domain http://mage.dev/index.php

4. Get things up

 > vagrant up

### Troubleshooting

* Sometimes you may want to update the Ubuntu box, getting latest update of bindfs. To ssh to guest machine, do:

  > vagrant ssh

  * Inside guest machine run:

    > sudo apt-get update
    >
    > sudo apt-get install bindfs

  * Ctrl + D to return to host

  > vagrant reload

### Additional Info

* Nginx location: /etc/nginx

* Mysql location: /etc/mysql

* PHP-FPM5 location: /etc/php5

  * PHP5 runs as unix:/var/run/php5-fpm.sock

* HHVM location: /etc/hhvm

  * HHVM runs as 127.0.0.1:9000
