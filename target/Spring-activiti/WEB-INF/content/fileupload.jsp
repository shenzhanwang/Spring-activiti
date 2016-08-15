<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>文件上传</title>
    <script src="./js/jquery-1.12.3.min.js"></script>
<link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
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
            <li><a href="staff_store">staff和store</a></li>
          </ul>
        </li>
        <li><a href="fileupload">fileupload</a></li>
        <li><a href="logout">logout</a></li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
  		</div>
  	</div>
  	<div class="row">
  		<div class="col-md-12">
   <form id="upload" action="uploadfile" method="post" enctype="multipart/form-data">
        <div class="form-group">
    		<label for="fileupload">fileupload</label>
    		<input type="file" name="uploadfile" class="form-control" id="fileupload">
  		</div>
        <button type="submit"  class="btn btn-primary">upload</button>
   </form>
  	 </div>
  	 </div>
   </div>
  </body>
  <script type="text/javascript">
  $(document).ready(function(){
	  $("#upload").submit(function(){
	    if($("#fileupload").val()=="")
	    {
	    	alert("请选择文件上传");
	    	return false;
	    }
	  });
  });
  </script>
</html>
