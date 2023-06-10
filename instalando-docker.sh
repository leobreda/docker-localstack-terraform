#!/bin/sh

echo "\n\n=============================================="
echo "INSTALANDO DEPENDENCIAS..."
echo "----------------------------------------------"
apt-get update
apt-get -y unzip
apt-get -y install python3
apt-get -y install python3-pip
apt-get -y install libsasl2-dev

 

echo "\n\n=============================================="
echo "INSTALANDO DOCKER..."
echo "----------------------------------------------"
apt-get -y install docker-ce
apt-get -y install docker.io
apt-get -y install docker-compose


echo "\n\n=============================================="
echo  "INICIANDO O DOCKER..."
echo "----------------------------------------------"

systemctl start docker

echo "\n\n=============================================="
echo  "VERIFICANDO SE O DOCKER ESTÁ INICIANDO..."
echo "----------------------------------------------"
systemctl is-active docker

echo "\n\n=============================================="
echo  "INICIANDO O DOCKER NO START DO LINUX..."
echo "----------------------------------------------"
systemctl enable docker

echo "\n\n=============================================="
echo  "VERIFICANDO A VERSAO DO DOCKER..."
echo "----------------------------------------------"
docker --version

echo "\n\n\n "