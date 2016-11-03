# Spring-activiti
  在常用的ERP系统、OA系统的开发中，工作流引擎是一个必不可少的工具。本项目旨在基于Spring这一平台，整合业界流行的工作流引擎Activiti，并建立了两个完整的工作流进行演示：请假OA和采购流程。

其中包含的内容如下：

1.不采用activiti自带的用户、角色功能，因为过于简单，转而自行实现一个用户、角色、权限的三级结构，用户到角色，角色到权限均为多对多映射，持久层框架使用mybatis的collection和association标签嵌套实现；

2.使用默认的用户登录后（用户名xiaomi，密码1234），可看到已部署好的两个流程，请假OA和采购流程，其中，请假OA包含了用户任务、排他网关、起始结束事件，较为简单；采购流程除此之外，还使用了异常结束事件、子流程和边界事件的使用；

3.两个流程均包含了待办任务签收、运行流程进度追踪、已运行完流程历史记录查看的功能，运行流程进度在流程图中以红色标注；

4.使用时，将流程数据和业务数据相分离，使用业务号（businessKey）建立关联流程数据和业务数据的桥梁，使其相互可以访问,业务数据的主键即为业务号；

5.本系统所有表单均使用普通表单，而不是activiti的动态表单和外置表单，这样做是为了分表存放业务数据和流程数据;

6.系统前端采用基于Bootstrap的模板devoops建立。https://github.com/shenzhanwang/devoops

7.使用方法：先将activiti.sql文件导入mysql,数据库起名为activiti，用户名root，密码1234，再将Spring-activiti.war文件拷入tomcat的webapps文件夹下，启动tomcat，起始页面入口：http://localhost:8080/Spring-activiti/login

8.效果图：

 ![alt text](https://github.com/shenzhanwang/Spring-activiti/blob/master/%E6%88%AA%E5%9B%BE/2.jpg)
 
 ![alt text](https://github.com/shenzhanwang/Spring-activiti/blob/master/%E6%88%AA%E5%9B%BE/3.jpg)
 
  ![alt text](https://github.com/shenzhanwang/Spring-activiti/blob/master/%E6%88%AA%E5%9B%BE/4.jpg)
 ![alt text](https://github.com/shenzhanwang/Spring-activiti/blob/master/%E6%88%AA%E5%9B%BE/5.jpg)
  ![alt text](https://github.com/shenzhanwang/Spring-activiti/blob/master/%E6%88%AA%E5%9B%BE/6.jpg)
   ![alt text](https://github.com/shenzhanwang/Spring-activiti/blob/master/%E6%88%AA%E5%9B%BE/7.jpg)
