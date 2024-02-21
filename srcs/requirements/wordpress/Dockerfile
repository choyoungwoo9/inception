# syntax=docker/dockerfile:1
FROM debian:bullseye-20240211

RUN apt update && apt upgrade -y \
    && apt install vim php7.4-fpm php7.4-mysqli wget -y \
    && sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/' /etc/php/7.4/fpm/pool.d/www.conf \
    && wget https://wordpress.org/wordpress-6.4.3.tar.gz \
    && tar -xzvf wordpress-6.4.3.tar.gz

COPY ./start.sh /
RUN chmod +x /start.sh

ENTRYPOINT ["/start.sh"]


CMD ["php-fpm7.4", "-F"]