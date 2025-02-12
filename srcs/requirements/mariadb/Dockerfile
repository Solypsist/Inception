# Pulling Debian
# Versions https://www.debian.org/releases/
# 12.0 Bookworm (Stable)
# 11.7 Bullseye (Penultimate)
FROM debian:bullseye-slim

# Install mariadb
RUN apt-get update
RUN apt-get install -y \
            mariadb-server \
            mariadb-client \
            gettext-base

# Import

COPY conf/mariadb.conf /etc/mysql/mariadb.cnf
RUN  chmod 664         /etc/mysql/mariadb.cnf

COPY tools/mariadb_setup.sh /usr/local/bin/mariadb_setup.sh
COPY tools/mariadb_init.sql /usr/local/bin/mariadb_init.sql
RUN  chmod +r               /usr/local/bin/mariadb_init.sql
RUN  chmod +x               /usr/local/bin/mariadb_setup.sh


# RUN mkdir -p /run/nginx

# Configure
EXPOSE 3306
# HEALTHCHECK

# Boot
ENTRYPOINT ["/usr/local/bin/mariadb_setup.sh"]
CMD ["mariadbd"]
# CMD ["tail", "-f", "/dev/null"]