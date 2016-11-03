<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
     <!--Start Breadcrumb-->
<div class="row">
	<div id="breadcrumb" class="col-xs-12">
	<a href="#" class="show-sidebar">
						  <i class="fa fa-bars"></i>
						</a>
		<ol class="breadcrumb pull-left">
			<li><a href="index">首页</a></li>
			<li><a href="#">系统管理</a></li>
			<li><a href="#">用户管理</a></li>
		</ol>
	</div>
</div>       
            <div class="container-fluid">
                       <div class="row">
                    <div class="col-lg-12">
                    <div class="box ui-draggable ui-droppable">
				<div class="box-header">
					<div class="box-name">
						<i class="fa fa-coffee"></i> <span>用户管理</span>
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
				<button id="adduser" type="button" class="btn btn-primary">添加新用户</button>
					 <table id="grid-data" class="table table-condensed table-hover table-striped">
							        <thead>
							            <tr>
							                <th data-column-id="id" data-identifier="true" data-type="numeric">用户id</th>
							                <th data-column-id="username">用户名</th>
							                <th data-column-id="tel">电话</th>
							                <th data-column-id="age">年龄</th>
							                <th data-column-id="rolelist">拥有角色</th>
							                <th data-formatter="commands">操作</th>
							            </tr>
							        </thead>
							    </table>
                </div>
                            </div>
                        </div>
                    </div>
</div>
  <script type="text/javascript">
    $(document).ready(function(){
	    var grid=$("#grid-data").bootgrid({
	        ajaxSettings: {
		        method: "GET"
    		},
	    	navigation:2,
  			columnSelection:false,
		    ajax:true,
		    url:"userlist",
		    formatters: {
		    "commands": function(column, row)
		    {
		            return "<button class=\"btn btn-xs btn-default ajax-link command-run1\" data-row-id=\"" + row.id + "\">修改</button>"+
		            "<button class=\"btn btn-xs btn-default ajax-link\" onclick=\"deleteuser("+row.id+")\" data-row-id=\"" + row.id + "\">删除</button>";
		    }
	    	}
	    
	    }).on("loaded.rs.jquery.bootgrid", function()
	    		{
	    	    grid.find(".command-run1").on("click", function(e)
	    	    {
	    	    	$("#userinfo").modal();
	    	    	var uid=$(this).data("row-id");
	    	    	$.get("user/"+uid,function(data){
	    	    		$("#username").val(data.username);
	    	    		$("#tel").val(data.tel);
	    	    		$("#age").val(data.age);
	    	    		var user_role=data.user_roles;
	    	    		var roles=[];
	    	    		for(var a=0;a<user_role.length;a++){
	    	    			var role=user_role[a].role.rolename;
	    	    			roles.push(role);
	    	    		}
	    	    		$.get("rolelist",function(a){
	    	    			$("#roles").html("");
	    	    			for(var m=0;m<a.length;m++){
	    	    				if(roles.indexOf(a[m].rolename)<0)
	    	    				$("#roles").append("<div class=\"checkbox-inline\"><label><input name='rolename[]' value="+a[m].rolename+" type=\"checkbox\">"+a[m].rolename+"<i class=\"fa fa-square-o\"></i></label></div>");
	    	    				else
	    	    				$("#roles").append("<div class=\"checkbox-inline\"><label><input name='rolename[]' value="+a[m].rolename+" type=\"checkbox\" checked=\"checked\">"+a[m].rolename+"<i class=\"fa fa-square-o\"></i></label></div>");
	    	    			}
	    	    			roles=[];
	    	    		});
	    	    		$("#btn").click(function(){
				    		if($("#tel").val()==""){
				    			alert("电话不得为空");
				    			return false;
				    		}
				    		if($("#age").val()==""){
				    			alert("年龄不得为空");
				    			return false;
				    		}
		    	    		$.post("updateuser/"+uid,$("form").serialize(),function(data){
		    	    			$("#userinfo").modal('hide');
				    			alert("修改成功");
				    			LoadAjaxContent("useradmin");
				    			history.go(0);
		    	    		});
		    	    	});
	    	    	});
	    	    	
	    	    });
	    
	    
	    });
	  });
	  
	 function deleteuser(uid){
	 	$.ajax({
	     type: 'GET',
	     url: "deleteuser/"+uid ,
	     success:function(data) {  
	             alert("删除成功！");  
	             LoadAjaxContent("useradmin");
      	 }
		});
	 } 
	 
	  $(document).ready(function(){
	  	$("#adduser").click(function(){
	  		$("#userinfo").modal();
	  		$("form").attr("action","adduser");
	  		$("#username").removeAttr("readonly");
	  		$("#username").val("");
	  		$("#tel").val("");
	  		$("#age").val("");
	  		$.get("rolelist",function(a){
	    	    	$("#roles").html("");
	    	    	for(var m=0;m<a.length;m++){
	    	    		$("#roles").append("<div class=\"checkbox-inline\"><label><input name='rolename[]' value="+a[m].rolename+" type=\"checkbox\">"+a[m].rolename+"<i class=\"fa fa-square-o\"></i></label></div>");
	    	    	}
	    	});
	    	$("#btn").click(function(){
	    		if($("#username").val()=="")
	    		{
	    			alert("用户名不得为空");
	    			return false;
	    		}
	    		if($("#tel").val()==""){
	    			alert("电话不得为空");
	    			return false;
	    		}
	    		if($("#age").val()==""){
	    			alert("年龄不得为空");
	    			return false;
	    		}
	    		$.post("adduser",$("form").serialize(),function(){
	    			$("#userinfo").modal('hide');
	    			alert("添加成功");
	    			LoadAjaxContent("useradmin");
	    			history.go(0);
	    		});
	    	});
	    
	  	});
	  	
	  });
	 
    </script>
<div id="userinfo" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="myModalLabel">编辑用户信息</h4>
      </div>
      <form class="form-horizontal" method="post">
      <div class="modal-body">
        	<div class="row form-group">
			    <label for="username" class="col-sm-1 control-label">用户名</label>
			    <div class="col-sm-11">
			      <input type="text" name="username" class="form-control" id="username" readonly="readonly">
			    </div>
        	</div>
        	<div class="row form-group">
			    <label for="tel" class="col-sm-1 control-label">电话</label>
			    <div class="col-sm-11">
			      <input type="text" name="tel" class="form-control" id="tel">
			    </div>
        	</div>
        	<div class="row form-group">
			    <label for="age" class="col-sm-1 control-label">年龄</label>
			    <div class="col-sm-11">
			      <input type="text" name="age" class="form-control" id="age">
			    </div>
        	</div>
        	<h4 class="page-header">拥有角色</h4>
        	<div class="row form-group">
					<div class="col-sm-12" id="roles">
					</div>
			</div>
			<p>新用户初始密码为1234</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" id="btn" class="btn btn-primary">保存</button>
      </div>
      </form>
    </div>
  </div>
</div>