#!/bin/bash

set -e
#Pre requisites 

mkdir -p /home/dave/.local/lib \
    /home/dave/.local/bin

apt install -y \
    zip \
    python3-pip

#Install Ohmyzsh
echo "Installing OhMyZsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cp zsh/zshrc ~/.zshrc

#Install Golang
echo "Golang time"
wget https://go.dev/dl/go1.18.1.linux-amd64.tar.gz
tar -xvz go1.18.1.linux-amd64.tar.gz
mv go /usr/local

#Install working tools
#tfenv
git clone https://github.com/tfutils/tfenv.git ~/.tfenv
tfenv install #install latest available terraform version

#awcli
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
./aws/install -i /usr/local/aws-cli -b /usr/local/bin

#OCI CLI
curl https://raw.githubusercontent.com/oracle/oci-cli/master/scripts/install/install.sh -o oci_install.sh
bash oci_install.sh --install-dir /home/dave/.local/lib/oracle-cli \
    --exec-dir /home/dave/.local/bin \
    --script-dir /home/dave/.local/bin/oci-cli-scripts \
    --optional-features no \
    --update-path-and-enable-tab-completion \
    --rc-file-path /home/dave/.zshrc
    
#kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
#kubectx
git clone https://github.com/ahmetb/kubectx
cp kubectx/kubectx /home/dave/.local/bin
cp kubectx/kubens /home/dave/.local/bin

#pre-commit
pip3 install pre-commit

#helm
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

