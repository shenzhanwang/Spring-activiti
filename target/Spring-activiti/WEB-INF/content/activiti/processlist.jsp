<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>流程部署</title>
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
                    <li class="active">
                        <a href="processlist">已部署的流程</a>
                    </li>
                    <li>
                        <a href="runningtask">运行中的流程</a>
                    </li>
                    <li>
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
                        <a href="javascript:;" data-toggle="collapse" data-target="#demo">工作流实例</a>
                        <ul id="demo" class="collapse">
                            <li>
                                <a href="leaveapply">请假流程</a>
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
                        <div class="panel panel-success">
                            <div class="panel-heading">
                                <h3 class="panel-title">上传工作流定义文件</h3>
                            </div>
                            <div class="panel-body">
                                <form id="upload" action="uploadworkflow" method="post" enctype="multipart/form-data">
								        <div class="form-group">
								    		<label for="fileupload">workflowupload</label>
								    		<input type="file" name="uploadfile" class="form-control" id="fileupload">
								  		</div>
								        <button type="submit"  class="btn btn-primary">upload</button>
								</form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.row -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                <h3 class="panel-title">已部署好的工作流</h3>
                            </div>
                            <div class="panel-body">
                                <table id="grid-data" class="table table-condensed table-hover table-striped">
							        <thead>
							            <tr>
							                <th data-column-id="id" data-formatter="run" data-identifier="true" data-type="numeric">ID</th>
							                <th data-column-id="deploymentId">DeploymentId</th>
							                <th data-column-id="name">name</th>
							                <th data-column-id="resourceName" data-formatter="resname">ResourceName</th>
							                <th data-column-id="diagramresourcename" data-formatter="picname">diagramResourceName</th>
							                <th data-column-id="key">key</th>
							                <th data-column-id="commands" data-formatter="commands" data-sortable="false">操作</th>
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
    
    
  <!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">起始表单</h4>
      </div>
      <div class="modal-body">
       	
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>  
    <script type="text/javascript">
  $(document).ready(function(){
	  $("#upload").submit(function(){
	    if($("#fileupload").val()=="")
	    {
	    	alert("请选择工作流文件上传");
	    	return false;
	    }
	  });
	  
	  $(".mod").click(function(){
		  $("#myModal").modal();
	  });
	  
	  
  });
  
  $(document).ready(function(){
	    var grid =$("#grid-data").bootgrid({
	    ajax:true,
	    url:"getprocesslists",
	        formatters: {
	        "commands": function(column, row)
	        {
	            return "<button type=\"button\" class=\"btn btn-xs btn-default command-delete\" data-row-id=\"" + row.deploymentId + "\">删除<span class=\"glyphicon glyphicon-trash\"></span></button>";
	        },
	        "resname":function(column, row)
	        {
	            return "<a href=\"showresource?pdid="+row.id+"&resource="+row.resourceName+"\">"  + row.resourceName + "</a>";
	        },
	        "picname":function(column, row)
	        {
	        	return "<a href=\"showresource?pdid="+row.id+"&resource="+row.diagramresourcename+"\">"  + row.diagramresourcename + "</a>";
	        },
	    	}
	    }).on("loaded.rs.jquery.bootgrid", function()
		{
		    grid.find(".command-delete").on("click", function(e)
			    {
			        $.post("deletedeploy",{deployid:$(this).data("row-id")},function(){
			        	alert("删除成功");
			        	$("#grid-data").bootgrid("reload");
			        });
			    });
		    });
	  });
  </script>
</body>
</html>