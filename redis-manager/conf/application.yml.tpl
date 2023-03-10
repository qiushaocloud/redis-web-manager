server:
  tomcat.uri-encoding: UTF-8
  compression:
    enabled: true
    mime-types:
      - image/png
      - image/jpeg
      - image/jpg
      - text/html
      - application/javascript
      - text/css
      - application/octet-stream
      - application/json
    min-response-size: 1024
  port: ${SERVER_PORT:<SERVER_PORT>}

eureka:
  server:
    enable-self-preservation: false
    eviction-interval-timer-in-ms: 10000
    max-threads-for-peer-replication: 0
  dashboard:
    path: /eureka-ui
  client:
    register-with-eureka: false
    fetch-registry: false

spring:
  devtools:
    restart:
      enabled: false
  freemarker:
    template-loader-path: classpath:/templates/
    prefer-file-system-access: false
  application:
    name: redis-manager
  resources:
    static-locations: classpath:/
  http:
    encoding:
      enabled: true
      charset: UTF-8
  datasource:
    # 必填，与数据库同名
    database: ${DATASOURCE_DATABASE:<DATASOURCE_DATABASE>}
    driver-class-name: com.mysql.cj.jdbc.Driver
    url: ${DATASOURCE_URL:jdbc:mysql://<DATASOURCE_ADDR>/redis_manager?useUnicode=true&characterEncoding=utf-8&serverTimezone=GMT%2B8}
    username: ${DATASOURCE_USERNAME:<DATASOURCE_USERNAME>}
    password: ${DATASOURCE_PASSWORD:<DATASOURCE_PASSWORD>}
    #hikari数据库连接池
    hikari:
      pool-name: redis-manager-hikaricp
      # 最小空闲连接数量
      minimum-idle: 10
      # 空闲连接存活最大时间，默认600000（10分钟）
      idle-timeout: 180000
      # 连接池最大连接数，默认是10
      maximum-pool-size: 50
      # 此属性控制从池返回的连接的默认自动提交行为,默认值：true
      auto-commit: true
      # 此属性控制池中连接的最长生命周期，值0表示无限生命周期，默认1800000即30分钟
      max-lifetime: 600000
      # 数据库连接超时时间,默认30秒，即30000
      connection-timeout: 30000
      connection-test-query: 'SELECT 1'
mybatis:
  configuration:
    mapUnderscoreToCamelCase: true


# http://download.redis.io/releases/
# redis manager configuration
redis-manager:
  auth:
    user-name: ${RM_AUTH_USERNAME:<RM_AUTH_USERNAME>}
    password: ${RM_AUTH_PASSWORD:<RM_AUTH_PASSWORD>}
    # avatar(absolute director)
    avatar-path: /data/avatar/
    authorization:
      enabled: false
      company-name: <RM_AUTH_COMPANY_NAME>
      server: <RM_AUTH_SERVER>
      site-key: <RM_AUTH_SITE_KEY>
      site-secret: <RM_AUTH_SITE_SECRET>
  # monitor configuration
  monitor:
    # 数据保存天数，1-30天, default: 15
    data-keep-days: 15
    # slow log limit of one node, default: 20
    slow-log-limit: 100
  # installation configuration
  installation:
    # 当前主机的 ip，非必须填写，如果使用集群安装无法获取主机IP导致无法安装，请在此填写
    current-host: <CURRENT_HOST>
    # redis.conf(absolute director)
    conf-path: /data/conf/
    # physics machine
    machine:
      # redis package(absolute director)
      package-path: /data/machine/
    # docker
    docker:
      # 默认从官方镜像库拉取
      images: redis:4.0.10,redis:4.0.14,redis:5.0.5
      docker-host: tcp://%s:2375
    humpback:
      enabled: false
      images: redis:4.0.10,redis:4.0.14,redis:5.0.5
      humpback-host: http://%s:8500/dockerapi/v2/
  alert:
    data-keep-days: 15
  rct:
    email:
      smtp:
      from-name:
      user-name:
      password:
      subject: Redis Analyze Report
    dev:
      enable: false
      rdb:
        port: 9002

logging:
  level:
    com:
      netflix:
        eureka: OFF
        discovery: OFF
