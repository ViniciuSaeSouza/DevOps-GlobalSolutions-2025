FROM container-registry.oracle.com/database/express:21.3.0-xe

COPY ./sql /docker-entrypoint-initdb.d/

COPY entrypoint.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT [ "entrypoint.sh" ]