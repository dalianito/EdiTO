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
$(document).ready(function(){
	var now = new Date();
	var year = now.getFullYear();
    var month = now.getMonth() + 1;
    var day = now.getDate();
	var nowTime = year + "-" + (month < 10 ? "0" + month : month) + "-" + (day < 10 ? "0" + day : day);
	$("#nowTime").html(nowTime);
	execute();
	
});

function changeTime(n){
	var time = $("#nowTime").html();
	var changeTime = new Date(time);
	changeTime.setDate(changeTime.getDate() + n);
	
	var year = changeTime.getFullYear();
    var month = changeTime.getMonth() + 1;
    var day = changeTime.getDate();
	var nowTime = year + "-" + (month < 10 ? "0" + month : month) + "-" + (day < 10 ? "0" + day : day);
	$("#nowTime").html(nowTime);	
	execute();
}

function execute(){
	var nowTime = $("#nowTime").html();
	var Uuid = '<%=request.getParameter("employeeUuid")%>';
	$.post(cp+"/ajaxs/wechat/approval/work/query_workRecord_review.whtml", {nowTime:nowTime,Uuid:Uuid}, function(data){
		var buffer="";
		buffer += "<table width='100%' border='0' cellpadding='0' cellspacing='0' class='InfoListPanel_color'>";
		buffer += "<tr><th width='35%'>记录人</th><th width='35%'>组织机构</th><th width='30%'>查看</th></tr>";
		for(var i=0;i<data.length;i++){
			if(data[i][0] != null){
				if(data[i][4] == "已审阅"){
					if(i%2==0){
						buffer += "<tr class='tr1'>";
					}
					else {
						buffer += "<tr class='tr2'>";
					}
					var pic = document.getElementById("pic").src
					buffer += "<td align='center'>"+data[i][1]+"</td>";
					buffer += "<td align='center'>"+data[i][2]+"</td>";
					buffer += "<td align='center'><a href='javascript:editInstance(\""+data[i][0]+"\",\"/views/wechat/approval/work/forward_view_workRecord.whtml\")'><img src="+pic+"></a>";
					buffer += "</td>";
					buffer += "</tr>";
				}
			}
		}
		buffer += "</table>";
		$("#result").html(buffer);
	}, "json");
}
function goback(){
	var employeeUuid = '<%=request.getParameter("employeeUuid")%>'
	location.href = cp + "/whttps/wechat/approval/work/wechat_work_review.whtml_" + employeeUuid;
}
</script>
<input type="hidden" id="pageTitle" value="已 审 阅 日 志 " />
<form id="form" method="post">
	<input type="hidden" name="uuid">
</form>
<br>
<table>
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
<img src="<%=request.getContextPath()%>/images/button/b_wechat_back.gif" onClick="goback()" />
</body>
</html>
