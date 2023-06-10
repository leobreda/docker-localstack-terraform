#!/bin/sh

echo "\n\n=============================================="
echo "INSTALANDO DEPENDENCIAS..."
echo "----------------------------------------------"
apt-get -y install gnupg
apt-get -y install software-properties-common
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
apt-get update

echo "\n\n=============================================="
echo "INSTALANDO TERRAFORM..."
echo "----------------------------------------------"
apt-get -y install terraform

echo "\n\n=============================================="
echo  "VERIFICANDO A VERSAO DO TERRAFORM..."
echo "----------------------------------------------"
terraform --version

