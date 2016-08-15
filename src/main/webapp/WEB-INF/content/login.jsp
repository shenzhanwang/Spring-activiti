<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>登录</title>
		<meta name="description" content="description">
		<meta name="author" content="Evgeniya">
		<meta name="keyword" content="keywords">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link href="./plugins/bootstrap/bootstrap.css" rel="stylesheet">
		<link href="http://netdna.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.css" rel="stylesheet">
		<link href='http://fonts.googleapis.com/css?family=Righteous' rel='stylesheet' type='text/css'>
		<link href="./css/style_v1.css" rel="stylesheet">
		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
				<script src="http://getbootstrap.com/docs-assets/js/html5shiv.js"></script>
				<script src="http://getbootstrap.com/docs-assets/js/respond.min.js"></script>
		<![endif]-->
	</head>
<body>
<div class="container-fluid">
	<div id="page-login" class="row">
		<div class="col-xs-12 col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3">
			<div class="text-right">
				<a href="register" class="txt-default">Need an account?</a>
			</div>
			<div class="box">
				<div class="box-content">
					<div class="text-center">
						<h3 class="page-header">Spring-activiti Login Page</h3>
					</div>
					<form action="loginvalidate" method="post">
					<div class="form-group">
						<label class="control-label">Username</label>
						<input type="text" class="form-control" name="username" />
					</div>
					<div class="form-group">
						<label class="control-label">Password</label>
						<input type="password" class="form-control" name="password" />
					</div>
					<div class="form-group">
						<label class="control-label">验证码</label> &nbsp &nbsp &nbsp<img src="authImg" width="70" height="25">  
						<input type="text" class="form-control" name="pic" />
					</div>
					<div class="text-center">
						<button class="btn btn-primary">login</button>
					</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
