# Pulling Debian
# Versions https://www.debian.org/releases/
# 12.0 Bookworm (Stable)
# 11.7 Bullseye (Penultimate)
FROM debian:bullseye-slim

# Install wordpress
RUN     apt-get update
RUN		apt-get install -y --fix-missing \
			wget \
			php7.4 \
			php7.4-fpm \
			php7.4-mysqli \
			mariadb-client \
			apt-utils \
			gettext-base \
			# netcat \
	&&	apt-get clean \
	&&	rm -rf /var/lib/apt/lists/*

# Import
RUN  mkdir -p /run/php

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

# COPY ./tools/index.php /var/www/html/index.txt
# RUN  chmod 777         /var/www/html/index.txt
# COPY ./tools/php.sh    /usr/local/bin/php.sh
# RUN  chmod +x          /usr/local/bin/php.sh


COPY tools/wordpress_setup.sh /usr/local/bin/wordpress_setup.sh
RUN  chmod +x                 /usr/local/bin/wordpress_setup.sh

COPY tools/add_post.sql	/usr/local/bin/add_post.sql
RUN  chmod +r	/usr/local/bin/add_post.sql

# COPY ./tools/create_wordpress.sh /usr/local/bin/
# RUN  chmod +x /usr/local/bin/create_wordpress.sh

# Configure
WORKDIR /var/www/html
EXPOSE  9000
# HEALTHCHECK	

# Boot
ENTRYPOINT	["/usr/local/bin/wordpress_setup.sh"]
# ENTRYPOINT	["/usr/local/bin/create_wordpress.sh"]
# ENTRYPOINT	["/usr/local/bin/php.sh"]
CMD ["php-fpm7.4", "-F"]
# CMD ["tail", "-f", "/dev/null"]
