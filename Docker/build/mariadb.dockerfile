FROM mariadb:latest


# environment
ARG MYSQL_DATABASE_DUMP
ENV MYSQL_DATABASE_DUMP $MYSQL_DATABASE_DUMP

# copy db dump
ADD db/$MYSQL_DATABASE_DUMP /docker-entrypoint-initdb.d
