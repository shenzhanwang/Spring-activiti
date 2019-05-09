  $(document).ready(function(){
	  $("#upload").submit(function(){
	    if($("#fileupload").val()=="")
	    {
	    	alert("请选择工作流文件上传");
	    	return false;
	    }
	  });
	  
  });
  
  $(document).ready(function(){
	    var grid =$("#grid-data").bootgrid({
	    ajax:true,
	    rowCount:10,
	    navigation:2,
	    columnSelection:false,
	    url:"getprocesslists",
	        formatters: {
	        "commands": function(column, row)
	        {
	            return "<button type=\"button\" class=\"btn btn-xs btn-info command-delete\" data-row-id=\"" + row.deploymentId + "\">删除</button>";
	        },
	        "resname":function(column, row)
	        {
	            return "<a target=\"_blank\" href=\"showresource?pdid="+row.id+"&resource="+row.resourceName+"\">"  + row.resourceName + "</a>";
	        },
	        "picname":function(column, row)
	        {
	        	return "<a target=\"_blank\" href=\"showresource?pdid="+row.id+"&resource="+row.diagramresourcename+"\">"  + row.diagramresourcename + "</a>";
	        },
	    	}
	    }).on("loaded.rs.jquery.bootgrid", function()
		{
		    grid.find(".command-delete").on("click", function(e)
			    {
			        $.post("deletedeploy",{deployid:$(this).data("row-id")},function(){
			        	alert("删除成功");
			        	$("#grid-data").bootgrid("reload");
			        });
			    });
		    });
	  });
