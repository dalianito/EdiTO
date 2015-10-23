<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<title>学生回访</title>
<style>
.student-basic-info-table tr{
    height: 37px;
}
</style>
<script src="<%=request.getContextPath()%>/js/content/consult.js"></script>
<link href="<%=request.getContextPath()%>/style/content/ui.fancytree.css" rel="stylesheet" type="text/css">
<script src="<%=request.getContextPath()%>/js/content/jquery.fancytree-all.js"></script>
<script src="<%=request.getContextPath()%>/js/content/dependsOn-1.0.2.js"></script>
<script>
$(function () {
    loadStudentBasicInfo("<s:property value='communication.customerUuid' />");	
});
</script>

<!-- Student Info Section -->
<div class="col-md-5">
    <legend>学生信息</legend>
<%@ include file="_student_basic_info.jsp"%>
<%@ include file="_student_communication_history.jsp"%>
</div>
<!-- End of Student Info Section -->


<div class="col-md-7">
    <legend>本次回访记录</legend>
    <form id="communication_form">
    <input type="hidden" name="followUpUuid" value="<s:property value='followUp.uuid' />" />
    <input type="hidden" name="action" value="submit" />
    <input type="hidden" name="personUuid" value="<s:property value='communication.customerUuid' />" />
    <input type="hidden" name="typeUuid" value="<s:property value='communicationTypeUuid' />" />

<div>
<table width="580" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
    <tr>
        <th width="130">预约类型</th>
        <td width="160"><s:property value="followUpType" /></td>
        <th width="130">预约时间</th>
        <td width="160"><s:date name="followUp.scheduledDateTime" format="yyyy-MM-dd HH:mm" /></td>
    </tr>
    <tr>
        <th width="130">详细记录</th>
        <td colspan="3">
            <textarea name="communicationDetails" style="width:400px;height:100px" ></textarea>
        </td>
    </tr>
    <tr>
        <th width="130">学生回访结论</th>
        <td colspan="3">
            <div>
                <input type="radio" name="studentDecision" value="考虑中"/>考虑中
                <input type="radio" name="studentDecision" value="拒绝"/>拒绝
                <input type="radio" name="studentDecision" value="报名"/>报名
            </div> 
            <div>
                <label class="choose-reason">请选择原因:</label>
                <s:iterator value="studentRefuseReasonOptions">
                <label>
                    <input type="checkbox" name="studentRefuseReasonUuid" value="<s:property value='uuid' />">
                    <s:property value="description" />
                </label>
                </s:iterator> 
                <s:iterator value="studentConsideringReasonOptions">
                <label>
                    <input type="checkbox" name="studentConsideringReasonUuid" value="<s:property value='uuid' />">
                    <s:property value="description" />
                </label>
                </s:iterator> 
            </div>
            <div>
                <label class="choose-reason">
                    <input type="checkbox" name="studentDecisionOther" value="1" /> 其他
                </label>
                <input type="text" name="studentDecisionOtherDescription"/>
            </div>
        </td>
    </tr>
</table>
                </div>
            <div style="margin-top:20px">
                <legend>下一步</legend>
                <div class="form-group">
                    <div class="row">
                        <div class="col-xs-3">
                            <label for="next_steps-0">
                              <input type="checkbox" name="followUps" id="next_steps-0" value="CALL_BACK" />
                              预约回访
                            </label>
                        </div>
                        <div class='col-xs-5 input-group date datetimepicker'>
                            <input type='text' class="form-control" name="CALL_BACK_TIME"/>
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-calendar"></span>
                            </span>
                        </div>
                    </div>
                </div>
                
                <div class="form-group">
                    <div class="row">
                        <div class="col-xs-3">
                            <label for="next_steps-1">
                              <input type="checkbox" name="followUps" id="next_steps-1" value="ONSITE_VISIT">
                              预约到访
                            </label>
                        </div>
                        <div class='col-xs-5 input-group date datetimepicker'>
                            <input type='text' class="form-control" name="ONSITE_VISIT_TIME"/>
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-calendar"></span>
                            </span>
                        </div>
                    </div>
                </div> 
                
                <div class="form-group">
                    <div class="row">
                        <div class="col-xs-3">
                            <label for="next_steps-2">
                              <input type="checkbox" name="followUps" id="next_steps-2" value="OPEN_CLASS">
                              邀请公开课
                            </label>
                        </div>
                        <div class='col-xs-5 input-group date datetimepicker'>
                            <input type='text' class="form-control" name="OPEN_CLASS_TIME"/>
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-calendar"></span>
                            </span>
                        </div>

                    </div>
                </div> 
            </div> 
    </form>
    <button id="complete_communication_btn" class="btn btn-primary">完成回访</button>
    <button id="cancel_communication_btn" class="btn btn-primary">取消回访</button>
    </div>
<!-- End of Consult Info Section -->
<link href="<%=request.getContextPath()%>/style/content/ui.fancytree.css" rel="stylesheet" type="text/css">
<script src="<%=request.getContextPath()%>/js/content/jquery.fancytree-all.js"></script>
<script type="text/javascript">

$(function(){
    $("#complete_communication_btn").click(function(){
        if (!confirm("提交后将不可修改! 您确认提交?")) {
            return;
        }
        var dataArray = $("#communication_form").serializeArray();

        $.ajax({
            type: "POST",
            data: dataArray,             
            async: false,
            dataType: "json",
            url: cp+"/ajaxs/content/consult/manage/save_communication.html" ,
            success: function(data){
                if (data["success"] == "success") {
                    $("#nextStepModal").modal({
                        backdrop: 'static',
                        keyboard: false
                    });
                } else {
                    alert("请求失败，请稍后重试!")
                }
            },
            error: function(){
                alert("请求失败，请稍后重试!");
            }
        })  
    })
})

</script>
<script type="text/javascript">
    $(function () {
        $('.datetimepicker').datetimepicker({
                sideBySide: true,
                locale: "zh-cn",
                format: "YYYY-MM-DD HH:mm"
        });
        
        $('#communication_form input[name="studentRefuseReasonUuid"]').dependsOn({
            '#communication_form input[name="studentDecision"]': {
                values:["拒绝"]
            }
        });
        $('#communication_form input[name="studentConsideringReasonUuid"]').dependsOn({
            '#communication_form input[name="studentDecision"]': {
                values:["考虑中"]
            }
        });
        $('.choose-reason').dependsOn({
            '#communication_form input[name="studentDecision"]': {
                values:["考虑中", "拒绝"]
            }
        });
        $('#communication_form input[name="studentDecisionOtherDescription"]').dependsOn({
            '#communication_form input[name="studentDecisionOther"]': {
                checked: true
            },
            '#communication_form input[name="studentDecision"]': {
                values:["考虑中", "拒绝"]
            }
        });
        
    });
</script>

<div class="modal fade" id="nextStepModal" tabindex="-1" role="dialog" 
   aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-body">
            您已经该学生的回访，请选择下一步:
         </div>
         <div class="modal-footer">
            <a href="<%=request.getContextPath()%>/pages/content/consult/manage/communication/my_todo_follow_ups.html" class="btn btn-default">待回访列表</a>
         </div>
      </div>
    </div>
</div>

<form id="form" name="form" method="post">
<input type="hidden" name="uuid" />
<input type="hidden" name="resultCode" /></form>
