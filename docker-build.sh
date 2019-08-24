#!/bin/bash

sudo rm -rf -- "$PWD"/build
sudo docker run -v "$PWD:/mnt" debian:buster /bin/bash -c '
  echo "Installing dependencies...";
  apt-get update &>/dev/null;
  apt-get install -yy debhelper config-package-dev  pandoc make gmsl rsync &>/dev/null;
  echo "Copying source...";
  mkdir -p /tmp/build;
  rsync --archive /mnt/ /tmp/build/;
  echo "Building...";
  cd /tmp/build/;
  dpkg-buildpackage -b -rfakeroot -us -uc;
  echo "Copying results...";
  mkdir -p /mnt/build;
  rsync /tmp/*.deb /mnt/build/;
'
