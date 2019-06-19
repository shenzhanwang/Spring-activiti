    $(document).ready(function(){
    $('#realstart_time').datepicker({setDate: new Date(), dateFormat: 'yy-mm-dd'});
	$('#realend_time').datepicker({setDate: new Date(), dateFormat: 'yy-mm-dd'});
    
    	$("#dept").hide();
	    var grid=$("#grid-data").bootgrid({
	    	navigation:2,
  			columnSelection:false,
		    ajax:true,
		    url:"xjtasklist",
		    formatters: {
		    "taskcreatetime":function(column, row){
		    	return getLocalTime(row.taskcreatetime);
		    },
		    "commands": function(column, row)
		    {
		            return "<button class=\"btn btn-xs btn-default ajax-link command-run1\" data-row-id=\"" + row.taskid + "\">处理</button>";
		    }
	    	}
	    
	    }).on("loaded.rs.jquery.bootgrid", function()
	    		{
	    	    grid.find(".command-run1").on("click", function(e)
	    	    {
	    	    	var taskid=$(this).data("row-id");
	    	    	$.post("dealtask",{"taskid":taskid},function(data){
	    	    		var obj = data;
	    	    		$("#reason").val(obj.reason);
	    	    		$("#type").val(obj.leave_type);
	    	    		$("#userid").val(obj.user_id);
	    	    		$("#startime").val(obj.start_time);
	    	    		$("#endtime").val(obj.end_time);
	    	    		$("#applytime").val(obj.apply_time);
	    	    		$("form").attr("action","task/reportcomplete/"+taskid);
	    	    	});
	    	    	$("#dept").show();
	    	    	$("#btn").click(function(){
	    		    	$.post("task/reportcomplete/"+taskid,$("form").serialize(),function(a){
	    		    		alert("处理成功");
	    		    		LoadAjaxContent("reportback");
	    		    	});
	    	    	
	    	    });
	    	    });
	    
	    
	    });
	  });
	  
	  
	  function getLocalTime(nS) {  
 return new Date(parseInt(nS)).toLocaleString().replace(/:\d{1,2}$/,' ');  
}
