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
	var Uuid =  $("#Uuid").val();
	$.post(cp+"/ajaxs/wechat/approval/work/query_wechat_network_review.whtml", {nowTime:nowTime,Uuid:Uuid}, function(data){
		var buffer="";
		var totalCount = data.length;
		var reviewCount = 0;
		buffer += "<table width='100%' border='1' cellpadding='0' cellspacing='0' class='InfoListPanel_color'>";
		buffer += "<tr><th width='24%'>发帖人</th><th width='35%'>组织机构</th><th width='23%'>发帖数</th><th width='18%'>审阅</th></tr>";
		for(var i=0;i<data.length;i++){
			if(data[i][0] != null){
				if(data[i][5] == "已审阅"){
					reviewCount++;
				}
				else {
					if(i%2==0){
						buffer += "<tr class='tr1'>";
					}
					else {
						buffer += "<tr class='tr2'>";
					}
					buffer += "<td align='center'>"+data[i][1]+"</td>";
					buffer += "<td align='center'>"+data[i][2]+"</td>";
					buffer += "<td align='center'>"+data[i][3]+"</td>";
					buffer += "<td align='center'><a href='javascript:editInstance(\""+data[i][0]+"\",\"/whttps/wechat/approval/work/forward_network_review.whtml\")'><img src='<%=request.getContextPath()%>/images/button/b_wechat_forward.gif' /></a>";
					buffer += "</td>";
					buffer += "</tr>";
				}
			}
		}
		buffer += "</table>";
		$("#result").html(buffer);

		var notreviewCount = totalCount - reviewCount;
		var content = "未审阅<font color='red'>"+notreviewCount+"</font>人，已审阅<font color='red'>"+reviewCount+"</font>人 <br> 查看已审阅的<a href='#' onclick='goreviewQuery()'>网络宣传</a>"; 
		$("#content").html(content);
		
	}, "json");
}
function goreviewQuery(){
	var uuid = $("#Uuid").val();
	location.href = cp + "/whttps/wechat/approval/work/wechat_query_network_review.whtml_" + uuid;
}
</script>
<form id="form" method="post">
	<input type="hidden" name="uuid">
	<input type="hidden" id="Uuid" name="employeeUuid" value="<s:property value="#request.employee.uuid" />">
</form>
<input type="hidden" id="pageTitle" value="网 络 宣 传 审 阅" />
<table border='1' cellpadding='0' cellspacing='0' align="center">
  <tr>
    <th id="content"></th>
  </tr>
</table>
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
<br><br>
<img src="<%=request.getContextPath()%>/images/button/b_wechat_close.gif" onClick="WeixinJSBridge.call('closeWindow')" />
</body>
</html>
