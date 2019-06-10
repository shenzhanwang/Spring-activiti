    $(document).ready(function(){
	    var grid=$("#grid-data").bootgrid({
	        ajaxSettings: {
		        method: "GET"
    		},
    		rowCount:5,
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
	    		$.get("adduser",$("form").serialize(),function(){
	    			$("#userinfo").modal('hide');
	    			alert("添加成功");
	    			LoadAjaxContent("useradmin");
	    			history.go(0);
	    		});
	    	});
	    
	  	});
	  	
	  });
