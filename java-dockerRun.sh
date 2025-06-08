docker run -d \
  --name maisagua-java-container \
  --network maisagua-net \
  -p 8080:8080 \
  -e DB_USERNAME=system \
  -e DB_PASSWORD=1234 \
  saesminerais/maisagua-java:latest