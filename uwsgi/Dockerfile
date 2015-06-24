FROM ubuntu
 
MAINTAINER shawnmaten@gmail.com
 
RUN apt-get update 

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y python-dev 
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y python-pip 
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y python-psycopg2

RUN pip install uwsgi 
RUN pip install psycopg2
RUN pip install yattag

RUN mkdir /chameleon-docker-uwsgi

COPY demosite.ini demosite.py description.md /chameleon-docker-uwsgi/

EXPOSE 3031
 
CMD /usr/local/bin/uwsgi --ini /chameleon-docker-uwsgi/demosite.ini
