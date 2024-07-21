# replace busybox sendmail with msmtp
ln -sf /usr/bin/msmtp /usr/bin/sendmail
ln -sf /usr/bin/msmtp /usr/sbin/sendmail

# run Apache in foreground
/usr/sbin/httpd -DFOREGROUND