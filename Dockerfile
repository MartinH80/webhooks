FROM alpine:3.20.1@sha256:b89d9c93e9ed3597455c90a0b88a8bbb5cb7188438f70953fede212a0c4394e0

MAINTAINER MartinHerrman martin@herrman.nl

WORKDIR /

# update
RUN apk update
RUN apk upgrade

# install apache and php
RUN apk add php83-apache2

# install msmtp and mailx to allow PHP to send mail
RUN apk add msmtp
RUN apk add mailx

# Copy webhooks file
COPY webhooks.php /var/www/localhost/htdocs/webhooks.php

# Expose port 80 for apache webserver
EXPOSE 80

# copy startup script
ADD startup.sh /startup.sh

# Execute startup script
CMD ["/bin/sh","-c","/startup.sh"]