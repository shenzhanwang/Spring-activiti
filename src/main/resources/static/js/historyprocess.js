    $(document).ready(function(){
    	$("#dept").hide();
	    var grid=$("#grid-data").bootgrid({
	    	navigation:2,
  			columnSelection:false,
		    ajax:true,
		    url:"getfinishprocess",
		    formatters: {
		    "process_instance_id": function(column, row){
		    	return row.leaveapply.process_instance_id;
		    },
		    "user_id":function(column, row){
		    	return row.leaveapply.user_id;
		    },
		    "leave_type":function(column, row){
		    	return row.leaveapply.leave_type;
		    },
		    "apply_time":function(column, row){
		    	return row.leaveapply.apply_time;
		    },
		    "commands": function(column, row)
		    {
		            return "<button class=\"btn btn-xs btn-default ajax-link command-run1\" data-row-id=\"" + row.leaveapply.process_instance_id + "\">查看详情</button>";
		    }
	    	}
	    
	    }).on("loaded.rs.jquery.bootgrid", function()
	    		{
	    	    grid.find(".command-run1").on("click", function(e)
	    	    {
	    	    	$("#processinfo").modal();
	    	    	var process_instance_id=$(this).data("row-id");
	    	    	$("#activity").html("<tr><th>活动名称</th><th>活动类型</th><th>办理人</th><th>活动开始时间</th><th>活动结束时间</th></tr>");
	    	    	$.post("processinfo",{"instanceid":process_instance_id},function(data){
	    	    		for(var a=0;a<data.length;a++)
	    	    			$("#activity").append("<tr><td>"+data[a].activityName+"</td><td>"+data[a].activityType+"</td><td>"+data[a].assignee+"</td><td>"+getLocalTime(data[a].startTime)+"</td><td>"+getLocalTime(data[a].endTime)+"</td></tr>");
	    	    	});
	    	    	
	    	    });
	    
	    
	    });
	  });
	  
	   function getLocalTime(nS) {  
 return new Date(parseInt(nS)).toLocaleString().replace(/:\d{1,2}$/,' ');  
}
