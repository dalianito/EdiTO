<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no">
<meta name="format-detection" content="telephone=no" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta http-equiv="pragma" content="no-cache" />
<head>
	<title>富海教育</title>
</head>

<body>
<script>
var mark = true;
$(document).ready(function(){
	var now = new Date();
	var year = now.getFullYear();
    var month = now.getMonth() + 1;
    var day = now.getDate();
	var nowTime = year + "-" + (month < 10 ? "0" + month : month) + "-" + (day < 10 ? "0" + day : day);
	$("#nowTime").html(nowTime);

	var notes = $("#notes").val().replace(/\n/g,'<br>');
	$("#notesV").html(notes);
});
function createInstance(){
	if(mark){
		if(confirm("确认操作？")){
			var reviewEmployeeUuid = $("#employeeUuid").val();
			var reviewComment = $("#reviewComment").val();
			var uuid = $("#uuid").val();
			var data = {reviewEmployeeUuid:reviewEmployeeUuid,
						reviewComment:reviewComment,
						uuid:uuid};
			$.post(cp+"/whttps/wechat/approval/work/wechat_network_review_create.whtml", data, function(){
				mark = false;
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
	location.href = cp + "/whttps/wechat/approval/work/wechat_network_review_back.whtml_" + employeeUuid;
}
</script>
<input type="hidden" id="pageTitle" value="网 络 宣 传 审 阅" />
<br>
<s:iterator value="#request.internetPublicity">
<input type="hidden" id="employeeUuid" value="<s:property value='#request.employee.uuid' />" />
<input type="hidden" id="uuid" value="<s:property value='uuid' />" />
<input type="hidden" id="notes" value="<s:property value="notes" />" />
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="30%">发帖人</th>
		<td width="70%"><s:property value="record.person.name" /></td>
	</tr>
	<tr>
		<th width="30%">组织机构</th>
		<td width="70%"><s:property value="record.department.description" /></td>
	</tr>
	<tr>
		<th width="30%">校区</th>
		<td width="70%"><s:property value="record.campus.description" /></td>
	</tr>
	<tr>
		<th width="30%">审阅状态</th>
		<td width="70%"><s:property value="reviewFlag.description" /></td>
	</tr>
	<tr>
		<th width="30%">记录时间</th>
		<td width="70%"><s:date name="recordTime" format="yyyy-MM-dd" /></td>
	</tr>
	<s:iterator value="posterInfos" status="rowList">
		<tr>
			<th align="center" width="30%"><s:property value="#rowList.count" />&nbsp;</th>
			<td style="width:70%;word-break:break-all;"><a href="http://<s:property value="site" />"><s:property value="site" /></a>&nbsp;</td>
		</tr>
	</s:iterator>
	<tr>
		<th width="30%">备注：</th>
		<td id="notesV" style="width:70%;word-break:break-all;height:104px;vertical-align:top"></td>	
	</tr>
	<tr>
		<th width="30%">评语：</th>
		<td width="70%">
			<textarea style="width:98%;word-break:break-all;height:104px;vertical-align:top" id="reviewComment"></textarea>
		</td>	
	</tr>
	<tr>
		<th width="30%">审阅人</th>
		<td width="70%"><s:property value='#request.employee.person.name' />
		</td>
	</tr>
	<tr>
		<th width="30%">审阅时间</th>
		<td width="70%"><div id="nowTime"></div></td>
	</tr>
</table>
</s:iterator>
<br>
<img src="<%=request.getContextPath()%>/images/button/b_wechat_confirm.gif" onclick="createInstance()" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<img src="<%=request.getContextPath()%>/images/button/b_wechat_back.gif" onClick="goBack()" />
<br><br>
</body>
</html>
