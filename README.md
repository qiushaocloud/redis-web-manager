# redis-web-manager

### 介绍
> **Redis Manager** 是 Redis 一站式管理平台，支持集群（cluster、master-replica、sentinel）的监控、安装（除sentinel）、管理、告警以及基本的数据操作功能
**集群监控**：支持监控 Memory、Clients 等 Redis 重要指标；可实时查看 Redis Info、Redis Config 和 Slow Log
**集群创建**：支持 Docker、Machine、Humpback方式
**集群管理**：支持节点Forget、Replicate Of、Failover、Move Slot、Start、Stop、Restart、Delete、修改配置等功能
**集群告警**：支持 Memory、Clients 等指标(同监控指标)，支持邮件、企业微信APP、企业微信Webhook、钉钉告警
**工具箱**：支持 Query、Scan 以及基本的数据操作

### 郑重声明
* Redis 一站式管理平台，支持集群的监控、安装、管理、告警以及基本的数据操作
* 基于 redis-manager(https://github.com/ngbdf/redis-manager) 二次封装

### 使用说明

1.  执行命令授予执行脚本权限：`sed -i -e 's/\r$//' *.sh && chmod -R 755 *.sh`
2.  执行 `copy env.tpl .env`，并且配置 .env
3.  运行 ./run-docker.sh 【注：docker-compose 低版本识别不了 .env，需要进行升级，作者用的版本是: 1.29.2】
5.  查看日志: docker logs qiushao-redis-web-manager


### Docker容器启动

[Dockerhub](https://hub.docker.com/repository/docker/reasonduan/redis-manager)

```
$sudo docker run -d --net=host --name redis-manager  \
-e DATASOURCE_DATABASE='redis_manager' \
-e DATASOURCE_URL='jdbc:mysql://127.0.0.1:3306/redis_manager?useUnicode=true&characterEncoding=utf-8&serverTimezone=GMT%2b8' \
-e DATASOURCE_USERNAME='root' \
-e DATASOURCE_PASSWORD='******' \
reasonduan/redis-manager
```

### 联系方式【原作者】
> 您在使用产品的过程中如果遇到问题或者发现需要改进的地方可以通过以下方式直接联系我们或 Pull Request。

Redis Manager 钉钉交流群

[![img](https://githubcdn.qiushaocloud.top/gh/qiushaocloud-cdn/cdn_static@master/uPic/2023-01-02/13-50/dingding_3gVeXg.jpg)](https://github.com/ngbdf/redis-manager/blob/master/documents/contact/dingding.jpg)

知乎专栏 https://zhuanlan.zhihu.com/c_1055846842708930560

云栖社区 https://yq.aliyun.com/album/227?spm=a2c4e.11155435.0.0.3ece24f0lQw15C

### 产品主要功能介绍
#### Dashboard

> 展示当前用户组监控的所有集群

[![img](https://githubcdn.qiushaocloud.top/gh/qiushaocloud-cdn/cdn_static@master/uPic/2023-01-02/13-50/index_6GoZ7Z.png)](https://github.com/ngbdf/redis-manager/blob/master/documents/images/index.png)

#### 集群导入

> 导入已存在集群

[![img](https://githubcdn.qiushaocloud.top/gh/qiushaocloud-cdn/cdn_static@master/uPic/2023-01-02/13-50/import-cluster_XgqWvC.png)](https://github.com/ngbdf/redis-manager/blob/master/documents/images/import-cluster.png)

#### 集群监控

> 监控 Memory、Clients 等 Redis 重要指标; 查询 Slow Log

[![img](https://github.com/ngbdf/redis-manager/raw/master/documents/images/monitor.png)](https://github.com/ngbdf/redis-manager/blob/master/documents/images/monitor.png)

#### 集群管理

> 支持节点Forget、Replicate Of、Failover、Move Slot、Start、Stop、Restart、Delete、修改配置等功能

[![img](https://githubcdn.qiushaocloud.top/gh/qiushaocloud-cdn/cdn_static@master/uPic/2023-01-02/13-50/node-manage_emOJTo.png)](https://github.com/ngbdf/redis-manager/blob/master/documents/images/node-manage.png)

> 修改配置文件

[![img](https://githubcdn.qiushaocloud.top/gh/qiushaocloud-cdn/cdn_static@master/uPic/2023-01-02/13-50/edit-config_wJ714k.png)](https://github.com/ngbdf/redis-manager/blob/master/documents/images/edit-config.png)

#### 集群告警

> 支持邮件、企业微信APP、企业微信Webhook、钉钉告警

[![img](https://githubcdn.qiushaocloud.top/gh/qiushaocloud-cdn/cdn_static@master/uPic/2023-01-02/13-50/cluster-rule_Cj6Hua.png)](https://github.com/ngbdf/redis-manager/blob/master/documents/images/alert-manage/cluster-rule.png)

[![img](https://githubcdn.qiushaocloud.top/gh/qiushaocloud-cdn/cdn_static@master/uPic/2023-01-02/13-50/cluster-channel_hu9jTR.png)](https://github.com/ngbdf/redis-manager/blob/master/documents/images/alert-manage/cluster-channel.png)

#### 数据操作

> 支持简单的数据操作

[![img](https://githubcdn.qiushaocloud.top/gh/qiushaocloud-cdn/cdn_static@master/uPic/2023-01-02/13-50/data-operation_RhS1Oy.png)](https://github.com/ngbdf/redis-manager/blob/master/documents/images/data-operation.png)

#### 创建集群

> 目前支持 Redis Cluster、Standalone 模式的创建，包括机器安装、Docker 安装和 Humpback 安装方式

[![img](https://github.com/ngbdf/redis-manager/raw/master/documents/images/installation/cluster-docker-auto.png)](https://github.com/ngbdf/redis-manager/blob/master/documents/images/installation/cluster-docker-auto.png)

#### 用户组管理

[![img](https://githubcdn.qiushaocloud.top/gh/qiushaocloud-cdn/cdn_static@master/uPic/2023-01-02/13-50/group-manage_HOfqPL.png)](https://github.com/ngbdf/redis-manager/blob/master/documents/images/group-manage.png)

#### 用户管理

[![img](https://githubcdn.qiushaocloud.top/gh/qiushaocloud-cdn/cdn_static@master/uPic/2023-01-02/13-50/user-manage_4Vm8v3.png)](https://github.com/ngbdf/redis-manager/blob/master/documents/images/user-manage/user-manage.png)

#### 用户手册

> 用户手册主要介绍如何使用 Redis Manager

* [快速启动](https://github.com/ngbdf/redis-manager/wiki/2.x-快速启动)
* [导入已存在集群](https://github.com/ngbdf/redis-manager/wiki/2.x-导入已存在的集群)
* [集群监控](https://github.com/ngbdf/redis-manager/wiki/2.x-集群监控)
* [节点管理](https://github.com/ngbdf/redis-manager/wiki/2.x-节点管理)
* [数据操作](https://github.com/ngbdf/redis-manager/wiki/2.x-数据操作)
* [集群告警](https://github.com/ngbdf/redis-manager/wiki/2.x-集群告警)
* [机器管理](https://github.com/ngbdf/redis-manager/wiki/2.x-机器管理)
* [集群安装](https://github.com/ngbdf/redis-manager/wiki/2.x-集群安装)
* [组和用户](https://github.com/ngbdf/redis-manager/wiki/2.x-组和用户管理)


### License
RedisManager is Open Source software released under the [Apache 2.0 license](http://www.apache.org/licenses/LICENSE-2.0.html)


### 参与贡献

1.  Fork 本仓库
2.  新建 Feat_xxx 分支
3.  提交代码
4.  新建 Pull Request


### 开源不易，如果对您有帮助，请您动一动您的小手，给作者点 Star，也请您多多关注分享者「[邱少羽梦](https://www.qiushaocloud.top)」

* 分享者邮箱: [qiushaocloud@126.com](mailto:qiushaocloud@126.com)
* [分享者博客](https://www.qiushaocloud.top)
* [分享者自己搭建的 gitlab](https://gitlab.qiushaocloud.top/qiushaocloud) 
* [分享者 gitee](https://gitee.com/qiushaocloud/dashboard/projects) 
* [分享者 github](https://github.com/qiushaocloud?tab=repositories) 


### 版权信息公告:
* 此项目是基于 [ngbdf/redis-manager](https://github.com/ngbdf/redis-manager) 二次修改
* 以上内容大部分为原作者原创内容
* 如果大家喜欢，请支持 [邱少羽梦(修改者)](https://www.qiushaocloud.top)，也请支持下原作者哦
* 版权归原作者所有，修改者只是进行部分修改，以满足修改者需求
