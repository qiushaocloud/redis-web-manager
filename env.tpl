### application.yml 环境变量
SERVER_PORT = 8989 #容器内服务端口
RM_AUTH_USERNAME = admin #管理员用户名
RM_AUTH_PASSWORD = rmpassword #管理员密码
DATASOURCE_ADDR = localhost:3306 # mysql 连接地址
DATASOURCE_USERNAME = root # mysql 用户名
DATASOURCE_PASSWORD = rootmysqlpassword # mysql 密码
TEST_REDIS_PASSWORD = redispassword # 测试 redis 密码

### docker-compose 用到的变量
EXTERNAL_SVC_PORT = 8989 #对外提供服务端口
EXTERNAL_MYSQL_PORT = 8988 #对外 mysql 端口
EXTERNAL_TEST_REDIS_PORT = 8987 #对外 test redis 端口

### volumes dir
RDM_DATA_DIR = /srv/docker-volumes/redis-web-manager/data #RDM 数据存储目录映射
MYSQL_DIR = /srv/docker-volumes/redis-web-manager/mysql #mysql 存储目录映射
TEST_REDIS_DIR = /srv/docker-volumes/redis-web-manager/test-redis #test-redis 存储目录映射