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
<body class="BodyView">
<script>
Validation.init("wechat/common_work/wechat_work_record.xml");

$(document).ready(function(){
	var now = new Date();
	var year = now.getFullYear();
    var month = now.getMonth() + 1;
    var day = now.getDate();
	var nowTime = year + "-" + (month < 10 ? "0" + month : month) + "-" + (day < 10 ? "0" + day : day);
	$("#nowTime").html(nowTime);
});
var mark = true;
function execute(elementId){
	if(mark){
		if(Validation.excuteValidate(elementId)){
			if(confirm("确认操作？")){
			mark = false;
			var param = Submit.excute(elementId);
				$.post(cp+"/ajaxs/wechat/common/work/create_wechat_work_record.whtml",param,function(data){
					if(data != null){
						$("#workRecordUuidA").val(data);
						goBack();
						mark = true;
					}
					else {
						alert("网络慢，请重新访问本页！");
					}
				});
			}
		}
	}
	else {
		alert("操作进行中，请勿重复点击！");
	}
}

function goBack(){
	var employeeUuid = $("#employeeUuid").val();
	location.href = cp + "/whttps/wechat/common/work/wechat_work_record.whtml_" + employeeUuid;
}
</script>

<input type="hidden" id="pageTitle" value="工 作 日 志" />
<br>
<s:if test="#request.workRecord == null">
<form id="formA" >
<input type="hidden" id="workRecordUuidA" name="instance(WorkRecord).uuid" />
<input type="hidden" id="employeeUuid" name="instance(WorkRecord).recordUuid" value="<%=request.getParameter("uuid")%>" />
<table style="width:100%" cellspacing="0" cellpadding="0" border="0" class="InputPanel">
	<tr>
		<th width="30%">记录时间</th>
		<td width="70%"><div id="nowTime"></div></td>
	</tr>
	<tr>
		<th width="30%">今日工作<br>总结</th>
		<td width="70%"><textarea name="instance(WorkRecord).summary" style="width:90%;height:110px;word-wrap:break-word;word-break:break-all;" validate="true" ></textarea>&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<th width="30%">明日工作<br>计划</th>
		<td width="70%"><textarea name="instance(WorkRecord).schedule" style="width:90%;height:110px;word-wrap:break-word;word-break:break-all;" validate="true" ></textarea>&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<th width="30%">今日工作<br>感受</th>
		<td width="70%"><textarea name="instance(WorkRecord).share" style="width:90%;height:110px;word-wrap:break-word;word-break:break-all;" validate="true" ></textarea>&nbsp;<font color="#996633">*</font></td>
	</tr>
</table>
</form>
<p align="center">
<img src="<%=request.getContextPath()%>/images/button/b_wechat_confirm.gif" onClick="execute('formA')" style="cursor:hand"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<img src="<%=request.getContextPath()%>/images/button/b_wechat_close.gif" onClick="goBack()" style="cursor:hand"/>
</p>
</s:if>
<s:else>
<form id="formB">
<input type="hidden" name="instance(WorkRecord).uuid" value="<s:property value='#request.workRecord.uuid' />" />
<input type="hidden" name="instance(WorkRecord).recordUuid" value="<s:property value='#request.employee.uuid' />"/>
<input type="hidden" id="employeeUuid" value="<s:property value="#request.employee.uuid" />" />
<table style="width:100%" cellspacing="0" cellpadding="0" border="0" class="InputPanel" >
	<tr>
		<th width="30%">记录人</th>
		<td width="70%"><s:property value="#request.employee.person.name" /></td>
	</tr>
	<tr>
		<th width="30%">记录时间</th>
		<td width="70%"><s:date name="#request.workRecord.recordTime" format="yyyy-MM-dd" /></td>
	</tr>
	<tr>
		<th width="30%">今日工作<br>总结</th>
		<td width="70%"><textarea name="instance(WorkRecord).summary" style="width:90%;height:110px;word-wrap:break-word;word-break:break-all;" validate="true" ><s:property value="#request.workRecord.summary" /></textarea>&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<th width="30%">明日工作<br>计划</th>
		<td width="70%"><textarea name="instance(WorkRecord).schedule" style="width:90%;height:110px;word-wrap:break-word;word-break:break-all;" validate="true" ><s:property value="#request.workRecord.schedule" /></textarea>&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<th width="30%">今日工作<br>感受</th>
		<td width="70%"><textarea name="instance(WorkRecord).share" style="width:90%;height:110px;word-wrap:break-word;word-break:break-all;" validate="true" ><s:property value="#request.workRecord.share" /></textarea>&nbsp;<font color="#996633">*</font></td>
	</tr>
</table>
</form>
<p align="center">
<img src="<%=request.getContextPath()%>/images/button/b_wechat_save.gif" onClick="execute('formB')"  style="cursor:hand"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<img src="<%=request.getContextPath()%>/images/button/b_wechat_close.gif" onClick="goBack()"  style="cursor:hand"/>
</p>
</s:else>
</body>
</html>
