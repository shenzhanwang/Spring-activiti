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
			<li><a href="#">角色管理</a></li>
		</ol>
	</div>
</div>       
            <div class="container-fluid">
                       <div class="row">
                    <div class="col-lg-12">
                    <div class="box ui-draggable ui-droppable">
				<div class="box-header">
					<div class="box-name">
						<i class="fa fa-coffee"></i> <span>角色管理</span>
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
				<button id="addrole" type="button" class="btn btn-primary">添加新角色</button>
					 <table id="grid-data" class="table table-condensed table-hover table-striped">
							        <thead>
							            <tr>
							                <th data-column-id="rid" data-identifier="true" data-type="numeric">角色id</th>
							                <th data-column-id="rolename">角色名</th>
							                <th data-formatter="rights" data-column-id="rolelist">拥有权限</th>
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
		    url:"roles",
		    formatters: {
		    "rights":function(column,row){
		    	var len=row.role_permission.length;
		    	var str="";
		    	for(var t=0;t<len;t++)
		    		str+=row.role_permission[t].permission.permissionname+',';
		    	str=str.substring(0,str.length-1);
				return str;
		    },
		    "commands": function(column, row)
		    {
		            return "<button class=\"btn btn-xs btn-default ajax-link command-run1\" data-row-id=\"" + row.rid + "\">修改</button>"+
		            "<button class=\"btn btn-xs btn-default ajax-link\" onclick=\"deleterole("+row.rid+")\" data-row-id=\"" + row.rid + "\">删除</button>";
		    }
	    	}
	    
	    }).on("loaded.rs.jquery.bootgrid", function()
	    		{
	    	    grid.find(".command-run1").on("click", function(e)
	    	    {
	    	    	$("#roleinfo").modal();
	    	    	var rid=$(this).data("row-id");
	    	    	$.get("roleinfo/"+rid,function(data){
	    	    		$("#rolename").val(data.rolename);
	    	    		var role_permission=data.role_permission;
	    	    		var roles=[];
	    	    		for(var a=0;a<role_permission.length;a++){
	    	    			var name=role_permission[a].permission.permissionname;
	    	    			roles.push(name);
	    	    		}
	    	    		$.get("permissionlist",function(a){
	    	    			$("#roles").html("");
	    	    			for(var m=0;m<a.length;m++){
	    	    				if(roles.indexOf(a[m].permissionname)<0)
	    	    				$("#roles").append("<div class=\"checkbox-inline\"><label><input name='permissionname[]' value="+a[m].permissionname+" type=\"checkbox\">"+a[m].permissionname+"<i class=\"fa fa-square-o\"></i></label></div>");
	    	    				else
	    	    				$("#roles").append("<div class=\"checkbox-inline\"><label><input name='permissionname[]' value="+a[m].permissionname+" type=\"checkbox\" checked=\"checked\">"+a[m].permissionname+"<i class=\"fa fa-square-o\"></i></label></div>");
	    	    			}
	    	    			roles=[];
	    	    		});
	    	    		$("#btn").click(function(){
	    	    			var a=$("input[type='checkbox']").size();
				    		var flag=false;
				    		for(var m=0;m<a;m++){
				    			if($("input[type='checkbox']").eq(m).is(':checked'))
				    				flag=true;
				    		}
				    		if(!flag){
				    			alert("必须选择至少选择一个权限");
				    			return false;
				    		}
	    	    		
		    	    		$.post("updaterole/"+rid,$("form").serialize(),function(data){
		    	    			$("#roleinfo").modal('hide');
				    			alert("修改成功");
				    			LoadAjaxContent("roleadmin");
				    			history.go(0);
		    	    		});
		    	    	});
	    	    	});
	    	    	
	    	    });
	    
	    
	    });
	  });
	  
	 function deleterole(rid){
	 	$.ajax({
	     type: 'GET',
	     url: "deleterole/"+rid ,
	     success:function(data) {  
	             alert("删除成功！");  
	             LoadAjaxContent("roleadmin");
      	 }
		});
	 } 
	 
	  $(document).ready(function(){
	  	$("#addrole").click(function(){
	  		$("#roleinfo").modal();
	  		$("form").attr("action","adduser");
	  		$("#rolename").removeAttr("readonly");
	  		$("#rolename").val("");
	  		$.get("permissionlist",function(a){
	    	    	$("#roles").html("");
	    	    	for(var m=0;m<a.length;m++){
	    	    		$("#roles").append("<div class=\"checkbox-inline\"><label><input name='permissionname[]' value="+a[m].permissionname+" type=\"checkbox\">"+a[m].permissionname+"<i class=\"fa fa-square-o\"></i></label></div>");
	    	    	}
	    	});
	    	$("#btn").click(function(){
	    		if($("#rolename").val()=="")
	    		{
	    			alert("角色名不得为空");
	    			return false;
	    		}
	    		var a=$("input[type='checkbox']").size();
	    		var flag=false;
	    		for(var m=0;m<a;m++){
	    			if($("input[type='checkbox']").eq(m).is(':checked'))
	    				flag=true;
	    		}
	    		if(!flag){
	    			alert("必须选择至少选择一个权限");
	    			return false;
	    		}
	    		$.post("addrole",$("form").serialize(),function(){
	    			$("#roleinfo").modal('hide');
	    			alert("添加成功");
	    			LoadAjaxContent("roleadmin");
	    			history.go(0);
	    		});
	    	});
	    
	  	});
	  	
	  });
	 
    </script>
    <div id="roleinfo" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="myModalLabel">编辑角色信息</h4>
      </div>
      <form class="form-horizontal" method="post">
      <div class="modal-body">
        	<div class="row form-group">
			    <label for="rolename" class="col-sm-1 control-label">角色名</label>
			    <div class="col-sm-11">
			      <input type="text" name="rolename" class="form-control" id="rolename" readonly="readonly">
			    </div>
        	</div>
        	<h4 class="page-header">拥有权限</h4>
        	<div class="row form-group">
					<div class="col-sm-12" id="roles">
					</div>
			</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" id="btn" class="btn btn-primary">保存</button>
      </div>
      </form>
    </div>
  </div>
</div>