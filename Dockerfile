FROM alpine:3.20.3@sha256:1e42bbe2508154c9126d48c2b8a75420c3544343bf86fd041fb7527e017a4b4a

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
