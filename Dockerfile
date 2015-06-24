FROM ubuntu
 
MAINTAINER shawnmaten@gmail.com
 
RUN apt-get update
 
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y nginx
 
RUN git clone https://gist.github.com/547b284a9fa34ba0b5c9.git && cd /chameleon-docker-nginx
 
RUN mv demosite /etc/nginx/sites-available/ && ln -s /etc/nginx/sites-available/demosite /etc/nginx/sites-enabled

RUN echo "129.114.34.119 host" >> /etc/hosts
 
CMD service nginx start
