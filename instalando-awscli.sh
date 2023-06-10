#!/bin/sh

echo "\n\n=============================================="
echo "INSTALANDO AWSCLI..."
echo "----------------------------------------------"
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

echo "\n\n=============================================="
echo  "VERIFICANDO A VERSAO DO AWSCLI..."
echo "----------------------------------------------"
aws --version

