<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>actors</title>
<script src="./js/jquery-1.12.3.min.js"></script>
<link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" href="./css/jquery.bootgrid.min.css">
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="./js/jquery.bootgrid.min.js"></script>
<script type="text/javascript" src="js/bootstrap-datetimepicker.min.js"></script>
  <link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css" type="text/css"></link>
  </head>
  <body>
  <div class="container">
  	<div class="row">
  		<div class="col-md-12">
  		<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">Mysql sakila database</a>
    </div>
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">单表查询<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="showactor">actor</a></li>
          </ul>
        </li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">跨表查询<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="country_city">country和city</a></li>
          	<li><a href="chinacity">查询中国的city</a></li>
          </ul>
        </li>
        <li><a href="fileupload">fileupload</a></li>
        <li><a href="processlist">Activiti</a></li>
        <li><a href="logout">logout</a></li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
  		</div>
  	</div>
  	<div class="row">
  		<div class="col-md-12">
  		<h2>actor表的信息</h2>
  		<a class="btn btn-primary" href="exportactor">导出数据为excel</a>
  		<a class="btn btn-primary" href="#" id="add">添加actor</a>
  		<div class="btn-group">
		  <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		    REST Service <span class="caret"></span>
		  </button>
		  <ul class="dropdown-menu">
		    <li><a href="/SSM/actorlistxml?current=1&rowCount=10" target="_blank">XML</a></li>
		    <li><a href="/SSM/actorlist?current=1&rowCount=10" target="_blank">JSON</a></li>
		  </ul>
		</div>
  		<table id="grid-data" class="table table-condensed table-hover table-striped">
        <thead>
            <tr>
                <th data-column-id="id"  data-identifier="true" data-type="numeric">ID</th>
                <th data-column-id="first_name">first_name</th>
                <th data-column-id="last_name">last_name</th>
                <th data-column-id="last_update" data-order="desc">last_update</th>
                <th data-column-id="commands" data-formatter="commands" data-sortable="false">modify</th>
            </tr>
        </thead>
    </table>
  		</div>
  	</div>
  	
  	
  	
  </div>
<script>
$(document).ready(function(){
    var grid =$("#grid-data").bootgrid({
    ajax:true,
    url:"actorlist",
        formatters: {
        "commands": function(column, row)
        {
            return "<button type=\"button\" class=\"btn btn-xs btn-default command-edit\" data-row-id=\"" + row.id + "\">编辑<span class=\"glyphicon glyphicon-pencil\"></span></button> "+ 
                "<button type=\"button\" class=\"btn btn-xs btn-default command-delete\" data-row-id=\"" + row.id + "\">删除<span class=\"glyphicon glyphicon-trash\"></span></button>";
        }
    	}
    }).on("loaded.rs.jquery.bootgrid", function()
	{
    /* Executes after data is loaded and rendered */
	    grid.find(".command-edit").on("click", function(e)
	    {
	        $(".actormodal").modal();
	        $.post("getActorInfo",{id:$(this).data("row-id")},function(str){
	        	//var data=JSON.parse(str);
	        	$("#fname").val(str.first_name);
	        	$("#lname").val(str.last_name);
	        	$("#lupdate").val(str.last_update);
	        	$("#actorid").val(str.id);
	        });
	    }).end().find(".command-delete").on("click", function(e)
		    {
		        $.post("deleteactor",{id:$(this).data("row-id")},function(){
		        	alert("删除成功");
		        	$("#grid-data").bootgrid("reload");
		        });
		    });
  	});
  });
  
  $(document).ready(function(){
  		$("#add").click(function(){
  	 		$(".addmodal").modal();
  	 	});
  	 	
  	 	 $("#lupdate").datetimepicker({
  	 	 format: 'yyyy-mm-dd hh:ii:ss',
  	 	 autoclose: true
  	 	 });
  	 	 $("#lupdate").datetimepicker('setStartDate', '2012-01-01 0:0:0');
  });
  
  </script>
  <div class="modal fade actormodal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">update actor</h4>
      </div>
      <form action="updateactor" method="post">
      <div class="modal-body">
        <div class="form-group">
    		<label for="fname">first name</label>
    		<input type="text" name="first_name" class="form-control" id="fname">
  		</div>
        <div class="form-group">
    		<label for="lname">last name</label>
    		<input type="text" name="last_name" class="form-control" id="lname">
  		</div>
  		<div class="form-group ">
    		<label for="lupdate">last update</label>
    		<input type="text" name="last_update" class="form-control" id="lupdate">
    		<input type="hidden" id="actorid" name="id" />
  		</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">Save changes</button>
      </div>
      </form>
    </div>
  </div>
</div>

  <div class="modal fade addmodal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">add actor</h4>
      </div>
      <form action="addactor" method="post">
      <div class="modal-body">
        <div class="form-group">
    		<label for="fname">first name</label>
    		<input type="text" name="first_name" class="form-control" id="fname2">
  		</div>
        <div class="form-group">
    		<label for="lname">last name</label>
    		<input type="text" name="last_name" class="form-control" id="lname2">
  		</div>
  		<div class="form-group">
    		<label for="lupdate">last update</label>
    		<input type="text" name="last_update" class="form-control" id="lupdate2">
    		<input type="hidden" id="actorid" name="id2" />
  		</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">add actor</button>
      </div>
      </form>
    </div>
  </div>
</div>
  </body>
</html>
