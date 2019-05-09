    $(document).ready(function(){
    	$("#dept").hide();
	    var grid=$("#grid-data").bootgrid({
	    	navigation:2,
  			columnSelection:false,
		    ajax:true,
		    url:"mypurchaseprocess",
		    formatters: {
		    "commands": function(column, row)
		    {
		            return "<a class=\"btn btn-xs btn-default ajax-link\" target=\"_blank\" href=\"traceprocess/" + row.processInstanceid + "\">查看详情</a>";
		    }
	    	}
	    
	    }).on("loaded.rs.jquery.bootgrid", function()
	    		{
	    });
	  });
	  
	   
