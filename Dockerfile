FROM php:7.3.1-cli-stretch

RUN apt-get update && apt-get install -y unzip git vim ranger software-properties-common ca-certificates apt-transport-https
WORKDIR /root
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php
RUN rm composer-setup.php
RUN cp composer.phar /usr/bin/composer
RUN sudo apt-get install -y libpng-dev
RUN docker-php-ext-install gd
RUN composer create-project apigee/devportal-kickstart-project:8.x-dev myPortal --stability dev --no-interaction

WORKDIR /root/myPortal
RUN apt-get install -y nginx

ADD nginx.conf /etc/nginx/nginx.conf
ADD run.sh /root/run.sh

CMD "/root/run.sh"
