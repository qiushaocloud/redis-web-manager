#redis-web-manager

### introduce
> **Redis Manager** is a one-stop Redis management platform that supports cluster (cluster, master-replica, sentinel) monitoring, installation (except sentinel), management, alarm and basic data operation functions
**Cluster Monitoring**: Supports monitoring of important Redis indicators such as Memory and Clients; real-time viewing of Redis Info, Redis Config and Slow Log
**Cluster Creation**: Supports Docker, Machine, Humpback methods
**Cluster management**: support node Forget, Replicate Of, Failover, Move Slot, Start, Stop, Restart, Delete, modify configuration and other functions
**Cluster alarm**: Support indicators such as Memory and Clients (same as monitoring indicators), support email, enterprise WeChat APP, enterprise WeChat Webhook, DingTalk alarm
**Toolbox**: supports Query, Scan and basic data operations

### Solemnly declare
* Redis one-stop management platform, supports cluster monitoring, installation, management, alarm and basic data operations
* Based on redis-manager (https://github.com/ngbdf/redis-manager) secondary packaging

### Instructions for use

1. Execute the command to grant permission to execute the script: `sed -i -e 's/\r$//' *.sh && chmod -R 755 *.sh`
2. Execute `copy env.tpl .env`, and configure .env
3. Run ./run-docker.sh [Note: The lower version of docker-compose cannot recognize .env and needs to be upgraded. The version used by the author is: 1.29.2]
4. Check the log: docker logs qiushao-redis-web-manager


### Docker container start

[Dockerhub](https://hub.docker.com/repository/docker/reasonduan/redis-manager)

```
$ sudo docker run -d --net=host --name redis-manager \
-e DATASOURCE_DATABASE='redis_manager' \
-e DATASOURCE_URL='jdbc:mysql://127.0.0.1:3306/redis_manager?useUnicode=true&characterEncoding=utf-8&serverTimezone=GMT%2b8' \
-e DATASOURCE_USERNAME='root' \
-e DATASOURCE_PASSWORD='******' \
reasonduan/redis-manager
```

### Contact [Original Author]
> If you encounter problems or find areas for improvement during the use of the product, you can directly contact us or Pull Request in the following ways.

Redis Manager DingTalk Exchange Group

[![img](https://githubcdn.qiushaocloud.top/gh/qiushaocloud-cdn/cdn_static@master/uPic/2023-01-02/13-50/dingding_3gVeXg.jpg)](https://github. com/ngbdf/redis-manager/blob/master/documents/contact/dingding.jpg)

Know the column https://zhuanlan.zhihu.com/c_1055846842708930560

Yunqi Community https://yq.aliyun.com/album/227?spm=a2c4e.11155435.0.0.3ece24f0lQw15C

### Product main function introduction
#### Dashboard

> Show all clusters monitored by the current user group

[![img](https://githubcdn.qiushaocloud.top/gh/qiushaocloud-cdn/cdn_static@master/uPic/2023-01-02/13-50/index_6GoZ7Z.png)](https://github. com/ngbdf/redis-manager/blob/master/documents/images/index.png)

#### Cluster import

> Import an existing cluster

[![img](https://githubcdn.qiushaocloud.top/gh/qiushaocloud-cdn/cdn_static@master/uPic/2023-01-02/13-50/import-cluster_XgqWvC.png)](https:// github.com/ngbdf/redis-manager/blob/master/documents/images/import-cluster.png)

#### Cluster Monitoring

> Monitor important Redis indicators such as Memory and Clients; query Slow Log

[![img](https://github.com/ngbdf/redis-manager/raw/master/documents/images/monitor.png)](https://github.com/ngbdf/redis-manager/blob/ master/documents/images/monitor.png)

#### Cluster Management

> Support node Forget, Replicate Of, Failover, Move Slot, Start, Stop, Restart, Delete, modify configuration and other functions

[![img](https://githubcdn.qiushaocloud.top/gh/qiushaocloud-cdn/cdn_static@master/uPic/2023-01-02/13-50/node-manage_emOJTo.png)](https:// github.com/ngbdf/redis-manager/blob/master/documents/images/node-manage.png)

> modify configuration file

[![img](https://githubcdn.qiushaocloud.top/gh/qiushaocloud-cdn/cdn_static@master/uPic/2023-01-02/13-50/edit-config_wJ714k.png)](https:// github.com/ngbdf/redis-manager/blob/master/documents/images/edit-config.png)

#### Cluster Alerts

> Support email, enterprise WeChat APP, enterprise WeChat Webhook, DingTalk alarm

[![img](https://githubcdn.qiushaocloud.top/gh/qiushaocloud-cdn/cdn_static@master/uPic/2023-01-02/13-50/cluster-rule_Cj6Hua.png)](https:// github.com/ngbdf/redis-manager/blob/master/documents/images/alert-manage/cluster-rule.png)

[![img](https://githubcdn.qiushaocloud.top/gh/qiushaocloud-cdn/cdn_static@master/uPic/2023-01-02/13-50/cluster-channel_hu9jTR.png)](https:// github.com/ngbdf/redis-manager/blob/master/documents/images/alert-manage/cluster-channel.png)

#### Data manipulation

> Support simple data manipulation

[![img](https://githubcdn.qiushaocloud.top/gh/qiushaocloud-cdn/cdn_static@master/uPic/2023-01-02/13-50/data-operation_RhS1Oy.png)](https:// github.com/ngbdf/redis-manager/blob/master/documents/images/data-operation.png)

#### Create cluster

> Currently supports the creation of Redis Cluster and Standalone modes, including machine installation, Docker installation and Humpback installation

[![img](https://github.com/ngbdf/redis-manager/raw/master/documents/images/installation/cluster-docker-auto.png)](https://github.com/ngbdf/ redis-manager/blob/master/documents/images/installation/cluster-docker-auto.png)

#### User Group Management

[![img](https://githubcdn.qiushaocloud.top/gh/qiushaocloud-cdn/cdn_static@master/uPic/2023-01-02/13-50/group-manage_HOfqPL.png)](https:// github.com/ngbdf/redis-manager/blob/master/documents/images/group-manage.png)

#### User Management

[![img](https://githubcdn.qiushaocloud.top/gh/qiushaocloud-cdn/cdn_static@master/uPic/2023-01-02/13-50/user-manage_4Vm8v3.png)](https:// github.com/ngbdf/redis-manager/blob/master/documents/images/user-manage/user-manage.png)

#### User Manual

> The user manual mainly introduces how to use Redis Manager

* [Quick Start](https://github.com/ngbdf/redis-manager/wiki/2.x-Quick Start)
* [Import an existing cluster](https://github.com/ngbdf/redis-manager/wiki/2.x-Import an existing cluster)
* [Cluster Monitoring](https://github.com/ngbdf/redis-manager/wiki/2.x-cluster monitoring)
* [Node Management](https://github.com/ngbdf/redis-manager/wiki/2.x-node management)
* [Data Operation](https://github.com/ngbdf/redis-manager/wiki/2.x-Data Operation)
* [Cluster Alarm](https://github.com/ngbdf/redis-manager/wiki/2.x-Cluster Alarm)
* [Machine Management](https://github.com/ngbdf/redis-manager/wiki/2.x-Machine Management)
* [Cluster installation](https://github.com/ngbdf/redis-manager/wiki/2.x-cluster installation)
* [groups and users](https://github.c