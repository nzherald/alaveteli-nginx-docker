FROM debian:jessie

# Install prerequisites
RUN apt-get update
RUN apt-get install -y nginx supervisor

# nginx.conf
ADD assets/conf/nginx.conf /usr/local/nginx/conf/

# supervisor.conf
ADD assets/conf/supervisord.conf /etc/supervisor/conf.d/supervisord.conf


# make folders
RUN mkdir -p /var/www/html/fyi /var/log/supervisor

# add html
ADD assets/html/ /var/www/html/fyi/

EXPOSE 80

CMD ["/usr/bin/supervisord"]
