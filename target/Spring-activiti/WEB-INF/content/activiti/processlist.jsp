
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!--Start Breadcrumb-->
<div class="row">
	<div id="breadcrumb" class="col-xs-12">
	<a href="#" class="show-sidebar">
						  <i class="fa fa-bars"></i>
						</a>
		<ol class="breadcrumb pull-left">
			<li><a href="index">首页</a></li>
			<li><a href="#">已部署的工作流</a></li>
		</ol>
	</div>
</div>
<div class="container-fluid">
	<div class="row">
		<div class="col-lg-12">
		<div class="box ui-draggable ui-droppable">
			<div class="box-header">
					<div class="box-name">
						<i class="fa fa-coffee"></i> <span>上传工作流文件</span>
					</div>
					<div class="box-icons">
						<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
						</a> <a class="expand-link"> <i class="fa fa-expand"></i>
						</a> <a class="close-link"> <i class="fa fa-times"></i>
						</a>
					</div>
					<div class="no-move"></div>
				</div>
				<div class="box-content">
					<form id="upload" action="uploadworkflow" method="post" enctype="multipart/form-data">
						<div class="form-group">
							<label for="fileupload">workflowupload</label> 
							<input type="file" name="uploadfile" class="form-control" id="fileupload">
						</div>
						<button type="submit" class="btn btn-primary">upload</button>
					</form>
				</div>
			</div></div>
		</div>
		
	<!-- /.row -->
	<div class="row">
		<div class="col-lg-12">
		<div class="box ui-draggable ui-droppable">
				<div class="box-header">
					<div class="box-name">
						<i class="fa fa-coffee"></i> <span>已部署的工作流</span>
					</div>
					<div class="box-icons">
						<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
						</a> <a class="expand-link"> <i class="fa fa-expand"></i>
						</a> <a class="close-link"> <i class="fa fa-times"></i>
						</a>
					</div>
					<div class="no-move"></div>
				</div>
				<div class="box-content">
					<table id="grid-data" class="table table-condensed table-hover table-striped">
						<thead>
							<tr>
								<th data-column-id="id" data-formatter="run"
									data-identifier="true" data-type="numeric">ID</th>
								<th data-column-id="deploymentId">DeploymentId</th>
								<th data-column-id="name">name</th>
								<th data-column-id="resourceName" data-formatter="resname">ResourceName</th>
								<th data-column-id="diagramresourcename"
									data-formatter="picname">diagramResourceName</th>
								<th data-column-id="key">key</th>
								<th data-column-id="commands" data-formatter="commands"
									data-sortable="false">操作</th>
							</tr>
						</thead>
					</table>
				</div></div>
		</div>
		</div>
		</div>
<!-- /.container-fluid -->
<script type="text/javascript">
  $(document).ready(function(){
	  $("#upload").submit(function(){
	    if($("#fileupload").val()=="")
	    {
	    	alert("请选择工作流文件上传");
	    	return false;
	    }
	  });
	  
  });
  
  $(document).ready(function(){
	    var grid =$("#grid-data").bootgrid({
	    ajax:true,
	    rowCount:10,
	    navigation:2,
	    columnSelection:false,
	    url:"getprocesslists",
	        formatters: {
	        "commands": function(column, row)
	        {
	            return "<button type=\"button\" class=\"btn btn-xs btn-info command-delete\" data-row-id=\"" + row.deploymentId + "\">删除</button>";
	        },
	        "resname":function(column, row)
	        {
	            return "<a target=\"_blank\" href=\"showresource?pdid="+row.id+"&resource="+row.resourceName+"\">"  + row.resourceName + "</a>";
	        },
	        "picname":function(column, row)
	        {
	        	return "<a target=\"_blank\" href=\"showresource?pdid="+row.id+"&resource="+row.diagramresourcename+"\">"  + row.diagramresourcename + "</a>";
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
