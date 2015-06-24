FROM ubuntu
 
MAINTAINER shawnmaten@gmail.com
 
RUN apt-get update 

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y python-dev 
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y python-pip 
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y python-psycopg2

RUN pip install uwsgi 
RUN pip install psycopg2
RUN pip install yattag
RUN pip install markdown

EXPOSE 3031

COPY demosite.ini demosite.py description.md /chameleon-docker-uwsgi/
 
CMD /usr/local/bin/uwsgi --ini /chameleon-docker-uwsgi/demosite.ini
