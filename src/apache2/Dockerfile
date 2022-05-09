FROM httpd:2.4-alpine
ARG SORMAS_SERVER_URL

RUN apk update --no-cache && \
    apk upgrade --no-cache && \
    apk add --no-cache --upgrade tzdata openssl curl bash
RUN mkdir -p /var/log/apache2/ \
  && mkdir /usr/local/apache2/conf.d/ \
  && chown -R www-data:www-data /var/log/apache2/

COPY ./vhost.conf.sh /tmp/vhost.conf.sh
COPY ./httpd.conf /usr/local/apache2/conf/httpd.conf
RUN chmod +x /tmp/vhost.conf.sh



ENTRYPOINT ["/tmp/vhost.conf.sh"]
CMD ["/usr/local/apache2/bin/httpd","-D","FOREGROUND"]
