FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Shanghai
ENV SERVER_PORT 8989
ENV DATASOURCE_DATABASE redis_manager
ENV DATASOURCE_ADDR localhost:3306
ENV DATASOURCE_USERNAME root
ENV DATASOURCE_PASSWORD rootmysqlpassword
ENV RM_AUTH_USERNAME admin
ENV RM_AUTH_PASSWORD rmpassword
ENV RM_AUTH_COMPANY_NAME define_company_name
ENV RM_AUTH_SERVER define_server
ENV RM_AUTH_SITE_KEY define_site_key
ENV RM_AUTH_SITE_SECRET define_site_secret
ENV CURRENT_HOST ''

RUN apt update
RUN apt install -y sudo 
RUN sudo apt install -y apt-utils
RUN sudo apt install -y procps lsof net-tools lsb-release curl wget lrzsz iputils-ping
RUN sudo apt install -y vim
RUN sudo apt install -y mysql-server --fix-missing --fix-broken
RUN sudo apt install -y openjdk-8-jre-headless
RUN sudo apt install -y redis-server

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
    && rm -rf /app/mysql/create_db.sql \
    && echo "set encoding=utf-8" >> /root/.vimrc

RUN mv /var/lib/mysql /var/lib/mysql.bak

RUN sed -i "s/^bind 127.0.0.1/#bind 127.0.0.1/" /etc/redis/redis.conf \
    && sed -i "s/^protected-mode yes/protected-mode no/" /etc/redis/redis.conf \
    && sed -i "s/^# requirepass foobared/requirepass rootredispassword/" /etc/redis/redis.conf \
    && sed -i "s/bind-address/bind-address = 0.0.0.0 #/" /etc/mysql/mysql.conf.d/mysqld.cnf

### 可以映射的目录
#VOLUME ["/var/lib/mysql", "/data"]

EXPOSE 8989
WORKDIR /app

CMD ["/app/bootstrap.sh"]
