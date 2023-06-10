#!/bin/sh

echo "\n\n=============================================="
echo "INSTALANDO LOCALSTACK VIA PIP..."
echo "----------------------------------------------"
python3 -m pip install localstack

echo "\n\n=============================================="
echo  "VERIFICANDO A VERSAO DO LOCALSTACK..."
echo "----------------------------------------------"
localstack --version
