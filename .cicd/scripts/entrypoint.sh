#!/bin/sh
#Change CRLF to LF
#service nginx start
#php-fpm -F --pid /opt/bitnami/php/tmp/php-fpm.pid -y /opt/bitnami/php/etc/php-fpm.conf

# Launch nginx
#nginx -g "daemon off;"


printf "\n\nStarting PHP 7.0 daemon...\n\n"
php-fpm --pid /opt/bitnami/php/tmp/php-fpm.pid -y /opt/bitnami/php/etc/php-fpm.conf

printf "Starting Nginx...\n\n"
nginx -g "daemon off;"

printf "Starting cron...\n\n"

cron
