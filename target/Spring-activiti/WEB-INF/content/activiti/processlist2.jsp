
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
				<div class="no-padding ">
					<table id="grid-data" class="table table-bordered table-striped table-hover table-heading table-datatable">
						<thead>
							<tr>
								<th>id</th>
								<th>deploymentId</th>
								<th>name</th>
								<th>resourceName</th>
								<th>key</th>
								<th>diagramresourcename</th>
								<th>操作</th>
							</tr>
						</thead>
					</table>
				</div>
		</div>
		</div>
		</div>
<!-- /.container-fluid -->
<script type="text/javascript">
function AllTables(){
		$('#grid-data').DataTable( {
			"ajax": "getprocesslists2",
			searching: false,
    		ordering:  false,
    		"lengthChange": false,
    		responsive: true,
			"columns": [
			{  "data": "id" },
			{  "data": "deploymentId" },
			{  "data": "name" },
			{  "data": "resourceName" },
			{  "data": "key" },
			{  "data": "diagramresourcename" },
			{  "data": "command" }
			],
			"columnDefs": [ {
			    "targets": 5,
			    "data": "diagramresourcename",
			    "render": function ( data, type, row ) {
			      return "<a href=\"showresource?pdid="+row.id+"&resource="+row.diagramresourcename+"\">"+data+"</a>";
			    }
  			},
  			{
  				"targets": 3,
			    "data": "resourceName",
			    "render": function ( data, type, row ) {
			      return "<a href=\"showresource?pdid="+row.id+"&resource="+row.resourceName+"\">"+data+"</a>";
			    }
  			},
  			{
  				"targets": 6,
			    "data": "command",
			    "render": function ( data, type, row ) {
			      return "<button class=\"btn btn-xs btn-info\" data-row-id="+row.id+" onclick=deleterow('"+row.deploymentId+"')>删除</button>";
			    }
  			}
  			],
  			"language": {
		        "processing": "处理中...",
		        "lengthMenu": "显示 _MENU_ 项结果",
		        "zeroRecords": "没有匹配结果",
		        "info": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
		        "infoEmpty": "显示第 0 至 0 项结果，共 0 项",
		        "infoFiltered": "(由 _MAX_ 项结果过滤)",
		        "infoPostFix": "",
		        "search": "搜索:",
		        "searchPlaceholder": "搜索...",
		        "url": "",
		        "emptyTable": "表中数据为空",
		        "loadingRecords": "载入中...",
		        "infoThousands": ",",
		        "paginate": {
		            "first": "首页",
		            "previous": "上页",
		            "next": "下页",
		            "last": "末页"
		        }
	    }});
	}
	
	function deleterow(id){
	  	$.post("deletedeploy",{deployid:id},function(){
			        	alert("删除成功");
			    LoadAjaxContent("processlist2");
			});
	}
	  
  	$(document).ready(function(){
  		LoadDataTablesScripts(AllTables);
	  });
	  $(document).ready(function(){
	  	$(".btn-info").click(function(){
  			
  		});
	  });
	  
  </script>
