#!/bin/bash

echo "start service"

echo "start init application yml"
cd /app/redis-manager/conf
./init_application_yml.sh
echo "finsh init application yml"

echo "start redis service"
if [ ! -f $TEST_REDIS_PASSWORD ]; then
    echo "need set test redis password"
    sed -i "s/^requirepass.*/requirepass $TEST_REDIS_PASSWORD/g" /etc/redis/redis.conf
fi
# service redis-server start
/usr/bin/redis-server /etc/redis/redis.conf &
echo "finsh redis service"

echo "start mysql service"
cd /app/mysql
./init_mysql.sh
echo "finsh mysql service"

sleep 5

echo "satrt redis-manager"
cd /app/redis-manager
./bin/start.sh
sleep 10
tail -f logs/*.log
echo "finsh redis-manager"
