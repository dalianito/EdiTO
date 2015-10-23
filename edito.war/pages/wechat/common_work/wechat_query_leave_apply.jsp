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
	<script>var cp="<%=request.getContextPath()%>";</script>
</head>
<body class="BodyView">
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
	var nowTime = $("#nowTime").html();
	var pageMark = "record";
	var Uuid = $("#Uuid").val();
	$.post(cp+"/ajaxs/wechat/common/work/wechat_query_leave_apply.whtml", {nowTime:nowTime,pageMark:pageMark,Uuid:Uuid}, function(data){
		var buffer="";
		buffer += "<table width='100%' border='0' cellpadding='0' cellspacing='0' class='InfoListPanel_color'>";
		buffer += "<tr><th width='25%'>申请时间</th><th width='25%'>请假类型</th><th width='25%'>审批状态</th><th width='25%'>操作</th></tr>";
		for(var i=0;i<data.length;i++){
			if(i%2==0){
				buffer += "<tr class='tr1'>";
			}
			else {
				buffer += "<tr class='tr2'>";
			}
			var pic = document.getElementById("pic").src
			buffer += "<td align='center'>"+data[i][0]+"</td>";
			buffer += "<td align='center'>"+data[i][1]+"</td>";
			buffer += "<td align='center'>"+data[i][2]+"</td>";
			buffer += "<td align='center'><a href='javascript:editInstance(\""+data[i][3]+"\",\"/views/wechat/common/work/forward_wechat_view_leave_apply.whtml\")'><img src="+pic+"></a>";
			buffer += "</td>";
			buffer += "</tr>";
		}
		buffer += "</table>";
		$("#result").html(buffer);
	}, "json");
}
</script>
<form id="form" method="post">
	<input type="hidden" name="uuid">
	<input type="hidden" id="Uuid" name="employeeUuid" value="<%=request.getParameter("uuid")%>">
</form>
<input type="hidden" id="pageTitle" value="请 假 申 请" />
<br>
<table align='center'>
	<tr>
		<th width="34%"><img src="<%=request.getContextPath()%>/images/date/wechat_arrow_left.gif" onClick="changeTime(-1)" style="cursor:hand" /></th>
		<td><div id="nowTime"></div></td>
		<th width="33%"><img src="<%=request.getContextPath()%>/images/date/wechat_arrow_right.gif" onClick="changeTime(1)" style="cursor:hand" /></th>
	</tr>
</table>
<br>
<div id="result"></div>
<div style="display: none;"><img id="pic" src="<%=request.getContextPath()%>/images/button/b_wechat_forward.gif" /></div>
<br><br>
<div align='center'>
<img src="<%=request.getContextPath()%>/images/button/b_wechat_close.gif" onClick="WeixinJSBridge.call('closeWindow')" />
</div>
<br><br>
</body>
</html>
