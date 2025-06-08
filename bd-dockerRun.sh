docker run -d ^
  --name oracle-db-container ^
  --network maisagua-net ^
  -p 1521:1521 ^
  -e ORACLE_PWD=1234 ^
  -v oracle_data:/opt/oracle/oradata ^
  -v C:\Users\Vinic\Documents\programacao\Fiap\GlobalSolutions\DevOps\BD\entrypoint.sh:/tmp/custom-entrypoint.sh ^
  -v C:\Users\Vinic\Documents\programacao\Fiap\GlobalSolutions\DevOps\BD\sql:/docker-entrypoint-initdb.d ^
  --entrypoint bash ^
  container-registry.oracle.com/database/express:21.3.0-xe ^
  -c "/tmp/custom-entrypoint.sh"