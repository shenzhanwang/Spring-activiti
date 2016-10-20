<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
     <!--Start Breadcrumb-->
<div class="row">
	<div id="breadcrumb" class="col-xs-12">
	<a href="#" class="show-sidebar">
						  <i class="fa fa-bars"></i>
						</a>
		<ol class="breadcrumb pull-left">
			<li><a href="index">首页</a></li>
			<li><a href="#">我的待办任务</a></li>
			<li><a href="#">请假待办</a></li>
			<li><a href="#">调整申请</a></li>
		</ol>
	</div>
</div>       
            <div class="container-fluid">
                       <div class="row">
                    <div class="col-lg-12">
                        <div class="box ui-draggable ui-droppable">
				<div class="box-header">
					<div class="box-name">
						<i class="fa fa-coffee"></i> <span>调整申请</span>
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
							                <th data-column-id="user_id" data-identifier="true" data-type="numeric">申请人</th>
							                <th data-column-id="leave_type">类型</th>
							                <th data-column-id="start_time">请假开始时间</th>
							                <th data-column-id="end_time">请假结束时间</th>
							                <th data-column-id="reason">请假原因</th>
							                <th data-column-id="taskid">任务ID</th>
							                <th data-column-id="taskname">任务名称</th>
							                <th data-column-id="process_instance_id" >流程实例ID</th>
							                <th data-formatter="taskcreatetime" data-column-id="taskcreatetime">任务创建时间</th>
							                <th data-formatter="commands">操作</th>
							            </tr>
							        </thead>
							    </table>
                            </div>
                        </div>
                    </div>
                </div>
	<div class="row">
		<div class="col-lg-12">
			<div class="box ui-draggable ui-droppable" id="dept">
				<div class="box-header">
					<div class="box-name">
						<i class="fa fa-search"></i> <span>调整申请</span>
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
						<form role="form" action="" method="post">
                                	 <div class="form-group">
						                <label>申请人</label>
						                <input class="form-control" id="userid" readonly="readonly">
						              </div>
						             <div class="form-group">
						                <label>申请时间</label>
						                <input class="form-control" id="applytime" readonly="readonly">
						             </div>
                                	<div class="form-group">
						                <label>开始时间</label>
						                <input class="form-control" id="startime" name="start_time">
						             </div>
						             <div class="form-group">
						                <label>结束时间</label>
						                <input class="form-control" id="endtime" name="end_time">
						             </div>
						             <div class="form-group">
						                <label>请假类型</label>
						                <select name="leave_type" class="form-control">
						                  <option value="事假">事假</option>
						                  <option value="病假">病假</option>
						                  <option value="年假">年假</option>
						                  <option value="丧假">丧假</option>
						                  <option value="产假">产假</option>
						                </select>
						              </div>
						             <div class="form-group">
						                <label>请假原因</label>
						                 <input class="form-control" id="reason" name="reason">
						             </div>    
						             <div class="form-group">
						                <label>是否继续申请</label>
						                <div class="controls">
											<select name="reapply">
												<option value="true">重新申请</option>
												<option value="false">不再申请</option>
											</select>
										</div>
						             </div> 
						              <button id="btn" type="button" class="btn btn-default">完成</button>
                                </form>
				</div>
			</div>

		</div>
	</div>

</div>
            
            
            
    <script type="text/javascript">
    
    $(document).ready(function(){
	$('#startime').datepicker({setDate: new Date(), dateFormat: 'yy-mm-dd'});
	$('#endtime').datepicker({setDate: new Date(), dateFormat: 'yy-mm-dd'});
    
    	$("#dept").hide();
	    var grid=$("#grid-data").bootgrid({
	    	navigation:2,
  			columnSelection:false,
		    ajax:true,
		    url:"updatetasklist",
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
	    	    		$("#reason").val(data.reason);
	    	    		$("#type").val(data.leave_type);
	    	    		$("#userid").val(data.user_id);
	    	    		$("#startime").val(data.start_time);
	    	    		$("#endtime").val(data.end_time);
	    	    		$("#applytime").val(data.apply_time);
	    	    		$("form").attr("action","task/updatecomplete/"+taskid);
	    	    	});
	    	    	$("#dept").show();
	    	    	$("#btn").click(function(){
	    		    	$.post("task/updatecomplete/"+taskid,$("form").serialize(),function(a){
	    		    		alert("处理成功");
	    		    		LoadAjaxContent("modifyapply");
	    		    	});
	    	    	
	    	    });
	    	    });
	    
	    
	    });
	  });
	  
	   function getLocalTime(nS) {  
 return new Date(parseInt(nS)).toLocaleString().replace(/:\d{1,2}$/,' ');  
}
    </script>
