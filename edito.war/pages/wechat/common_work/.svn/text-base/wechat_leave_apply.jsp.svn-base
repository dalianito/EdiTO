<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ page import="com.ito.edito.util.Constants" %>
<html>
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no">
<meta name="format-detection" content="telephone=no" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta http-equiv="pragma" content="no-cache" />
<head>
	<title>富海教育</title>
	<script>var cp="<%=request.getContextPath()%>";</script>
</head>

<body class="BodyView">
<script>
Validation.init("wechat/common_work/wechat_leave_apply.xml");

var mark = true;
function createInstance(elementId){
	if(mark){
		var leaveTypeUuid = $("#leaveTypeUuid").val();
		if(leaveTypeUuid != "null"){
			$("input[name='instance(LeaveApplication).leaveTypeUuid']").val($("#leaveTypeUuid").val());
		}
		var fromDt = $("#y1").val()+"-"+($("#m1").val()<10 ? "0"+$("#m1").val() : $("#m1").val())+"-"+($("#d1").val()<10 ? "0"+$("#d1").val() : $("#d1").val())+" 00:00:00";
		var toDt = $("#y2").val()+"-"+($("#m2").val()<10 ? "0"+$("#m2").val() : $("#m2").val())+"-"+($("#d2").val()<10 ? "0"+$("#d2").val() : $("#d2").val())+" 00:00:00";
		$("input[name='instance(LeaveApplication).fromDt']").val(fromDt);	
		$("input[name='instance(LeaveApplication).toDt']").val(toDt);	
		$("input[name='instance(LeaveApplication).days']").val($("#leaveDays").html());

		if(Validation.excuteValidate(elementId)){	
			if(confirm("确认操作？")){
				var oDate1,oDate2;  
				oDate1 = new Date(fromDt);
				oDate2 = new Date(toDt);
				if(oDate1>oDate2) {
					iDays="";
					alert("请假结束时间不得早于开始时间！ 请核实后在提交");
					return;
				}else{
					var param = Submit.excute(elementId);
					mark = false;
					$.post(cp+"/ajaxs/wechat/common/work/create_wechat_leave_apply.whtml",param,function(){
						alert("请假申请已提交！");
						goQuery();
						WeixinJSBridge.call("closeWindow");
					});
				}
		   	}
		}
	}
	else {
		alert("操作进行中，请勿重复点击！");
	}
}
$(document).ready(function(){
	generateDate("1",null);
	generateDate("2",null);
	calLeaveDay();
});
function showNotes(){
	var leaveTypeUuid = $("#leaveTypeUuid").val();
	if(leaveTypeUuid != "null"){
		$.post(cp+"/ajaxs/wechat/common/work/get_leave_notes.whtml",{uuid:leaveTypeUuid},function(data){
			//$("#notes").html(data);
		});
	}
	else if(leaveTypeUuid == "null"){
		$("#notes").html("");
	}
}
function generateDate(flag, field){
	var year, month, day;
	if(field == null){
		var date = new Date();
		year = date.getFullYear();
		month = date.getMonth() + 1;
		day = date.getDate();
		for(var i=0; i<3; i++){
			var yearS = year + i;
			$("#y"+flag).append("<option value='"+yearS+"'>"+yearS+"</option>");
		}
		for(var i=1; i<=12; i++){
			var monthS = i<10 ? "0"+i : i;
			var selected = i==month ? "selected='selected'" : "";
			$("#m"+flag).append("<option value='"+i+"' "+selected+">"+monthS+"</option>");
		}
		var days;
		if(month==1 || month==3 || month==5 || month==7 || month==8 || month==10 || month==12){
			days = 31;
		}
		else if(month==4 || month==6 || month==9 || month==11){
			days = 30;
		}
		else if((year%100!=0 && year%4==0) || (year%400==0)){
			days = 29;
		}
		else {
			days = 28;
		}
		for(var i=1; i<=days; i++){
			var dayS = i<10 ? "0"+i : i;
			var selected = i==day ? "selected='selected'" : "";
			$("#d"+flag).append("<option value='"+i+"' "+selected+">"+dayS+"</option>");
		}
	}
	else if(field == "year" || field == "month"){
		year = $("#y"+flag).val();
		month = $("#m"+flag).val();
		day = $("#d"+flag).val();
		
		var days;
		if(month==1 || month==3 || month==5 || month==7 || month==8 || month==10 || month==12){
			days = 31;
		}
		else if(month==4 || month==6 || month==9 || month==11){
			days = 30;
		}
		else if((year%100!=0 && year%4==0) || (year%400==0)){
			days = 29;
		}
		else {
			days = 28;
		}

		if(day > days){
			day = days;
		}

		for(var i=1; i<=days; i++){
			var dayS = i<10 ? "0"+i : i;
			var selected = i==day ? "selected='selected'" : "";
			$("#d"+flag).append("<option value='"+i+"' "+selected+">"+dayS+"</option>");
		}
		calLeaveDay();
	}
	else {
		calLeaveDay();
	}
}
function calLeaveDay(){
	var fromDt = $("#y1").val()+"-"+($("#m1").val()<10 ? "0"+$("#m1").val() : $("#m1").val())+"-"+($("#d1").val()<10 ? "0"+$("#d1").val() : $("#d1").val());
	var toDt = $("#y2").val()+"-"+($("#m2").val()<10 ? "0"+$("#m2").val() : $("#m2").val())+"-"+($("#d2").val()<10 ? "0"+$("#d2").val() : $("#d2").val());
	var leaveDays = DateDif(toDt, fromDt) + 1;

	var oDate1,oDate2;  
	oDate1 = new Date(fromDt);
	oDate2 = new Date(toDt);
	if(oDate1>oDate2) {
		$("#leaveDays").html("无效");
	}else{
		$("#leaveDays").html(leaveDays);
	}
}
function DateDif(nowDate,lastDate){
	var aDate,oDate1,oDate2,iDays;
	oDate1 = new Date(nowDate);
	oDate2 = new Date(lastDate);
	if(oDate1-oDate2<0) {
		iDays="";
		alert("请假结束时间不得早于开始时间！");	
	}
	else{
		iDays = parseInt(Math.abs(oDate1-oDate2)/1000/60/60/24);
	}
	return iDays;  
}
function goQuery(){
	var employeeUuid = document.getElementById("employeeUuid").value;
	location.href = cp + "/whttps/wechat/common/work/wechat_query_leave_apply.whtml_" + employeeUuid;
}
</script>
<input type="hidden" id="pageTitle" value="请 假 申 请" />
<table border='1' cellpadding='0' cellspacing='0' align="center">
  <tr>
    <th><a onclick="goQuery()">查看历史请假申请</a></th>
  </tr>
</table>
<br> 
<form id="formA">
<input type="hidden" name="instance(Apply).stateUuid" value="<%=Constants.EXAMINATION_STATE_DOING %>" />
<input type="hidden" name="instance(Apply).typeUuid" value="<%=Constants.APPLY_TYPE_UUID_LEAVE %>" />
<input type="hidden" id="employeeUuid" name="instance(Apply).applicantUuid" value="<s:property value="#request.employee.uuid" />" />
<input type="hidden" name="instance(LeaveApplication).departmentUuid" value="<s:property value="#request.employee.departmentUuid" />" />
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="30%">申请人</th>
		<td width="70%">
			<s:property value="#request.employee.person.name" />
		</td>
	</tr>
	<tr>
		<th width="30%">组织机构</th>
		<td width="70%">
			<s:property value="#request.employee.department.description" />
		</td>
	</tr>
	<tr>
		<th width="30%">请假类别</th>
		<td width="70%">
			<select id="leaveTypeUuid" onchange="javascript:showNotes()" validate="true">
				<option value="null">-选择-</option>
				<option value="10000000010110001001000000000010">婚假</option>
				<option value="10000000010110001001000000000020">生育假</option>
				<option value="10000000010110001001000000000030">丧假</option>
				<option value="10000000010110001001000000000040">事假</option>
				<option value="10000000010110001001000000000050">病假</option>
				<option value="10000000010110001001000000000060">工伤病假</option>
				<option value="10000000010110001001000000000070">其他</option>
			</select>&nbsp;<font color="#996633">*</font>
			<input type="hidden" name="instance(LeaveApplication).leaveTypeUuid" validate="true" />
		</td>
	</tr>
	<tr>
		<th width="30%">请假事由</th>
		<td width="70%">
			<textarea name="instance(LeaveApplication).leaveReason" style="width:85%;height:110px" validate="true" ></textarea>&nbsp;<font color="#996633">*</font>
		</td>
	</tr>
	<tr>
		<th width="30%">开始时间</th>
		<td width="70%">
			<select id="y1" onchange="javascript:generateDate('1', 'year')"></select>-<select id="m1" onchange="javascript:generateDate('1', 'month')"></select>-<select id="d1" onchange="javascript:generateDate('1', 'day')"></select>
			<input type="hidden" name="instance(LeaveApplication).fromDt" />
		</td>
	</tr>
	<tr>
		<th width="30%">结束时间</th>
		<td width="70%">
			<select id="y2" onchange="javascript:generateDate('2', 'year')"></select>-<select id="m2" onchange="javascript:generateDate('2', 'month')"></select>-<select id="d2" onchange="javascript:generateDate('2', 'day')"></select>
			<input type="hidden" name="instance(LeaveApplication).toDt" />
		</td>
	</tr>
	<tr>
		<th width="30%">请假天数</th>
		<td width="70%">
	   		<div id="leaveDays" style="display:inline"></div>&nbsp;/天
	   		<input type="hidden" name="instance(LeaveApplication).days" />
	    </td>
	</tr>
	<tr>
		<th width="30%">备注</th>
		<td width="70%">
	   		<div id="notes" style="color:red"></div>
	    </td>
	</tr>
</table>
<br>
<img src="<%=request.getContextPath()%>/images/button/b_wechat_confirm.gif" onclick="createInstance('formA')" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<img src="<%=request.getContextPath()%>/images/button/b_wechat_close.gif" onClick="WeixinJSBridge.call('closeWindow')" />
<br>
</form>
</body>
</html>
