#!/bin/bash
echo "run init_mysql.sh"

echo "start change root password"
echo "DATASOURCE_PASSWORD:$DATASOURCE_PASSWORD"
echo "DATASOURCE_DATABASE:$DATASOURCE_DATABASE"
cp change_root_pwd.sql.tpl change_root_pwd.sql
cp check_is_exist_db.sql.tpl check_is_exist_db.sql
cp create_db.sql.tpl create_db.sql
sed -i "s/<ROOT_PASSWORD>/$DATASOURCE_PASSWORD/g" change_root_pwd.sql
sed -i "s/<DATASOURCE_DATABASE>/$DATASOURCE_DATABASE/g" check_is_exist_db.sql
sed -i "s/<DATASOURCE_DATABASE>/$DATASOURCE_DATABASE/g" create_db.sql

echo "stop mysql service"
service mysql stop
sleep 5
echo "start mysqld --skip-grant-tables"
mysqld --skip-grant-tables &
sleep 10

IS_EXIST_DB=`mysql < check_is_exist_db.sql | grep redis_manager | grep -v grep | wc -l`
echo "IS_EXIST_DB:$IS_EXIST_DB"
if [ $IS_EXIST_DB == 0 ];then
  echo "no exist db, run create db sql"
  mysql < create_db.sql
fi

echo "run change root pwd sql"
mysql < change_root_pwd.sql
echo "stop mysql service"
service mysql stop
sleep 5
echo "start mysql service"
usermod -d /var/lib/mysql/ mysql
service mysql start
