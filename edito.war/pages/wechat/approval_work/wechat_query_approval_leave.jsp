<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no">
<meta name="format-detection" content="telephone=no" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta http-equiv="pragma" content="no-cache" />
<head>
	<title>请假审批</title>
	<script>var cp = "<%=request.getContextPath()%>";</script>
</head>

<body>
<form id="form" name="form" method="post">
	<input type="hidden" name="uuid" />
	<input type="hidden" name="employeeUuid" value="<s:property value='#request.employeeUuid' />" />
	<input type="hidden" id="authorityLevel" name="authorityLevel" value="<s:property value='#request.authorityLevel' />" />
</form>
<script>
$(document).ready(function(){
	var now = new Date();
	var year = now.getFullYear();
    var month = now.getMonth() + 1;
    var day = now.getDate();
	var nowTime = year + "-" + (month < 10 ? "0" + month : month);
	$("#nowTime").html(nowTime);
	execute();
});

function changeTime(n){
	var time = $("#nowTime").html();
	var changeTime = new Date(time);
	changeTime.setMonth(changeTime.getMonth() + n);

	var year = changeTime.getFullYear();
    var month = changeTime.getMonth() + 1;
    var day = changeTime.getDate();
	var nowTime = year + "-" + (month < 10 ? "0" + month : month);
	$("#nowTime").html(nowTime);
	execute();
}

function execute(){
	var pageMark = "query";
	var nowTime = $("#nowTime").html();
	var campusUuid = $("#campusUuid").val();
	var authorityLevel = $("#authorityLevel").val();
	$.post(cp+"/ajaxs/wechat/approval/work/wechat_leave_approval.whtml", {pageMark:pageMark,nowTime:nowTime,campusUuid:campusUuid, authorityLevel:authorityLevel}, function(dataStore){
		var buffer="";
		buffer += "<table width='100%' border='0' cellpadding='0' cellspacing='0' class='InfoListPanel_color'>";
		buffer += "<tr><th width='30%'>申请人</th><th width='40%'>请假类别</th><th width='30%'>查看</th></tr>";
		if(dataStore.length > 0){
			for(var i=0;i<dataStore.length;i++){
				if(i%2==0){
					buffer += "<tr class='tr1'>";
				}
				else {
					buffer += "<tr class='tr2'>";
				}
				buffer += "<td align='center'>"+dataStore[i][0]+"</td>";
				buffer += "<td align='center'>"+dataStore[i][1]+"</td>";
				buffer += "<td align='center'>";
				buffer += "<img src='"+cp+"/images/button/b_wechat_forward.gif' onclick='javascript:approveLeaveApply(\""+dataStore[i][2]+"\")' />";
				buffer += "</td>";
				buffer += "</tr>";
			}
		}
		else {
			buffer += "<tr><td colspan='3'>&nbsp;<font color='red'>暂无查询结果！</font></td></tr>";
		}
		buffer += "</table>";
		$("#result").html(buffer);
	}, "json");
}
function approveLeaveApply(uuid){
	var f = document.getElementById("form");
	f.action = cp + "/views/wechat/approval/work/forward_wechat_view_leave_apply.whtml";
	f.target = "_self";
	f.uuid.value = uuid;
	f.submit();
}

function goBack(){
	var employeeUuid = '<%=request.getParameter("employeeUuid")%>';
	location.href = cp + "/whttps/wechat/approval/work/wechat_leave_approval.whtml_" + employeeUuid;
}
</script>
<input type="hidden" id="pageTitle" value="已 审 批 请 假 审 批" />
<br>
<table align='center'>
	<tr>
		<th width="34%"><img src="<%=request.getContextPath()%>/images/date/wechat_arrow_left.gif" onClick="changeTime(-1)" style="cursor:hand" /></th>
		<td><div id="nowTime"></div></td>
		<th width="33%"><img src="<%=request.getContextPath()%>/images/date/wechat_arrow_right.gif" onClick="changeTime(1)" style="cursor:hand" /></th>
	</tr>
</table>
<br>
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="30%">校区</th>
		<td width="70%">
			<select id="campusUuid" onchange="execute()">
				<s:iterator value="#request.campuss">
					<option value="<s:property value='uuid' />"><s:property value="description" /></option>
				</s:iterator>
			</select>
		</td>
	</tr>
</table>
<p align="left">
<img src="<%=request.getContextPath()%>/images/button/b_wechat_search.gif" onclick="execute()" />
</p>
<div id="result"></div>
<br>
<img src="<%=request.getContextPath()%>/images/button/b_wechat_close.gif" onClick="WeixinJSBridge.call('closeWindow')" />
</body>
</html>
