<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>我的任务</title>
 <script src="js/jquery-1.12.3.min.js"></script>
<link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link href="css/sb-admin.css" rel="stylesheet">
<link rel="stylesheet" href="css/jquery.bootgrid.min.css">
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="js/jquery.bootgrid.min.js"></script>
</head>
<body style="padding-top: 50px;">
   <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">Activiti Management</a>
            </div>
            <!-- Top Menu Items -->
            <ul class="nav navbar-right top-nav">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span> <b class="caret"></b></a>
                    <ul class="dropdown-menu message-dropdown">
                        <li class="message-preview">
                            <a href="#">
                                <div class="media">
                                    <span class="pull-left">
                                        <img class="media-object" src="http://placehold.it/50x50" alt="">
                                    </span>
                                    <div class="media-body">
                                        <h5 class="media-heading"><strong>John Smith</strong>
                                        </h5>
                                        <p class="small text-muted">Yesterday at 4:32 PM</p>
                                        <p>Lorem ipsum dolor sit amet, consectetur...</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="message-preview">
                            <a href="#">
                                <div class="media">
                                    <span class="pull-left">
                                        <img class="media-object" src="http://placehold.it/50x50" alt="">
                                    </span>
                                    <div class="media-body">
                                        <h5 class="media-heading"><strong>John Smith</strong>
                                        </h5>
                                        <p class="small text-muted"><span class="glyphicon glyphicon-bell" aria-hidden="true"></span>  Yesterday at 4:32 PM</p>
                                        <p>Lorem ipsum dolor sit amet, consectetur...</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="message-preview">
                            <a href="#">
                                <div class="media">
                                    <span class="pull-left">
                                        <img class="media-object" src="http://placehold.it/50x50" alt="">
                                    </span>
                                    <div class="media-body">
                                        <h5 class="media-heading"><strong>John Smith</strong>
                                        </h5>
                                        <p class="small text-muted"><span class="glyphicon glyphicon-bell" aria-hidden="true"></span> Yesterday at 4:32 PM</p>
                                        <p>Lorem ipsum dolor sit amet, consectetur...</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="message-footer">
                            <a href="#">Read All New Messages</a>
                        </li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-bell" aria-hidden="true"></span> <b class="caret"></b></a>
                    <ul class="dropdown-menu alert-dropdown">
                        <li>
                            <a href="#">Alert Name <span class="label label-default">Alert Badge</span></a>
                        </li>
                        <li>
                            <a href="#">Alert Name <span class="label label-primary">Alert Badge</span></a>
                        </li>
                        <li>
                            <a href="#">Alert Name <span class="label label-success">Alert Badge</span></a>
                        </li>
                        <li>
                            <a href="#">Alert Name <span class="label label-info">Alert Badge</span></a>
                        </li>
                        <li>
                            <a href="#">Alert Name <span class="label label-warning">Alert Badge</span></a>
                        </li>
                        <li>
                            <a href="#">Alert Name <span class="label label-danger">Alert Badge</span></a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">View All</a>
                        </li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> John Smith <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="#"><i class="fa fa-fw fa-user"></i> Profile</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-fw fa-envelope"></i> Inbox</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-fw fa-gear"></i> Settings</a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#"><i class="fa fa-fw fa-power-off"></i> Log Out</a>
                        </li>
                    </ul>
                </li>
            </ul>
            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                    <li>
                        <a href="processlist">已部署的流程</a>
                    </li>
                    <li>
                        <a href="runningtask">运行中的流程</a>
                    </li>
                    <li class="active">
                        <a href="mytask">我的任务</a>
                    </li>
                    <li>
                        <a href="forms.html"><i class="fa fa-fw fa-edit"></i> Forms</a>
                    </li>
                    <li>
                        <a href="bootstrap-elements.html"><i class="fa fa-fw fa-desktop"></i> Bootstrap Elements</a>
                    </li>
                    <li>
                        <a href="bootstrap-grid.html"><i class="fa fa-fw fa-wrench"></i> Bootstrap Grid</a>
                    </li>
                    <li>
                        <a href="javascript:;" data-toggle="collapse" data-target="#demo"> Dropdown </a>
                        <ul id="demo" class="collapse">
                            <li>
                                <a href="#">Dropdown Item</a>
                            </li>
                            <li>
                                <a href="#">Dropdown Item</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="blank-page.html"></i> Blank Page</a>
                    </li>
                    <li>
                        <a href="index-rtl.html"> RTL Dashboard</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </nav>

        <div id="page-wrapper">
            <div class="container-fluid">
                       <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                <h3 class="panel-title">待办任务-部门领导审批</h3>
                            </div>
                            <div class="panel-body">
                                <table id="grid-data" class="table table-condensed table-hover table-striped">
							        <thead>
							            <tr>
							                <th data-column-id="user_id" data-identifier="true" data-type="numeric">申请人</th>
							                <th data-column-id="leave_type">类型</th>
							                <th data-column-id="start_time">请假开始时间</th>
							                <th data-column-id="end_time">请假结束时间</th>
							                <th data-column-id="reason">请假原因</th>
							                <th data-column-id="taskid">任务ID</th>
							                <th data-column-id="taskname">任务名称</th>
							                <th data-column-id="process_instance_id" >流程实例ID</th>
							                <th data-column-id="processdefid">流程定义ID</th>
							                <th data-column-id="taskcreatetime">任务创建时间</th>
							                <th data-formatter="commands">操作</th>
							            </tr>
							        </thead>
							    </table>
                            </div>
                        </div>
                    </div>
                </div>
                      <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                <h3 class="panel-title">待办任务-人事审批</h3>
                            </div>
                            <div class="panel-body">
                                <table id="grid-data2" class="table table-condensed table-hover table-striped">
							        <thead>
							            <tr>
							                <th data-column-id="user_id" data-identifier="true" data-type="numeric">申请人</th>
							                <th data-column-id="leave_type">类型</th>
							                <th data-column-id="start_time">请假开始时间</th>
							                <th data-column-id="end_time">请假结束时间</th>
							                <th data-column-id="reason">请假原因</th>
							                <th data-column-id="taskid">任务ID</th>
							                <th data-column-id="taskname">任务名称</th>
							                <th data-column-id="process_instance_id" >流程实例ID</th>
							                <th data-column-id="processdefid">流程定义ID</th>
							                <th data-column-id="taskcreatetime">任务创建时间</th>
							                <th data-formatter="commands">操作</th>
							            </tr>
							        </thead>
							    </table>
                            </div>
                        </div>
                    </div>
                </div>
                      <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                <h3 class="panel-title">待办任务-销假</h3>
                            </div>
                            <div class="panel-body">
                                <table id="grid-data3" class="table table-condensed table-hover table-striped">
							        <thead>
							            <tr>
							                <th data-column-id="user_id" data-identifier="true" data-type="numeric">申请人</th>
							                <th data-column-id="leave_type">类型</th>
							                <th data-column-id="start_time">请假开始时间</th>
							                <th data-column-id="end_time">请假结束时间</th>
							                <th data-column-id="reason">请假原因</th>
							                <th data-column-id="taskid">任务ID</th>
							                <th data-column-id="taskname">任务名称</th>
							                <th data-column-id="process_instance_id" >流程实例ID</th>
							                <th data-column-id="processdefid">流程定义ID</th>
							                <th data-column-id="taskcreatetime">任务创建时间</th>
							                <th data-formatter="commands">操作</th>
							            </tr>
							        </thead>
							    </table>
                            </div>
                        </div>
                    </div>
                </div>
                      <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                <h3 class="panel-title">待办任务-调整申请</h3>
                            </div>
                            <div class="panel-body">
                                <table id="grid-data4" class="table table-condensed table-hover table-striped">
							        <thead>
							            <tr>
							                <th data-column-id="user_id" data-identifier="true" data-type="numeric">申请人</th>
							                <th data-column-id="leave_type">类型</th>
							                <th data-column-id="start_time">请假开始时间</th>
							                <th data-column-id="end_time">请假结束时间</th>
							                <th data-column-id="reason">请假原因</th>
							                <th data-column-id="taskid">任务ID</th>
							                <th data-column-id="taskname">任务名称</th>
							                <th data-column-id="process_instance_id" >流程实例ID</th>
							                <th data-column-id="processdefid">流程定义ID</th>
							                <th data-column-id="taskcreatetime">任务创建时间</th>
							                <th data-formatter="commands">操作</th>
							            </tr>
							        </thead>
							    </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->
    </div>
    <script type="text/javascript">
    $(document).ready(function(){
	    $("#grid-data").bootgrid({
		    ajax:true,
		    url:"depttasklist",
		    formatters: {
		    "commands": function(column, row)
		    {
		            return "<a href=\"dealtask/"+row.taskid+"\" class=\"btn btn-xs btn-default command-run\" data-row-id=\"" + row.taskid + "\">处理<span class=\"glyphicon glyphicon-play\"></span></a>";
		    }
	    	}
	    });
	    
	    $("#grid-data2").bootgrid({
		    ajax:true,
		    url:"hrtasklist",
		    formatters: {
		    "commands": function(column, row)
		    {
		            return "<a href=\"dealtask/"+row.taskid+"\" class=\"btn btn-xs btn-default command-run\" data-row-id=\"" + row.taskid + "\">处理<span class=\"glyphicon glyphicon-play\"></span></a>";
		    }
	    	}
	    });
	    
	    $("#grid-data3").bootgrid({
		    ajax:true,
		    url:"xjtasklist",
		    formatters: {
		    "commands": function(column, row)
		    {
		            return "<a href=\"dealtask/"+row.taskid+"\" class=\"btn btn-xs btn-default command-run\" data-row-id=\"" + row.taskid + "\">处理<span class=\"glyphicon glyphicon-play\"></span></a>";
		    }
	    	}
	    });
	    
	    $("#grid-data4").bootgrid({
		    ajax:true,
		    url:"updatetasklist",
		    formatters: {
		    "commands": function(column, row)
		    {
		            return "<a href=\"dealtask/"+row.taskid+"\" class=\"btn btn-xs btn-default command-run\" data-row-id=\"" + row.taskid + "\">处理<span class=\"glyphicon glyphicon-play\"></span></a>";
		    }
	    	}
	    });
	    
	  });
    </script>
</body>
</html>