<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>我的待回访</title>
</head>

<body>
<form id="form" name="form" method="post"><input type="hidden"
    name="uuid" /> <input type="hidden" name="resultCode" /></form>
<script>
$(document).ready(function(){
    currentResultTableDivWidth = 720;
    execute();
});
var hashedFollowUpData = {};
function execute(){
    var data = {offset:1, recnum:24, status: "未开始"};
    $.ajax({
        type: "POST",
        url: cp+"/ajaxs/content/consult/manage/query_my_follow_ups.html",
        data:data,
        cache: false,
        dataType: "json",
        success: function(msg){
            if(msg!=null){
                $("#result").pagination({
                    totalRecord:msg[1],
                    dataStore:msg[0],
                    proxyUrl:cp+"/ajaxs/content/consult/manage/query_my_follow_ups.html",
                    data:data,
                    currentPage:1,
                    perPage:24,
                    toolbarType:"pgBlueToolbar",
                    barPosition:"top&bottom",
                    pageType:"show"
                });
            }
        },
        error: function(){
            alert("请求失败或超时，请稍后再试！");
            return;
        }
    })
}
function addData(dataStore){
    var buffer="";
    buffer += "<div class='resultTableDiv' style='width:" + currentResultTableDivWidth + "px;overflow:auto'>";
    buffer += "<table width='720' border='0' cellpadding='0' cellspacing='0' class='InfoListPanel_color'>";
    buffer += "<tr><th width='100'>回访时间</th><th width='80'>学生姓名</th><th width='115'>联系方式</th><th>学生结论</th><th>回访类型</th><th>状态</th><th>操作</th></tr>";
    for(var i=0;i<dataStore.length;i++){
        if(i%2==0){
            buffer += "<tr class='tr1' ";
        }
        else {
            buffer += "<tr class='tr2' ";
        }
        buffer += "followUpUuid='" + dataStore[i][0] + "' ";
        buffer += "communicationUuid='" + dataStore[i][1] + "'>";
        buffer += "<td align='center'>"+dataStore[i][2]+"</td>";
        buffer += "<td align='center'>"+dataStore[i][3]+"</td>";
        buffer += "<td align='center'>"+dataStore[i][4]+"</td>";
        buffer += "<td align='center'>"+dataStore[i][5]+"</td>";
        buffer += "<td align='center'>"+dataStore[i][6]+"</td>";
        buffer += "<td align='center'>"+dataStore[i][7]+"</td>";
        buffer += "<td align='center'>";
        buffer += "<a href='javascript:showInstance(\""+dataStore[i][1]+"\",\"\",\"/views/content/consult/manage/communication/view_communication_info.html\",520,620)'>查看</a>&nbsp;";
        buffer += "<a href='" + cp + "/https/content/consult/manage/communication/follow_up.html?followUpUuid="+dataStore[i][0]+"'>回访</a>&nbsp;";
        buffer += "<a href='javascript:changeFollowUpTime(\"" + dataStore[i][0] + "\")'>更改时间</a>&nbsp;";
        buffer += "<a href='javascript:transferFollowUp(\"" + dataStore[i][0] + "\")'>转让</a>&nbsp;";
        buffer += "<a href='javascript:cancelFollowUp(\"" + dataStore[i][0] + "\")'>取消</a>";
        buffer += "</td>";
        buffer += "</tr>";
        hashedFollowUpData[dataStore[i][0]] = dataStore[i];
    }
    buffer += "</table></div>";
    return buffer;
}

function transferFollowUp(followUpUuid){
	$("#myModal").modal();
	$("#transferForm input[name='followUpUuid']").val(followUpUuid);
    setModalData("myModal", followUpUuid); 
    
    $.ajax({
        type: "POST",
        url: cp+"/ajaxs/content/consult/manage/consultant/query_active_consultants.html",
        dataType: 'json',
        success: function(result){
        	if (!result || result.length == 0) {
                alert("请求失败，暂时无法获得咨询师列表，请稍后重试!");
                $('#myModal').modal('hide');
                return;
            }
        	$("#consultantList").html("<tr><th class='col-xs-2'></th><th class='col-xs-5'>员工号</th><th class='col-xs-5'>咨询师</th></tr>");
        	
        	for (var i=0; i<result.length; i++){
        		var newRow = "<tr>";
        		newRow += "<td><input type='radio' name='employeeUuid' value='" + result[i].uuid + "'></td>";	
        		newRow += "<td>" + result[i].personNo + "</td>";
        		newRow += "<td>" + result[i].name + "</td>";
        		newRow += "</tr>";
        		$("#consultantList").append(newRow);
        	}
        },
        error: function(){
            alert("请求失败，暂时不能获取咨询师列表，稍后请重试!");
            $('#myModal').modal('hide');
        }
    }) 
}

function setModalData(modalId, followUpUuid) {
	var followUpData = hashedFollowUpData[followUpUuid];   
    $("#" + modalId + " .scheduledDateTime").html(followUpData[2]);
    $("#" + modalId + " .type").html(followUpData[6]);
    $("#" + modalId + " .status").html(followUpData[7]);
    $("#" + modalId + " .studentName").html(followUpData[3]);
    $("#" + modalId + " .contactInfo").html(followUpData[4]);
    $("#" + modalId + " .consultDecision").html(followUpData[5]);
}

function changeFollowUpTime(followUpUuid){
	$("#changeTimeModal").modal();
	$("#changeTimeForm input[name='followUpUuid']").val(followUpUuid);
    setModalData("changeTimeModal", followUpUuid);	
}

function cancelFollowUp(followUpUuid){
    if (confirm("取消后不可更改，确定取消？")){
    	$.ajax({
            type: "POST",
            url: cp+"/ajaxs/content/consult/manage/communication/cancel_follow_up.html",
            data: {followUpUuid: followUpUuid},
            success: function(result){
            	alert("成功的取消了回访!");
            	execute();
            },
            error: function(){
                alert("请求失败，暂时不能取消当前回访，稍后请重试!");
            }
        }) 
    }	
}
</script>
<div id="result" class="bigResultCon" style="width: 720px; margin-left: -10px"></div>
<div class="modal fade" id="changeTimeModal" tabindex="-1" role="dialog" 
   aria-labelledby="changeTimeModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" 
               aria-hidden="true">×
            </button>
            <h4 class="modal-title" id="changeTimeModalLabel">
                更改回访时间
            </h4>
         </div>
         <div class="modal-body">
            <form id="changeTimeForm">
            <div id="curFollowUpInfo">
                <legend>要更改的回访信息</legend>
                <input type="hidden" name="followUpUuid" />
                <table class="table table-condensed" style="margin:auto">
                    <tr>
                        <th>回访时间</th>
                        <td class="scheduledDateTime"></td>
                        <th>回访类型</th>
                        <td class="type"></td>
                        <th>状态</th>
                        <td class="status"></td>
                    </tr>    
                    <tr>
                        <th>学生姓名</th>
                        <td class="studentName"></td>
                        <th>联系方式</th>
                        <td class="contactInfo"></td>
                        <th>咨询结论</th>
                        <td class="consultDecision"></td>
                    </tr> 
                </table>
            </div>
            <div style="margin-top:20px">
                <legend>新的时间</legend>
                <div class="row">
                        <div class="col-xs-3">
                            <label for="next_steps-2">
                                请选择新的时间
                            </label>
                        </div>
                        <div class='col-xs-5 input-group date datetimepicker'>
                            <input type='text' class="form-control" name="newTime"/>
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-calendar"></span>
                            </span>
                        </div>

                    </div>
            </div>
            </form>
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-default" 
               data-dismiss="modal">取消
            </button>
            <button type="button" class="btn btn-primary" id="confirmTimeChange">
                确定更改
            </button>
         </div>
      </div><!-- /.modal-content -->
   </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" 
   aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" 
               aria-hidden="true">×
            </button>
            <h4 class="modal-title" id="myModalLabel">
                将回访转让给其他咨询师
            </h4>
         </div>
         <div class="modal-body">
            <form id="transferForm">
            <p>请选择新的咨询师去跟进这个回访:</p>
            <div id="curFollowUpInfo">
                <legend>要转让的回访信息</legend>
                <input type="hidden" name="followUpUuid" />
                <table class="table table-condensed" style="margin:auto">
                    <tr>
                        <th>回访时间</th>
                        <td class="scheduledDateTime"></td>
                        <th>回访类型</th>
                        <td class="type"></td>
                        <th>状态</th>
                        <td class="status"></td>
                    </tr>    
                    <tr>
                        <th>学生姓名</th>
                        <td class="studentName"></td>
                        <th>联系方式</th>
                        <td class="contactInfo"></td>
                        <th>咨询结论</th>
                        <td class="consultDecision"></td>
                    </tr> 
                </table>
            </div>
            <div style="margin-top:20px">
                <legend>咨询师列表</legend>
                <table id="consultantList" class="table table-hover" style="margin:auto">
                </table>
            </div>
            </form>
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-default" 
               data-dismiss="modal">取消
            </button>
            <button type="button" class="btn btn-primary" id="confirmTransfer">
                确定转让
            </button>
         </div>
      </div><!-- /.modal-content -->
   </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<script>
$(document).ready(function() {
	 $('#confirmTransfer').click(function() {
		 if ($("#transferForm input[name='employeeUuid']:checked").size() != 1) {
			 alert("请至少选择一个新的咨询老师！");
			 return;
		 }
		 if (confirm("确定要转让么？")) {
	        $.ajax({
	            type: "POST",
	            url: cp+"/ajaxs/content/consult/manage/communication/transfer_follow_up.html",
	            data: $("#transferForm").serialize(),
	            success: function(){
	                $('#myModal').modal('hide');
	                execute();
	            },
	            error: function(){
	                alert("请求失败，请重试!");
	            }
	        })
	    } 	
	 })
	 
	 $('#confirmTimeChange').click(function() {
		 var newTime = $("#changeTimeForm input[name='newTime']").val();
		 if (!/201[5-9]-[0-1][0-9]-[0-3][0-9] [0-2][0-9]:[0-5][0-9]/.test(newTime)) {
			 alert("请填入正确格式的日期！");
			 return;
		 }
         if (confirm("确定要更改时间么？")) {
            $.ajax({
                type: "POST",
                url: cp+"/ajaxs/content/consult/manage/communication/change_follow_up_time.html",
                data: $("#changeTimeForm").serialize(),
                success: function(){
                    $('#changeTimeModal').modal('hide');
                    execute();
                },
                error: function(){
                    alert("请求失败，请重试!");
                }
            })
        }   
     })

     $('.datetimepicker').datetimepicker({
         sideBySide: true,
         locale: "zh-cn",
         format: "YYYY-MM-DD HH:mm"
     });
})
</script>

</body>
</html>
