FROM ubuntu:14.04

ENV DEBIAN_FRONTEND=noninteractive

# Install Nginx.
RUN \
  apt-get update && \
  apt-get install -y \
                openssl \ 
		nginx && \
  rm -rf /var/lib/apt/lists/* && \
  echo "\ndaemon off;" >> /etc/nginx/nginx.conf && \
  chown -R www-data:www-data /var/lib/nginx && \
  mkdir -p /usr/share/nginx/html/logs && \
  mkdir -p /etc/nginx/ssl && \
  openssl req -batch -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt 

#COPY web.conf /etc/nginx/conf.d/
COPY tomee.conf /etc/nginx/conf.d/

# Define mountable directories.
VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/var/www/html", "/usr/share/nginx/html/logs"]

# Define working directory.
WORKDIR /etc/nginx


# Define default command.
CMD ["nginx"]

# Expose ports.
EXPOSE 8080
EXPOSE 10443
EXPOSE 10080
