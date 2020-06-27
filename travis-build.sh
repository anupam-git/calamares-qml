#!/bin/bash

apt-get --yes update
apt-get --yes install wget gnupg2

### Install Dependencies
apt-get --yes update
apt-get --yes dist-upgrade
DEBIAN_FRONTEND=noninteractive apt-get --yes install devscripts lintian build-essential automake autotools-dev equivs keyboard-configuration console-setup ttools5-dev libyaml-cpp-dev libpolkit-qt5-1-dev libkf5crash-dev python3-dev libkpmcore-dev libkf5parts-dev libappstreamqt-dev libkf5plasma-dev libkf5package-dev libpwquality-dev libparted-dev libpythonqt-qt5-common-dev libpythonqt-qtall-qt5-common-dev libboost-dev libboost-python-dev
mk-build-deps -i -t "apt-get --yes" -r

### Build Deb
mkdir source
mv ./* source/ # Hack for debuild
cd source
debuild -b -uc -us
