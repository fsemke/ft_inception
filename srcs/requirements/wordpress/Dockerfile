FROM alpine:3.17.5

EXPOSE 9000

RUN apk update && apk add --no-cache php81 php-fpm php-common php-json php-session php-mysqli php81-phar mariadb-client php81-iconv php81-mbstring curl

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

RUN adduser -S www-data && adduser www-data www-data

# Copy Config file
COPY ./conf/www.conf /etc/php81/php-fpm.d/www.conf
RUN mkdir -p /var/www/wordpress
COPY ./tools/tool.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/tool.sh

ENTRYPOINT ["/usr/local/bin/tool.sh"]

WORKDIR /var/www/wordpress
CMD ["/usr/sbin/php-fpm81", "-F"]
