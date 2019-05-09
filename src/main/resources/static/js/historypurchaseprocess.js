    $(document).ready(function(){
    	$("#dept").hide();
	    var grid=$("#grid-data").bootgrid({
	    	navigation:2,
  			columnSelection:false,
		    ajax:true,
		    url:"getfinishpurchaseprocess",
		    formatters: {
		    "applyer":function(column, row){
		    	return row.purchaseapply.applyer;
		    },
		    "itemlist":function(column, row){
		    	return row.purchaseapply.itemlist;
		    },
		    "total":function(column, row){
		    	return row.purchaseapply.total;
		    },
		    "commands": function(column, row)
		    {
		            return "<button class=\"btn btn-xs btn-default ajax-link command-run1\" data-row-id=\"" + row.businessKey + "\">查看详情</button>";
		    }
	    	}
	    
	    }).on("loaded.rs.jquery.bootgrid", function()
	    		{
	    	    grid.find(".command-run1").on("click", function(e)
	    	    {
	    	    	$("#processinfo").modal();
	    	    	var ywh=$(this).data("row-id");
	    	    	$("#activity").html("<tr><th>活动名称</th><th>活动类型</th><th>办理人</th><th>活动开始时间</th><th>活动结束时间</th></tr>");
	    	    	$.post("processhis",{"ywh":ywh},function(data){
	    	    		for(var a=0;a<data.length;a++)
	    	    			$("#activity").append("<tr><td>"+data[a].activityName+"</td><td>"+data[a].activityType+"</td><td>"+data[a].assignee+"</td><td>"+getLocalTime(data[a].startTime)+"</td><td>"+getLocalTime(data[a].endTime)+"</td></tr>");
	    	    	});
	    	    	
	    	    });
	    
	    
	    });
	  });
	  
	   function getLocalTime(nS) {  
 return new Date(parseInt(nS)).toLocaleString().replace(/:\d{1,2}$/,' ');  
}
