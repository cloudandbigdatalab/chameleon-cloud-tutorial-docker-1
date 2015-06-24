FROM ubuntu
 
MAINTAINER shawnmaten@gmail.com
 
RUN apt-get update
 
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y python-dev python-pip git

RUN pip install uwsgi
 
RUN git clone https://github.com/cloudandbigdatalab/chameleon-docker-uwsgi.git
 
CMD /usr/local/bin/uwsgi --ini /chameleon-docker-uwsgi/demosite.ini
