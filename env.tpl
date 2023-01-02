### application.yml 环境变量
SERVER_PORT = 80 #容器内服务端口
RM_AUTH_USERNAME = admin #管理员用户名
RM_AUTH_PASSWORD = password #管理员密码

### docker-compose 用到的变量
EXTERNAL_SVC_PORT = 8989 #对外提供服务端口

### volumes dir
RDM_DATA_DIR = /srv/docker-volumes/redis-web-manager/data #RDM 数据存储目录映射
MYSQL_DIR = /srv/docker-volumes/redis-web-manager/mysql #mysql 存储目录映射
TEST_REDIS_DIR = /srv/docker-volumes/redis-web-manager/test-redis #test-redis 存储目录映射