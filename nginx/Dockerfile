FROM ubuntu
 
MAINTAINER shawnmaten@gmail.com
 
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y nginx

COPY demosite /etc/nginx/sites-available/
 
RUN ln -s /etc/nginx/sites-available/demosite /etc/nginx/sites-enabled

RUN echo "daemon off;" >> /etc/nginx/nginx.conf
 
CMD /usr/sbin/nginx
