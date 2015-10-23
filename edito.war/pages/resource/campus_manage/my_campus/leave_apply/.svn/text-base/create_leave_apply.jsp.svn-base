<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.ito.edito.util.Constants" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
	<title>新建请假申请</title>
</head>
<body>
<script>
Validation.init("resource/campus_manage/my_campus/leave_apply/create_leave_apply.xml");
var mark = true;
function createInstance(elementId){
	if(mark){
		if(Validation.excuteValidate(elementId)){
			if(confirm("确认操作？")){
				mark = false;
				var param = Submit.excute(elementId);
				$.post(cp+"/ajaxs/resource/campus/manage/my/campus/leave/apply/create_apply.html",param,function(data){
					location.href = cp + "/pages/resource/campus/manage/my/campus/leave/apply/query_leave_apply.html";
				});
			}
		}
	}
	else {
		alert("操作进行中，请勿重复点击！");
	}
}
$(document).ready(function(){
	$("label[name='instance(LeaveApplication).fromDt']").bind("propertychange",function() {
		var fromDate = $("[name='instance(LeaveApplication).fromDt']").val();
		var toDate = $("[name='instance(LeaveApplication).toDt']").val();
		if(fromDate!="" && toDate!=""){
			var iDays = DateDiff(toDate,fromDate)+1;
			$("#day").text(iDays);
			$("[name='instance(LeaveApplication).days']").val(iDays);
		}
		else{
			$("#day").text("");
			$("[name='instance(LeaveApplication).days']").val("");
		}
	});
	$("label[name='instance(LeaveApplication).toDt']").bind("propertychange",function() {
		var fromDate = $("[name='instance(LeaveApplication).fromDt']").val();
		var toDate = $("[name='instance(LeaveApplication).toDt']").val();
		if(fromDate!="" && toDate!=""){
			var iDays = DateDiff(toDate,fromDate)+1;
			$("#day").text(iDays);
			$("[name='instance(LeaveApplication).days']").val(iDays);
		}
		else{
			$("#day").text("");
			$("[name='instance(LeaveApplication).days']").val("");
		}
	});
});
function updateRelation(data){
	$("label[name='instance(LeaveApplication).departmentUuid']").val(data["employee"].departmentUuid);
}
function clearRelationData(relationId){
	$("label[name='instance(LeaveApplication).departmentUuid']").val("");
}
function showRelatedContent(){
	var leaveTypeUuid = $("label[name='instance(LeaveApplication).leaveTypeUuid']").val();
	$.post(cp+"/ajaxs/resource/campus/manage/my/campus/leave/apply/get_leave_notes.html",{uuid:leaveTypeUuid},function(data){
		$("#notes").html(data);
	});
}
</script>
<div style="font-family:黑体;font-size:20px;">&nbsp;请 假 申 请</div>
<br><br><br>
<form id="formA">
<input type="hidden" name="instance(Apply).stateUuid" value="<%=Constants.EXAMINATION_STATE_DOING %>"/>
<input type="hidden" name="instance(Apply).typeUuid" value="<%=Constants.APPLY_TYPE_UUID_LEAVE %>"/>
<table width="580" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="130">申请人：</th>
		<td width="160">
			<s:property value="#session.LOGIN_USER.person.name" />
		</td>
		<th width="130">组织机构：</th>
		<td width="160"><label name="instance(LeaveApplication).departmentUuid" class="BaseTree" javaClassName="Department" value="<s:property value='#session.LOGIN_EMPLOYEE.departmentUuid' />" validate="true" ></label>&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<th width="130">请假类别：</th>
		<td colspan="3"><label name="instance(LeaveApplication).leaveTypeUuid" class="BaseTree" javaClassName="LeaveType" ifHasRelated="true" validate="true" ></label>&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<th width="130">请假事由：</th>
		<td width="450" colspan="3"><textarea name="instance(LeaveApplication).leaveReason" style="width:410px;height:80px" validate="true" ></textarea>&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<th width="130">开始时间：</th>
		<td width="160"><label id="time1" name="instance(LeaveApplication).fromDt" class="DateTimeSingle" format="all" validate="true"></label>&nbsp;<font color="#996633">*</font></td>
		<th width="130">结束时间：</th>
		<td><label id="time2" name="instance(LeaveApplication).toDt" class="DateTimeSingle" format="all" validate="true"></label>&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<th width="130">请假天数：</th>
		<td width="450" colspan="3">
	   		<label id="day"></label>&nbsp;天<input type="hidden" name="instance(LeaveApplication).days">
	    </td>
	</tr>
	<tr>
		<th width="130">备注：</th>
		<td width="450" colspan="3">
	   		<div id="notes" style="color:red"></div>
	    </td>
	</tr>
</table>
<br>
<a href="javascript:createInstance('formA')">
<img src="<%=request.getContextPath()%>/images/button/b_confirm_2.gif" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="<%=request.getContextPath()%>/pages/resource/campus/manage/my/campus/leave/apply/query_leave_apply.html" >
<img src="<%=request.getContextPath()%>/images/button/b_cancel.gif" /></a>
<br>
</form>
</body>
</html>
