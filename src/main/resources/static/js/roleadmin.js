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
	    		$.get("/addrole",$("form").serialize(),function(){
	    			$("#roleinfo").modal('hide');
	    			alert("添加成功");
	    			LoadAjaxContent("roleadmin");
	    			history.go(0);
	    		});
	    	});
	    
	  	});
	  	
	  });
	 
