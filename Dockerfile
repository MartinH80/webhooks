FROM alpine:3.21.3@sha256:a8560b36e8b8210634f77d9f7f9efd7ffa463e380b75e2e74aff4511df3ef88c

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
