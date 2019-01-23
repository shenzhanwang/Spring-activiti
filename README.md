# Spring-activiti
  在常用的ERP系统、OA系统的开发中，工作流引擎是一个必不可少的工具。本项目旨在基于Spring这一平台，整合业界流行的工作流引擎Activiti，并建立了两个完整的工作流进行演示：请假OA和采购流程。

其中包含的内容如下：

1.不采用activiti自带的用户、角色功能，因为过于简单，转而自行实现一个用户、角色、权限的三级结构，用户到角色，角色到权限均为多对多映射，持久层框架使用mybatis的collection和association标签嵌套实现；

2.使用默认的用户登录后（用户名xiaomi，密码1234），可看到已部署好的两个流程，请假OA和采购流程，其中，请假OA包含了用户任务、排他网关、起始结束事件，较为简单；采购流程除此之外，还使用了异常结束事件、子流程和边界事件的使用；

3.两个流程均包含了待办任务签收、运行流程进度追踪、已运行完流程历史记录查看的功能，运行流程进度在流程图中以红色标注；

4.使用时，将流程数据和业务数据相分离，使用业务号（businessKey）建立关联流程数据和业务数据的桥梁，使其相互可以访问,业务数据的主键即为业务号；

5.本系统所有表单均使用普通表单，而不是activiti的动态表单和外置表单，这样做是为了分表存放业务数据和流程数据;

6.系统前端采用基于Bootstrap的模板devoops建立。https://github.com/shenzhanwang/devoops

7.起始页面入口：http://localhost:8080/Spring-activiti/login
使用前，编译(可直接在myeclipse完成)：
```
mvn clean install
```
8.效果图：

![输入图片说明](https://images.gitee.com/uploads/images/2018/1211/082825_ac69fdda_1110335.gif "SSM.gif")
![输入图片说明](https://images.gitee.com/uploads/images/2018/1211/091443_9ebd78b8_1110335.gif "user.gif")
![输入图片说明](http://git.oschina.net/uploads/images/2016/1116/081734_f50ccb20_1110335.jpeg "在这里输入图片标题")
![输入图片说明](http://git.oschina.net/uploads/images/2016/1116/081747_e412ab52_1110335.jpeg "在这里输入图片标题")
![输入图片说明](http://git.oschina.net/uploads/images/2016/1116/081802_2f2bf64c_1110335.jpeg "在这里输入图片标题")
![输入图片说明](http://git.oschina.net/uploads/images/2016/1116/081810_cbd63187_1110335.jpeg "在这里输入图片标题")
![输入图片说明](http://git.oschina.net/uploads/images/2016/1116/081820_97a18226_1110335.jpeg "在这里输入图片标题")
![输入图片说明](http://git.oschina.net/uploads/images/2016/1116/081830_8767776b_1110335.jpeg "在这里输入图片标题")

### 附录：个人作品索引目录（持续更新）

#### 基础篇:职业化，从做好OA系统开始
1. [SpringMVC,Mybatis,Spring三大框架的整合实现增删改查](https://gitee.com/shenzhanwang/SSM)
2. [Struts2,Hibernate,Spring三大框架的整合实现增删改查](https://gitee.com/shenzhanwang/S2SH)
3. [Spring,SpringMVC和Hibernate的整合实现增删改查](https://gitee.com/shenzhanwang/SSH)
4. [Spring平台整合activiti工作流引擎实现OA开发](https://gitee.com/shenzhanwang/Spring-activiti)
5. [Spring发布与调用REST风格的WebService](https://gitee.com/shenzhanwang/Spring-REST)
6. [Spring整合Apache Shiro框架，实现用户管理和权限控制](https://gitee.com/shenzhanwang/Spring-shiro)
7. [使用Spring security做权限控制](https://gitee.com/shenzhanwang/spring-security-demo)
8. [Spring整合Jasig CAS框架实现单点登录](https://gitee.com/shenzhanwang/Spring-cas-sso)
#### 中级篇：中间件的各种姿势
9. [Spring连接mongoDB数据库实现增删改查](https://gitee.com/shenzhanwang/Spring-mongoDB)
10. [Spring连接Redis实现缓存](https://gitee.com/shenzhanwang/Spring-redis)
11. [Spring连接图存数据库Neo4j实现增删改查](https://gitee.com/shenzhanwang/Spring-neo4j)
12. [Spring平台整合消息队列ActiveMQ实现发布订阅、生产者消费者模型（JMS）](https://gitee.com/shenzhanwang/Spring-activeMQ)
13. [Spring整合消息队列RabbitMQ实现四种消息模式（AMQP）](https://gitee.com/shenzhanwang/Spring-rabbitMQ)
14. Spring框架的session模块实现集中式session管理（[购买](https://www.fageka.com/store/item/s/id/fwW1QEK2848.html)）
15. [Spring整合websocket实现即时通讯](https://gitee.com/shenzhanwang/Spring-websocket)
16. 使用Spring boot整合mybatis,rabbitmq,redis,mongodb实现增删改查（[购买](https://www.fageka.com/store/item/s/id/0feQDHL1913.html)）
17. [Spring MVC整合FastDFS客户端实现文件上传](https://gitee.com/shenzhanwang/Spring-fastdfs)
18. 23种设计模式，源码、注释、使用场景（[购买](https://www.fageka.com/store/item/s/id/TuSSL2r3330.html)）
19. [使用ETL工具Kettle的实例](https://gitee.com/shenzhanwang/Kettle-demo)
20. Git指南和分支管理策略（[购买](https://www.fageka.com/store/item/s/id/Z7uh2iF1620.html)）
#### 高级篇：架构之美
21. [zookeeper原理、架构、使用场景和可视化](https://gitee.com/shenzhanwang/zookeeper-practice)
22. Spring框架整合dubbo框架实现分布式服务治理（SOA架构）（[购买](https://www.fageka.com/store/item/s/id/tTEHOF42241.html)）
23. Spring框架整合dubbox实现微服务架构（MSA架构）
24. 使用Spring Cloud实现微服务架构（MSA架构）（[购买](https://www.fageka.com/store/item/s/id/5T5cEY80304.html)）
25. 使用jenkins+centos+git+maven搭建持续集成环境自动化部署分布式服务（[购买](https://www.fageka.com/store/item/s/id/TvLt0pr4205.html)）
26. 使用docker+compose+jenkins+gitlab+spring cloud实现微服务的编排、持续集成和动态扩容（[购买](https://www.fageka.com/store/item/s/id/7Gi4FeN2111.html)）
27. 使用FastDFS搭建分布式文件系统（高可用、负载均衡）（[购买](https://www.fageka.com/store/item/s/id/sAKgl2n4209.html)）
28. 搭建高可用nginx集群和Tomcat负载均衡（[购买](https://www.fageka.com/store/item/s/id/78bvd6N2534.html)）
29. 搭建可扩展的ActiveMQ高可用集群（[购买](https://www.fageka.com/store/item/s/id/H1nWZ4j4443.html)）
30. 实现Mysql数据库的主从复制、读写分离、分表分库、负载均衡和高可用（[购买](https://www.fageka.com/store/item/s/id/lojrGCH2016.html)）
31. 搭建高可用redis集群实现分布式缓存（[购买](https://www.fageka.com/store/item/s/id/02HwT2W4038.html)）
32. [Spring整合SolrJ实现全文检索](https://gitee.com/shenzhanwang/Spring-solr)
#### 特别篇：分布式事务和并发控制
33. 基于可靠消息最终一致性实现分布式事务（activeMQ）（[购买](https://www.fageka.com/store/item/s/id/qwCZgHD2224.html)）
34. 使用TCC框架实现分布式事务（dubbo版）（[购买](https://www.fageka.com/store/item/s/id/woVwDpD0145.html)）
35. 使用TCC框架实现分布式事务（Spring Cloud版）（[购买](https://www.fageka.com/store/item/s/id/VZ4lvg40739.html)）
36. 决战高并发：数据库锁机制和事务隔离级别的实现（[购买](https://www.fageka.com/store/item/s/id/Xvk7DZI2400.html)）
37. 决战高并发：使用redis实现分布式锁（[购买](https://www.fageka.com/store/item/s/id/uFQStQ61656.html)）
38. 决战高并发：使用zookeeper实现分布式锁（[购买](https://www.fageka.com/store/item/s/id/NQp8kpF1940.html)）
39. 决战高并发：Java多线程编程实例（[购买](https://www.fageka.com/store/item/s/id/k6MzK041644.html)）
40. 决战高并发：使用netty实现高性能NIO通信（[购买](https://www.fageka.com/store/item/s/id/VtwnbVN5319.html)）

### 网店入口
[我的网店](https://www.fageka.com/Store/Index/shop/id/1zxrETbHcz)
   