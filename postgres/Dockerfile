FROM ubuntu

MAINTAINER shawnmaten@gmail.com

RUN apt-get update

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y postgresql

USER postgres

RUN /etc/init.d/postgresql start &&\
    psql --command "CREATE USER docker WITH SUPERUSER PASSWORD 'docker';" &&\
    createdb -O docker docker

RUN cd /etc/postgresql/*/main/ && echo "host all all 0.0.0.0/0 md5" >> pg_hba.conf

RUN cd /etc/postgresql/*/main/ && echo "listen_addresses='*'" >> postgresql.conf

EXPOSE 5432

CMD ["/usr/lib/postgresql/*/bin/postgres", "-D", "/var/lib/postgresql/*/main", "-c", "config_file=/etc/postgresql/*/main/postgresql.conf"]
