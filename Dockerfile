FROM tmaczukin/debian
MAINTAINER Tomasz Maczukin "tomasz@maczukin.pl"

# Install phpldapadmin
RUN apt-get install -y nginx-light php5-cli php5-fpm php5 phpldapadmin && apt-get clean

COPY assets/pla.nginx /etc/nginx/sites-available/default
COPY assets/pla.php5-fpm /etc/php5/fpm/pool.d/www.conf
COPY assets/init /usr/local/sbin/init
RUN chmod 700 /usr/local/sbin/init && chown root:root /usr/local/sbin/init

EXPOSE 80

ENTRYPOINT ["/usr/local/sbin/init"]
CMD ["start"]

