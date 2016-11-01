<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
     <!--Start Breadcrumb-->
<div class="row">
	<div id="breadcrumb" class="col-xs-12">
	<a href="#" class="show-sidebar">
						  <i class="fa fa-bars"></i>
						</a>
		<ol class="breadcrumb pull-left">
			<li><a href="index">首页</a></li>
			<li><a href="#">已结束流程数据查询</a></li>
			<li><a href="#">我的采购历史</a></li>
		</ol>
	</div>
</div>       
            <div class="container-fluid">
                       <div class="row">
                    <div class="col-lg-12">
                    <div class="box ui-draggable ui-droppable">
				<div class="box-header">
					<div class="box-name">
						<i class="fa fa-coffee"></i> <span>我的采购历史数据</span>
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
                                <table id="grid-data" class="table table-condensed table-hover table-striped">
							        <thead>
							            <tr>
							                <th data-column-id="businessKey">业务号</th>
							                <th data-formatter="applyer" data-column-id="applyer">申请人</th>
							                <th data-formatter="itemlist" data-column-id="itemlist">采购内容</th>
							                <th data-formatter="total" data-column-id="total">总金额</th>
							                <th data-formatter="commands">查看详情</th>
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
    </script>
<div id="processinfo" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="myModalLabel">流程活动记录</h4>
      </div>
      <div class="modal-body">
				<table id="processdata"
					class="table table-condensed table-hover table-striped">
					<thead id="activity">
						
					</thead>
				</table>
			</div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>