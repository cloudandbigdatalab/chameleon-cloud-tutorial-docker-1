FROM ubuntu
 
MAINTAINER shawnmaten@gmail.com
 
RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y python-dev python-pip

RUN pip install uwsgi

RUN mkdir /chameleon-docker-uwsgi

COPY demosite.ini demosite.py /chameleon-docker-uwsgi
 
CMD /usr/local/bin/uwsgi --ini /chameleon-docker-uwsgi/demosite.ini
