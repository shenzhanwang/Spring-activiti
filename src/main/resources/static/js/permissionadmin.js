    $(document).ready(function(){
	    var grid=$("#grid-data").bootgrid({
	        ajaxSettings: {
		        method: "GET"
    		},
	    	navigation:2,
  			columnSelection:false,
		    ajax:true,
		    url:"permissions",
		    formatters: {
		    "commands": function(column, row)
		    {
		            return "<button class=\"btn btn-xs btn-default ajax-link\" onclick=\"deletepermission("+row.pid+")\" data-row-id=\"" + row.pid + "\">删除</button>";
		    }
	    	}
	    
	    }).on("loaded.rs.jquery.bootgrid", function()
	    		{
	    	    	
	    	    });
	    
	  });
	  
	 function deletepermission(pid){
	 	$.ajax({
	     type: 'GET',
	     url: "deletepermission/"+pid,
	     success:function(data) {  
	             alert("删除成功！");  
	             LoadAjaxContent("permissionadmin");
      	 }
		});
	 } 
	 
	  $(document).ready(function(){
	  	$("#addpermission").click(function(){
	  		$("#permissioninfo").modal();
	  		$("#permissionname").val("");
	    	$("#btn").click(function(){
	    		if($("#permissionname").val()=="")
	    		{
	    			alert("权限名不得为空");
	    			return false;
	    		}
	    		$.post("addpermission",$("form").serialize(),function(){
	    			$("#permissioninfo").modal('hide');
	    			LoadAjaxContent("permissionadmin");
	    			history.go(0);
	    		});
	    	});
	    
	  	});
	  	
	  });
	 
