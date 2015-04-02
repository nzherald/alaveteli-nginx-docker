FROM debian:jessie

# Install prerequisites
RUN apt-get update
RUN apt-get install -y nginx supervisor

# nginx.conf
ADD assets/conf/nginx-*.conf /usr/local/nginx/conf/

# supervisor.conf
ADD assets/conf/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 80

CMD ["/usr/bin/supervisord"]
