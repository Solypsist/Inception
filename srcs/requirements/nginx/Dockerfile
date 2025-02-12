# Pulling Debian
# Versions https://www.debian.org/releases/
# 12.0 Bookworm (Stable)
# 11.7 Bullseye (Penultimate)
FROM debian:bullseye-slim

# Install nginx
RUN apt-get update
RUN apt-get install -y \
            openssl \
			netcat \
            nginx

# Setting up TLSv1.3
# -x509   Generate Selfsigned certificate
# -nodes  No password encryption
# -days   Duration
# -newkey Generate 2048 bit key with RSA encryption algorithm 
# -keyout Key location
# -out    Certificate location
# -subj   Subject Distinguised Name

RUN mkdir /etc/nginx/ssl \
    &&  openssl req -x509 \
                    -nodes \
                    -days   365 \
                    -newkey rsa:2048 \
                    -keyout /etc/nginx/ssl/private.key \
                    -out    /etc/nginx/ssl/certificate.crt \
                    -subj   "/C=NL/ST=ZH/L=AMS/O=CODAM/OU=Student/CN=abarteld.42.fr"


RUN  mkdir -p /run/nginx
# Import
COPY	conf/nginx.conf	/etc/nginx/sites-enabled/nginx.conf

# Configure
# EXPOSE 443
EXPOSE 44003
# HEALTHCHECK


# Boot
CMD ["nginx", "-g", "daemon off;"]