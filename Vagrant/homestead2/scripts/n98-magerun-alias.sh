#!/usr/bin/env bash
# This will add magerun to sh alias
echo "Attempt to make alias to n98-magerun"
if [ -f "/home/vagrant/Code/shell/magerun/n98-magerun.phar" ]
then
  echo "Make alias to n98-magerun"
  echo "# n98-magerun alias" >> ~/.bashrc
  echo "alias magerun='/home/vagrant/Code/shell/magerun/n98-magerun.phar'" >> ~/.bashrc
else
	echo "Did not make alias to n98-magerun."
fi
