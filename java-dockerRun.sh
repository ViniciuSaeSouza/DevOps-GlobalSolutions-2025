docker run -d /
  --name maisagua-java-container /
  -p 8080:8080 /
  -e DB_USER=system /            
  -e DB_PASSWORD=1234 /          
  saesminerais/maisagua/java:1