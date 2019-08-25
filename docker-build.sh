#!/bin/bash

sudo rm -rf -- "$PWD"/build
sudo docker run -v "$PWD:/mnt" debian:buster /bin/bash -c '
  set -e;

  echo "Installing dependencies...";

  echo -ne "\e[0;34m"
  apt-get update;
  apt-get install -yy debhelper config-package-dev pandoc make gmsl rsync;
  echo -ne "\e[0m";

  echo "Copying source...";
  mkdir -p /tmp/build;
  rsync --archive /mnt/ /tmp/build/;

  echo "Building...";
  echo -ne "\e[0;34m"
  cd /tmp/build/;
  dpkg-buildpackage -b -rfakeroot -us -uc;
  echo -ne "\e[0m";

  echo "Copying results...";
  mkdir -p /mnt/build;
  rsync /tmp/*.deb /mnt/build/;
'
