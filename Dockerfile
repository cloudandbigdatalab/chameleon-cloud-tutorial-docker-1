FROM ubuntu
 
MAINTAINER shawnmaten@gmail.com
 
RUN apt-get update
 
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y nginx git
 
RUN git clone https://github.com/cloudandbigdatalab/chameleon-docker-nginx.git
 
RUN mv /chameleon-docker-nginx/demosite /etc/nginx/sites-available/ && ln -s /etc/nginx/sites-available/demosite /etc/nginx/sites-enabled

RUN echo "129.114.34.119 host" >> /etc/hosts
 
CMD service nginx start
