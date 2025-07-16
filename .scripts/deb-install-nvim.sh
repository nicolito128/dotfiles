#!/usr/bin/env bash

sudo apt remove -y neovim
sudo apt install -y ninja-build gettext cmake unzip curl

if [ -d neovim/ ];then
    rm -rf neovim/
fi

git clone https://github.com/neovim/neovim

cd neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo

cd build
cpack -G DEB
sudo dpkg -i --force-overwrite  nvim-linux*.deb
