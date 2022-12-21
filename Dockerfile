FROM mysql:8.0.31-debian

ENV MYSQL_ROOT_PASSWORD="root"

COPY schema.sql /docker-entrypoint-initdb.d/
