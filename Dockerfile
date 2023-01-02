FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive
ENV TZ "Asia/Shanghai"
ENV SERVER_PORT 80
ENV DATASOURCE_DATABASE redis_manager
ENV DATASOURCE_ADDR localhost:3306
ENV DATASOURCE_USERNAME root
ENV DATASOURCE_PASSWORD password
ENV RM_AUTH_USERNAME admin
ENV RM_AUTH_PASSWORD password
ENV RM_AUTH_COMPANY_NAME define_company_name
ENV RM_AUTH_SERVER define_server
ENV RM_AUTH_SITE_KEY define_site_key
ENV RM_AUTH_SITE_SECRET define_site_secret
ENV CURRENT_HOST ''

RUN apt update
RUN apt install -y apt-utils
RUN apt install -y procps lsof vim net-tools lsb-release curl wget lrzsz iputils-ping
RUN apt install -y mysql-server --fix-missing --fix-broken
RUN apt install -y openjdk-8-jre-headless
RUN apt install -y redis-server

COPY ./redis-manager /app/redis-manager
COPY ./bootstrap.sh /app/bootstrap.sh
COPY ./mysql /app/mysql

RUN chmod 777 /app/bootstrap.sh \
    && chmod 777 /app/mysql/*.sh \
    && chmod 777 /app/redis-manager/bin/*.sh \
    && chmod 777 /app/redis-manager/conf/*.sh \
    && rm -rf /app/redis-manager/conf/application.yml \
    && rm -rf /app/mysql/change_root_pwd.sql \
    && rm -rf /app/mysql/check_is_exist_db.sql \
    && rm -rf /app/mysql/create_db.sql

RUN mv /var/lib/mysql /var/lib/mysql.bak

RUN sed -i "s/^bind 127.0.0.1/bind 0.0.0.0 #/" /etc/redis/redis.conf \
    && sed -i "s/bind-address/bind-address = 0.0.0.0 #/" /etc/mysql/mysql.conf.d/mysqld.cnf

### 可以映射的目录
#VOLUME ["/var/lib/mysql", "/data"]

CMD ["/app/bootstrap.sh"]
