#!/bin/bash

set -e

#Install Ohmyzsh
echo "Installing OhMyZsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cp zsh/zshrc ~/.zshrc

#Install Golang
echo "Golang time"
wget https://go.dev/dl/go1.18.1.linux-amd64.tar.gz
tar -xvz go1.18.1.linux-amd64.tar.gz
mv go /usr/local



