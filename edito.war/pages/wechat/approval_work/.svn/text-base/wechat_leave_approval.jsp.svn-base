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
	<input type="hidden" id="employeeUuid" name="employeeUuid" value="<s:property value='#request.employeeUuid' />" />
	<input type="hidden" id="authorityLevel" name="authorityLevel" value="<s:property value='#request.authorityLevel' />" />
</form>
<script>
$(document).ready(function(){
	execute();
});
function execute(){
	var campusUuid = $("#campusUuid").val();
	var authorityLevel = $("#authorityLevel").val();
	$.post(cp+"/ajaxs/wechat/approval/work/wechat_leave_approval.whtml", {campusUuid:campusUuid, authorityLevel:authorityLevel}, function(dataStore){
		var buffer="";
		buffer += "<table width='100%' border='0' cellpadding='0' cellspacing='0' class='InfoListPanel_color'>";
		buffer += "<tr><th width='30%'>申请人</th><th width='40%'>请假类别</th><th width='30%'>审批</th></tr>";
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
	f.action = cp + "/whttps/wechat/approval/work/wechat_forward_approval_leave.whtml";
	f.target = "_self";
	f.uuid.value = uuid;
	f.submit();
}

function goQuery(){
	var employeeUuid = $("#employeeUuid").val();
	location.href = cp + "/whttps/wechat/approval/work/wechat_query_leave_approval.whtml_" + employeeUuid;
}
</script>
<input type="hidden" id="pageTitle" value="请 假 审 批" />
<br>
<div>
查看已审批的<a href="#" onclick="goQuery()">请假申请</a>
</div>
<br>
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="30%">审批人</th>
		<td width="70%"><s:property value="#request.employeeName" /></td>
	</tr>
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
	<tr>
		<th width="30%">审批状态</th>
		<td width="70%">未审批</td>
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
