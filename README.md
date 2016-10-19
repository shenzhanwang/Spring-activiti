# SSM
SpringMVC,Mybatis,Spring三大框架的整合总是很麻烦，在此提供一个已经整合好三大框架的包，可以直接下载导入Myeclipse使用，项目基于Maven做依赖管理。项目基于Mysql自带的Sakila数据库实现了MIS系统中常用的多个功能，运行前请安装好Mysql。

其中包含的内容如下：

1.SpringMVC4.0.4,Mybatis3.2.2,Spring4.0.4三大框架的整合；

2.前端框架集成了Bootstrap3.3.5，Jquery1.12.3,集成了Bootstrap插件Bootgrid数据表格实现分页，使用Bootstrap的datetimepicker插件实现日期时间选择，后台的分页使用Mybatis的插件pagehelper实现；

3.数据库使用Mysql中自带的sakila数据库，使用前，请将SSM\src\main\resources\conf中的spring-mybatis.xml中的数据库密码设置为自己的；

4.实现了sakila中的单表的增删改查和跨表查询，跨表查询包括了Mybatis的1-N双向映射；

5.集成了作业自动调度框架Quartz 2.2.2实现作业调度；

6.json插件使用阿里的开源fastjson工具；

7.包含了一个文件上传的功能；

8.包含了数据表导出为Excel下载的功能，使用POI实现；

9.包含了带验证码的登录功能以及登录权限验证的拦截器；

10.整个包可直接导入Myeclipse继续编辑，war文件可直接放入tomcat部署。

11.要使用Struts2+hibernate+spring的整合，[点击这里进入](https://github.com/shenzhanwang/SSH_maven)  

访问入口：http://localhost:8080/SSM/login

效果图：

 ![alt text](https://github.com/shenzhanwang/SSM/blob/master/%E6%88%AA%E5%9B%BE/1.png)
 
 ![alt text](https://github.com/shenzhanwang/SSM/blob/master/%E6%88%AA%E5%9B%BE/2.png)


