<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*, java.text.*" %>   
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no">
<meta name="format-detection" content="telephone=no" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta http-equiv="pragma" content="no-cache" />
<head>
	<title>富海教育</title>
</head>
<body class="BodyView" >
<script>
$(document).ready(function(){
	var now = new Date();
	var year = now.getFullYear();
    var month = now.getMonth() + 1;
    var day = now.getDate();
	var reviewTime = year + "-" + (month < 10 ? "0" + month : month) + "-" + (day < 10 ? "0" + day : day);
	$("#reviewTime").html(reviewTime);

	var summary = $("#summary").val().replace(/\n/g,'<br>');
	var schedule = $("#schedule").val().replace(/\n/g,'<br>');
	var share = $("#share").val().replace(/\n/g,'<br>');
	$("#summaryV").html(summary);
	$("#scheduleV").html(schedule);
	$("#shareV").html(share);
	
	
});
var mark = true;
function execute(){
	var workRecordUuid = $("#workRecordUuid").val();
	var employeeUuid = $("#employeeUuid").val();
	var reviewComment = $("#reviewComment").val();
	
	var data = {workRecordUuid:workRecordUuid,employeeUuid:employeeUuid,reviewComment:reviewComment};
	if(mark){
		if(confirm("确认操作？")){
			mark = false;
			$.post(cp+"/whttps/wechat/approval/work/edito_workRecord_review.whtml", data,function(){
				alert("审阅完成！");	
				mark = true;
				goBack();
			});
		}
	}
	else {
		alert("操作进行中，请勿重复点击！");
	}
}

function goBack(){
	var employeeUuid = $("#employeeUuid").val();
	location.href = cp + "/whttps/wechat/approval/work/wechat_work_review.whtml_" + employeeUuid;
}
</script>

<input type="hidden" id="pageTitle" value="工 作 日 志 审 阅" />
<input type="hidden" id= "workRecordUuid" value="<s:property value="#request.workRecord.uuid" />" />
<input type="hidden" id="employeeUuid" value="<s:property value="#request.employee.uuid" />" />
<input type="hidden" id="summary" value="<s:property value="#request.workRecord.summary" />" />
<input type="hidden" id="schedule" value="<s:property value="#request.workRecord.schedule" />" />
<input type="hidden" id="share" value="<s:property value="#request.workRecord.share" />" />
<br>
<table style="width:100%" cellspacing="0" cellpadding="0" border="0" class="InputPanel">
	<tr>
		<th width="35%">记录人</th>
		<td width="65%"><s:property value="#request.workRecord.record.person.name" /></td>
	</tr>
	<tr>
		<th width="35%">组织机构</th>
		<td width="65%"><s:property value="#request.workRecord.record.department.description" /></td>
	</tr>
	<tr>
		<th width="35%">校区</th>
		<td width="65%"><s:property value="#request.workRecord.record.campus.description" /></td>
	</tr>
	<tr>
		<th width="35%">审阅状态</th>
		<td width="65%">
			<select id="reviewFlagUuid">
				<option>已审阅</option>
			</select>
		</td>
	</tr>
	<tr>
		<th width="35%">记录时间</th>
		<td width="65%"><s:date name="#request.workRecord.recordTime" format="yyyy-MM-dd" /></td>
	</tr>
	<tr>
		<th width="35%">今日工作<br>总结</th>
		<td id="summaryV" style="height:104px;word-break:break-all;vertical-align:top;padding-top:5px" ></td>
	</tr>
	<tr>
		<th width="35%">明日工作<br>计划</th>
		<td id="scheduleV" style="height:104px;word-break:break-all;vertical-align:top;padding-top:5px"></td>
	</tr>
	<tr>
		<th width="35%">今日工作<br>感受</th>
		<td id="shareV" style="height:104px;word-break:break-all;vertical-align:top;padding-top:5px" ></td>
	</tr>
	<tr>
		<th width="35%">评语</th>
		<td style="word-wrap:break-word;word-break:break-all;"><textarea id="reviewComment" style="width:90%;height:100px" ></textarea></td>
	</tr>
	<tr>
		<th width="35%">审阅人</th>
		<td width="65%"><s:property id="reviewer" value="#request.employee.person.name" /></td>
	</tr>
	<tr>
		<th width="35%">审阅时间</th>
		<td width="65%"><div id="reviewTime"></div></td>
	</tr>
</table>
<p align="center">
<img src="<%=request.getContextPath()%>/images/button/b_wechat_confirm.gif" onClick="execute()"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<img src="<%=request.getContextPath()%>/images/button/b_wechat_close.gif" onClick="goBack()" />
</p>
</body>
</html>
