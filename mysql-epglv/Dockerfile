FROM mysql:latest

RUN mkdir -p /tmp/epglv/src
ADD epglv/* /tmp/epglv/
ADD epglv/src/* /tmp/epglv/src/
ADD setup_epglv.sh /tmp/
RUN /tmp/setup_epglv.sh


ADD mysqlepgd.cnf /etc/mysql/conf.d/
ADD mysql-first-time.sql /docker-entrypoint-initdb.d/
