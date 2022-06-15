########################### Staging Stage Start from here
########## Set the base image for subsequent instructions
FROM egahmad/docker-php-laravel:7.4-apache-development as builder

RUN apt-get -y update --fix-missing --no-install-recommends

#Seupp laravel public folder
RUN sed -ri -e 's!/var/www/html!/var/www/html/public!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!/var/www/html/public!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

WORKDIR /var/www/html/
COPY . /var/www/html

RUN mkdir -p storage/framework/cache/data storage/framework/sessions storage/framework/testing storage/framework/views storage/app public

RUN chmod -R 777 storage public

# Copy scripts and entrypoint
COPY .cicd/sh/entrypoint /entrypoint
# Set execute flag for entrypoint
RUN chmod +x /entrypoint


FROM builder as development

ARG RUN_ID
ENV RUN_ID=$RUN_ID

WORKDIR /var/www/html/

COPY .env.development .env
RUN sed -ri -e "s!##RUN_ID##!D-01-${RUN_ID}!g" .env

COPY .cicd/php/php.ini-development /usr/local/etc/php/php.ini

EXPOSE 80
EXPOSE 443
EXPOSE 6001

# Launch Apache
CMD ["/usr/sbin/apache2ctl", "-DFOREGROUND"]

FROM egahmad/php7.4-laravel-apache-production as staging

RUN apt-get -y update --fix-missing --no-install-recommends

#Seupp laravel public folder
RUN sed -ri -e 's!/var/www/html!/var/www/html/public!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!/var/www/html/public!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

WORKDIR /var/www/html/
COPY . /var/www/html

RUN mkdir -p storage/framework/cache/data storage/framework/sessions storage/framework/testing storage/framework/views storage/app public

RUN chmod -R 777 storage public

# Copy scripts and entrypoint
COPY .cicd/sh/entrypoint /entrypoint
# Set execute flag for entrypoint
RUN chmod +x /entrypoint

WORKDIR /var/www/html/

COPY .env.production .env
COPY .cicd/php/php.ini-production /usr/local/etc/php/php.ini

EXPOSE 80
EXPOSE 443
EXPOSE 6001

# Launch Apache
CMD ["/usr/sbin/apache2ctl", "-DFOREGROUND"]

FROM staging as production

WORKDIR /var/www/html/

EXPOSE 80
EXPOSE 443
EXPOSE 6001

# Launch Apache
CMD ["/usr/sbin/apache2ctl", "-DFOREGROUND"]
