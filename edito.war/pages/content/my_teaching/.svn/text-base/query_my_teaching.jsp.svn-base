<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.ito.edito.schema.Employee"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
	<title>我的教学</title>
</head>
<body>
<script>
<%
String imgSrc = ((Employee)request.getSession().getAttribute("LOGIN_EMPLOYEE")).getPerson().getPhotoUuid()==null ? request.getContextPath()+"/images/head.gif" : request.getSession().getAttribute("UPLOAD_URL")+((Employee)request.getSession().getAttribute("LOGIN_EMPLOYEE")).getPerson().getPhoto().getPath();
String summary = ((Employee)request.getSession().getAttribute("LOGIN_EMPLOYEE")).getSummary()==null ? "暂无简介" : ((Employee)request.getSession().getAttribute("LOGIN_EMPLOYEE")).getSummary();
String introduction = ((Employee)request.getSession().getAttribute("LOGIN_EMPLOYEE")).getIntroduction()==null ? "暂无详细介绍" : ((Employee)request.getSession().getAttribute("LOGIN_EMPLOYEE")).getIntroduction();
%>

$(document).ready(function(){
	generateLayout();
});
function generateLayout(){
	$(".mainContent").css("background-image", "url('')");

	var buffer = "";
	buffer += "<table width='120px' style='margin-left:15px;margin-top:15px;line-height:20px;text-align:left' cellspacing='0' cellpadding='0' border='0'>";
	buffer += "<tr>";
	buffer += "<td><img src='<%=imgSrc %>' style='width:120px;height:144px' />";
	buffer += "<tr><td height='16px'></td></tr>";
	buffer += "<tr>";
	buffer += "<td style='width:120px;min-height:100px' valign='top'>";
	buffer += "<div style='width:120px;word-break:break-all;word-wrap:word-break'>";
	buffer += "简介：<br>";
	buffer += "&nbsp;&nbsp;<a title='详细介绍：<%=introduction %>'><font color='black'>";
	buffer += "<%=summary %>";
	buffer += "</font></a>";
	buffer += "</div>";
	buffer += "</td>";
	buffer += "</tr>";
	buffer += "</table>";
	$(".leftMenu").html(buffer);
}
function refreshPage(){
	location.href = cp+"/https/personal/main/page/main_page.html";
}
function changeColor(tdId){
	$("#[id^=block_]").css("background-color", "#FFFFFF");
	if(tdId!="none"){
		$("#"+tdId).css("background-color", "#EFEFEF");
	}
}
</script>
<table width="710" border="0" cellpadding="0" cellspacing="0">
<tr>
<td width="350" height="200">
<table width="350" border="0" cellpadding="0" cellspacing="0">
<tr>
<td id="block_notice" width="350" height="200" style="border:1px solid #FF7256" valign="top" onmouseover="changeColor('block_notice')" onmouseout="changeColor('none')">
<div style="margin-left:10px;margin-top:5px;line-height:25px">
<a title="点击查看全部" href="#" style="font-size:15px">通知通告：</a>
<div id="notice" style="font-size:13px"></div>
</div>
</td>
</tr>
</table>
</td>
<td width="10" height="200"></td>
<td width="350" height="200">
<table width="350" border="0" cellpadding="0" cellspacing="0">
<tr>
<td id="block_course" width="350" height="200" style="border:1px solid #9370DB" valign="top" onmouseover="changeColor('block_course')" onmouseout="changeColor('none')">
<div style="margin-left:10px;margin-top:5px;line-height:25px">
<a title="点击查看全部" href="#" style="font-size:15px">我的课程：</a>
<div id="course" style="font-size:13px"></div>
</div>
</td>
</tr>
</table>
</td>
</tr>
<tr>
<td width="710" height="10" colspan="3"></td>
</tr>
<tr>
<td width="710" height="200" colspan="3">
<table width="710" border="0" cellpadding="0" cellspacing="0">
<tr>
<td id="block_class" width="710" height="200" style="border:1px solid #EEC900" valign="top" onmouseover="changeColor('block_class')" onmouseout="changeColor('none')">
<div style="margin-left:10px;margin-top:5px;line-height:25px">
<a title="点击查看全部" href="#" style="font-size:15px">我的班级：</a>
<div id="class" style="font-size:13px"></div>
</div>
</td>
</tr>
</table>
</td>
</tr>
<tr>
<td width="710" height="10" colspan="3"></td>
</tr>
<tr>
<td width="350" height="200">
<table width="350" border="0" cellpadding="0" cellspacing="0">
<tr>
<td id="block_schedule" width="350" height="200" style="border:1px solid #FF69B4" valign="top" onmouseover="changeColor('block_schedule')" onmouseout="changeColor('none')">
<div style="margin-left:10px;margin-top:5px;line-height:25px">
<a title="点击查看全部" href="#" style="font-size:15px">我的计划表：</a>
<div id="schedule" style="font-size:13px"></div>
</div>
</td>
</tr>
</table>
</td>
<td width="10" height="414" rowspan="3"></td>
<td width="350" height="412" rowspan="3">
<table width="350" border="0" cellpadding="0" cellspacing="0">
<tr>
<td id="block_resource" width="350" height="412" style="border:1px solid #4DB361" valign="top" onmouseover="changeColor('block_resource')" onmouseout="changeColor('none')">
<div style="margin-left:10px;margin-top:5px;line-height:25px">
<a title="点击查看全部" href="#" style="font-size:15px">我的资源：</a>
<div id="resource" style="font-size:13px"></div>
</div>
</td>
</tr>
</table>
</td>
</tr>
<tr>
<td width="350" height="10"></td>
</tr>
<tr>
<td width="350" height="200">
<table width="350" border="0" cellpadding="0" cellspacing="0">
<tr>
<td id="block_discuss" width="350" height="200" style="border:1px solid #B8860B" valign="top" onmouseover="changeColor('block_discuss')" onmouseout="changeColor('none')">
<div style="margin-left:10px;margin-top:5px;line-height:25px">
<a title="点击查看全部" href="#" style="font-size:15px">讨论区：</a>
<div id="discuss" style="font-size:13px"></div>
</div>
</td>
</tr>
</table>
</td>
</tr>
</table>
</body>
</html>
