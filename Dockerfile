########################### Staging Stage Start from here
########## Set the base image for subsequent instructions
FROM bitnami/php-fpm:8.1 as development

COPY .env.example .env
#RUN sed -ri -e "s!##TNT_HOST##!${TNT_HOST}!g" .env

WORKDIR /app
COPY --chown=www-data:www-data . /app

# @:TODO remove all .cicd files

RUN mkdir -p storage/framework/cache/data storage/framework/sessions storage/framework/testing storage/framework/views storage/app public

RUN chmod -R 777 storage public

# Expose Nginx
RUN apt-get update -y && apt-get install -y nginx nano

ADD .cicd/nginx/nginx-site.conf /etc/nginx/sites-enabled/default
ADD .cicd/scripts/entrypoint.sh /etc/entrypoint.sh
RUN chmod +x /etc/entrypoint.sh

RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

#RUN apt-get install -y cron
#ADD .cicd/schedule/crontab /etc/cron.d/cron
#RUN chmod 0644 /etc/cron.d/cron

#RUN crontab /etc/cron.d/cron

#RUN touch /var/log/cron.log


#RUN touch /var/log/worker.log

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
ENTRYPOINT ["sh", "/etc/entrypoint.sh"]

########################### Production Stage Start from here
########## Set the base image for subsequent instructions
FROM bitnami/php-fpm:8.1 as production

#RUN git config --global user.name "${GITHUB_USER}"
#RUN git config --global user.password "${GITHUB_PASSWORD}"

WORKDIR /app/
COPY --chown=www-data:www-data . /app

# @:TODO remove all .cicd files

RUN mkdir -p storage/framework/cache/data
RUN mkdir -p storage/framework/sessions
RUN mkdir -p storage/framework/testing
RUN mkdir -p storage/framework/views
RUN mkdir -p storage/app

RUN useradd -G www-data,root -u 1000 -d /home/devuser devuser
RUN chmod -R 777 /app/storage
RUN chmod -R 777 /app/public
RUN chmod -R 777 /app/resources/lang

# Copy scripts and entrypoint
#COPY .cicd/scripts/entrypoint /entrypoint

# Copy php.ini
#COPY .cicd/data/php/php.ini-development /usr/local/etc/php/php.ini

# Set execute flag for entrypoint
#RUN chmod +x /entrypoint

# Expose Apache
RUN apt-get update -y \
    && apt-get install -y nginx nano

COPY .cicd/nginx/nginx-site.conf /etc/nginx/sites-enabled/default
COPY .cicd/scripts/entrypoint.sh /etc/entrypoint.sh

RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

RUN chmod u+x /etc/entrypoint.sh

WORKDIR /app
EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
ENTRYPOINT ["sh","/etc/entrypoint.sh"]
