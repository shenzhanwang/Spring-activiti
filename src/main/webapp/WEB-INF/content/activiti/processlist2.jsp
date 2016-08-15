
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!--Start Breadcrumb-->
<div class="row">
	<div id="breadcrumb" class="col-xs-12">
		<ol class="breadcrumb">
			<li><a href="index">首页</a></li>
			<li><a href="#">已部署的工作流2</a></li>
		</ol>
	</div>
</div>
<div class="container-fluid">
		
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
					<table id="grid-data" class="table table-bordered table-striped table-hover table-heading table-datatable">
						<thead>
							<tr>
								<th>id</th>
								<th>deploymentId</th>
								<th>name</th>
								<th>resourceName</th>
								<th>diagramresourcename</th>
								<th>key</th>
							</tr>
						</thead>
					</table>
				</div></div>
		</div>
		</div>
		</div>
<!-- /.container-fluid -->
<script type="text/javascript">
function AllTables(){
		$('#grid-data').DataTable( {
			"ajax": "getprocesslists2",
			"columns": [
		{  "sName": "id" },
		{  "sName": "deploymentId" },
		{  "sName": "name" },
		{  "sName": "resourceName" },
		{  "sName": "key" },
		{  "sName": "diagramresourcename" }
		]
	    });
	}
  	$(document).ready(function(){
  		
  		
  		LoadDataTablesScripts(AllTables);
  		
  		
	  });
  </script>
