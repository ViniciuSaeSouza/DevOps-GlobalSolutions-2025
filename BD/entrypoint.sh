#!/bin/bash

set -e

/opt/oracle/runOracle.sh "$@" &

echo "Esperando bd carregar..."

until sqlplus -S system/1234@//localhost:1521/XEPDB1 <<< "SELECT 1 FROM DUAL;" > /dev/null 2>&1; do
  echo "Aguardando Oracle DB..."
  sleep 5
done
echo "Banco de dados carregado!."
echo "Aguardando um pouco mais para estabilização do listener..."
sleep 15

echo "Criando tabelas do modelo físico..."
sqlplus system/1234@//localhost:1521/XEPDB1 @/docker-entrypoint-initdb.d/modelo_fisico.sql
sleep 3
echo "Tabelas criadas!"

echo "Fazendo os inserts nas tabelas..."
sqlplus system/1234@//localhost:1521/XEPDB1 @/docker-entrypoint-initdb.d/inserts.sql
sleep 3
echo "Inserts feitos!"

echo "Script Sql executado com sucesso!."

wait $!