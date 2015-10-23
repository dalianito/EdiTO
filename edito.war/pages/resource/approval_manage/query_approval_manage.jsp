<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ page import="com.ito.edito.util.Constants"%>
<html>
<head>
<title>审批管理</title>
</head>
<body>
<form id="form" name="form" method="post">
	<input type="hidden" name="uuid" />
	<input type="hidden" name="resultCode" />
	<input type="hidden" name="type" />
</form>
<script>
Validation.init("resource/approval_manage/query_approval_manage.xml");
var numF = 5;
$(document).ready(function(){
	$(".leftMenu").css("display", "none");
	execute1();
	execute2();
	execute3();
	execute4();
	execute5();
	execute6();
	execute7();
});
function toggleList(divId){
	$("tbody[id^='content_"+divId+"']").css("display", "none");
	if($("#result"+divId).css("display") == "none"){
		$("#result"+divId).css("display", "inline");
	}
	else if($("#result"+divId).css("display") == "inline"){
		$("#result"+divId).css("display", "none");
	}
}
function execute1(){
	$.post(cp+"/ajaxs/resource/approval/manage/query_approval_manage.html", {typeUuid:"<%=Constants.APPLY_TYPE_UUID_RECRUITMENT%>"}, function(data){
		var num = data[0].length;
		if(num > 0){
			$("#link1_1").css("display", "inline");
			$("#link1_num").html("("+num+")");
			$("#link1_0").css("display", "none");
			var buffer = "<table width='900' border='0' cellpadding='0' cellspacing='0' class='InfoListPanel_color'>";
			buffer += "<tr><th width='20'></th><th width='100'>申请人</th><th width='110'>申请时间</th><th width='100'>部门处长</th><th width='110'>审批时间</th><th width='140'>人力资源处处长</th><th width='110'>审批时间</th><th width='100'>校长</th><th width='110'>审批时间</th></tr>";
			for(var i=0; i<num; i++){
				buffer += "<tr onclick='javascript:toggleContent(\""+data[0][i][11]+"\", \"1\", \""+i+"\")' style='text-align:center;cursor:hand'>";
				buffer += "<td>"+data[0][i][0]+"</td>";
				buffer += "<td>"+data[0][i][1]+"</td>";
				buffer += "<td>"+data[0][i][2]+"</td>";
				buffer += "<td>"+data[0][i][3]+"</td>";
				buffer += "<td>"+data[0][i][4]+"</td>";
				buffer += "<td>"+data[0][i][5]+"</td>";
				buffer += "<td>"+data[0][i][6]+"</td>";
				buffer += "<td>"+data[0][i][7]+"</td>";
				buffer += "<td>"+data[0][i][8]+"</td>";
				buffer += "</tr>";
				buffer += "<tbody id='content_1_"+i+"'></tbody>";
			}
			buffer += "</table><br>";
			$("#result1").html(buffer);
			$("#fullResult1").css("display", "inline");
		}
		else {
			if(data[1]=="noAuthority"){
				$("#fullResult1").css("display", "none");
			}
			else {
				$("#link1_1").css("display", "none");
				$("#link1_0").css("display", "inline");
				$("#result1").html("");
				$("#fullResult1").css("display", "inline");
			}
		}
	}, "json");
}
function execute2(){
	$.post(cp+"/ajaxs/resource/approval/manage/query_approval_manage.html", {typeUuid:"<%=Constants.APPLY_TYPE_UUID_RELATIONSHIP%>"}, function(data){
		var num = data[0].length;
		if(num > 0){
			$("#link2_1").css("display", "inline");
			$("#link2_num").html("("+num+")");
			$("#link2_0").css("display", "none");
			var buffer = "<table width='900' border='0' cellpadding='0' cellspacing='0' class='InfoListPanel_color'>";
			buffer += "<tr><th width='20'></th><th width='100'>申请人</th><th width='110'>申请时间</th><th width='140'>人力资源处处长</th><th width='110'>审批时间</th><th width='100'>副校长</th><th width='110'>审批时间</th><th width='100'>校长</th><th width='110'>审批时间</th></tr>";
			for(var i=0; i<num; i++){
				buffer += "<tr onclick='javascript:toggleContent(\""+data[0][i][11]+"\", \"2\", \""+i+"\")' style='text-align:center;cursor:hand'>";
				buffer += "<td>"+data[0][i][0]+"</td>";
				buffer += "<td>"+data[0][i][1]+"</td>";
				buffer += "<td>"+data[0][i][2]+"</td>";
				buffer += "<td>"+data[0][i][3]+"</td>";
				buffer += "<td>"+data[0][i][4]+"</td>";
				buffer += "<td>"+data[0][i][5]+"</td>";
				buffer += "<td>"+data[0][i][6]+"</td>";
				buffer += "<td>"+data[0][i][7]+"</td>";
				buffer += "<td>"+data[0][i][8]+"</td>";
				buffer += "</tr>";
				buffer += "<tbody id='content_2_"+i+"'></tbody>";
			}
			buffer += "</table><br>";
			$("#result2").html(buffer);
			$("#fullResult2").css("display", "inline");
		}
		else {
			if(data[1]=="noAuthority"){
				$("#fullResult2").css("display", "none");
			}
			else {
				$("#link2_1").css("display", "none");
				$("#link2_0").css("display", "inline");
				$("#result2").html("");
				$("#fullResult2").css("display", "inline");
			}
		}
	}, "json");
}
function execute3(){
	$.post(cp+"/ajaxs/resource/approval/manage/query_approval_manage.html", {typeUuid:"<%=Constants.APPLY_TYPE_UUID_QUIT%>"}, function(data){
		var num = data[0].length;
		if(num > 0){
			$("#link3_1").css("display", "inline");
			$("#link3_num").html("("+num+")");
			$("#link3_0").css("display", "none");
			var buffer = "<table width='900' border='0' cellpadding='0' cellspacing='0' class='InfoListPanel_color'>";
			buffer += "<tr><th width='20'></th><th width='66'>申请人</th><th width='96'>申请时间</th><th width='76'>分校校长</th><th width='96'>审批时间</th><th width='126'>人力资源处处长</th><th width='96'>审批时间</th><th width='66'>副校长</th><th width='96'>审批时间</th><th width='66'>校长</th><th width='96'>审批时间</th></tr>";
			for(var i=0; i<num; i++){
				buffer += "<tr onclick='javascript:toggleContent(\""+data[0][i][11]+"\", \"3\", \""+i+"\")' style='text-align:center;cursor:hand'>";
				buffer += "<td>"+data[0][i][0]+"</td>";
				buffer += "<td>"+data[0][i][1]+"</td>";
				buffer += "<td>"+data[0][i][2]+"</td>";
				buffer += "<td>"+data[0][i][3]+"</td>";
				buffer += "<td>"+data[0][i][4]+"</td>";
				buffer += "<td>"+data[0][i][5]+"</td>";
				buffer += "<td>"+data[0][i][6]+"</td>";
				buffer += "<td>"+data[0][i][7]+"</td>";
				buffer += "<td>"+data[0][i][8]+"</td>";
				buffer += "<td>"+data[0][i][9]+"</td>";
				buffer += "<td>"+data[0][i][10]+"</td>";
				buffer += "</tr>";
				buffer += "<tbody id='content_3_"+i+"'></tbody>";
			}
			buffer += "</table><br>";
			$("#result3").html(buffer);
			$("#fullResult3").css("display", "inline");
		}
		else {
			if(data[1]=="noAuthority"){
				$("#fullResult3").css("display", "none");
			}
			else {
				$("#link3_1").css("display", "none");
				$("#link3_0").css("display", "inline");
				$("#result3").html("");
				$("#fullResult3").css("display", "inline");
			}
		}
	}, "json");
}
function execute4(){
	$.post(cp+"/ajaxs/resource/approval/manage/query_approval_manage.html", {typeUuid:"<%=Constants.APPLY_TYPE_UUID_LEAVE%>"}, function(data){
		var num = data[0].length;
		if(num > 0){
			$("#link4_1").css("display", "inline");
			$("#link4_num").html("("+num+")");
			$("#link4_0").css("display", "none");
			var buffer = "<table width='900' border='0' cellpadding='0' cellspacing='0' class='InfoListPanel_color'>";
			buffer += "<tr><th width='20'></th><th width='110'>申请人</th><th width='110'>申请时间</th><th width='110'>主管领导</th><th width='110'>审批时间</th><th width='110'>分校校长</th><th width='110'>审批时间</th><th width='110'>校长</th><th width='110'>审批时间</th></tr>";
			for(var i=0; i<num; i++){
				buffer += "<tr onclick='javascript:toggleContent(\""+data[0][i][11]+"\", \"4\", \""+i+"\")' style='text-align:center;cursor:hand'>";
				buffer += "<td>"+data[0][i][0]+"</td>";
				buffer += "<td>"+data[0][i][1]+"</td>";
				buffer += "<td>"+data[0][i][2]+"</td>";
				buffer += "<td>"+data[0][i][3]+"</td>";
				buffer += "<td>"+data[0][i][4]+"</td>";
				buffer += "<td>"+data[0][i][5]+"</td>";
				buffer += "<td>"+data[0][i][6]+"</td>";
				buffer += "<td>"+data[0][i][7]+"</td>";
				buffer += "<td>"+data[0][i][8]+"</td>";
				buffer += "</tr>";
				buffer += "<tbody id='content_4_"+i+"'></tbody>";
			}
			buffer += "</table><br>";
			$("#result4").html(buffer);
			$("#fullResult4").css("display", "inline");
		}
		else {
			if(data[1]=="noAuthority"){
				$("#fullResult4").css("display", "none");
			}
			else {
				$("#link4_1").css("display", "none");
				$("#link4_0").css("display", "inline");
				$("#result4").html("");
				$("#fullResult4").css("display", "inline");
			}
		}
	}, "json");
}
function execute5(){
	$.post(cp+"/ajaxs/resource/approval/manage/query_approval_manage.html", {typeUuid:"<%=Constants.APPLY_TYPE_UUID_PUBLICITY%>"}, function(data){
		var num = data[0].length;
		if(num > 0){
			$("#link5_1").css("display", "inline");
			$("#link5_num").html("("+num+")");
			$("#link5_0").css("display", "none");
			var buffer = "<table width='900' border='0' cellpadding='0' cellspacing='0' class='InfoListPanel_color'>";
			buffer += "<tr><th width='20'></th><th width='100'>申请人</th><th width='190'>申请时间</th><th width='105'>企划部负责人</th><th width='190'>审批时间</th><th width='105'>主管校领导</th><th width='190'>审批时间</th></tr>";
			for(var i=0; i<num; i++){
				buffer += "<tr onclick='javascript:toggleContent(\""+data[0][i][11]+"\", \"5\", \""+i+"\")' style='text-align:center;cursor:hand'>";
				buffer += "<td>"+data[0][i][0]+"</td>";
				buffer += "<td>"+data[0][i][1]+"</td>";
				buffer += "<td>"+data[0][i][2]+"</td>";
				buffer += "<td>"+data[0][i][3]+"</td>";
				buffer += "<td>"+data[0][i][4]+"</td>";
				buffer += "<td>"+data[0][i][5]+"</td>";
				buffer += "<td>"+data[0][i][6]+"</td>";
				buffer += "</tr>";
				buffer += "<tbody id='content_5_"+i+"'></tbody>";
			}
			buffer += "</table><br>";
			$("#result5").html(buffer);
			$("#fullResult5").css("display", "inline");
		}
		else {
			if(data[1]=="noAuthority"){
				$("#fullResult5").css("display", "none");
			}
			else {
				$("#link5_1").css("display", "none");
				$("#link5_0").css("display", "inline");
				$("#result5").html("");
				$("#fullResult5").css("display", "inline");
			}
		}
	}, "json");
}
function execute6(){
	$.post(cp+"/ajaxs/resource/approval/manage/query_approval_manage.html", {typeUuid:"<%=Constants.APPLY_TYPE_UUID_MATERIAL%>"}, function(data){
		var num = data[0].length;
		if(num > 0){
			$("#link6_1").css("display", "inline");
			$("#link6_num").html("("+num+")");
			$("#link6_0").css("display", "none");
			var buffer = "<table width='900' border='0' cellpadding='0' cellspacing='0' class='InfoListPanel_color'>";
			buffer += "<tr><th width='20'></th><th width='90'>申请人</th><th width='100'>申请时间</th><th width='120'>申请单位负责人</th><th width='100'>审批时间</th><th width='150'>总校物资管理负责人</th><th width='100'>审批时间</th><th width='120'>总校主管负责人</th><th width='100'>审批时间</th></tr>";
			for(var i=0; i<num; i++){
				buffer += "<tr onclick='javascript:toggleContent(\""+data[0][i][11]+"\", \"6\", \""+i+"\")' style='text-align:center;cursor:hand'>";
				buffer += "<td>"+data[0][i][0]+"</td>";
				buffer += "<td>"+data[0][i][1]+"</td>";
				buffer += "<td>"+data[0][i][2]+"</td>";
				buffer += "<td>"+data[0][i][3]+"</td>";
				buffer += "<td>"+data[0][i][4]+"</td>";
				buffer += "<td>"+data[0][i][5]+"</td>";
				buffer += "<td>"+data[0][i][6]+"</td>";
				buffer += "<td>"+data[0][i][7]+"</td>";
				buffer += "<td>"+data[0][i][8]+"</td>";
				buffer += "</tr>";
				buffer += "<tbody id='content_6_"+i+"'></tbody>";
			}
			buffer += "</table><br>";
			$("#result6").html(buffer);
			$("#fullResult6").css("display", "inline");
		}
		else {
			if(data[1]=="noAuthority"){
				$("#fullResult6").css("display", "none");
			}
			else {
				$("#link6_1").css("display", "none");
				$("#link6_0").css("display", "inline");
				$("#result6").html("");
				$("#fullResult6").css("display", "inline");
			}
		}
	}, "json");
}
function execute7(){
	$.post(cp+"/ajaxs/resource/approval/manage/query_approval_manage.html", {typeUuid:"<%=Constants.APPLY_TYPE_UUID_REGULAR%>"}, function(data){
		var num = data[0].length;
		if(num > 0){
			$("#link7_1").css("display", "inline");
			$("#link7_num").html("("+num+")");
			$("#link7_0").css("display", "none");
			var buffer = "";
			if(data[1] == "<%=Constants.APPROVAL_AUTHORITY_7_1%>") {
				buffer = "<table width='900' border='0' cellpadding='0' cellspacing='0' class='InfoListPanel_color'>";
				buffer += "<tr><th width='20'></th><th width='200'>申请人</th><th width='200'>申请时间</th><th width='240'>主管领导</th><th width='240'>审批时间</th></tr>";
				for(var i=0; i<num; i++){
					buffer += "<tr onclick='javascript:toggleContent(\""+data[0][i][11]+"\", \"7\", \""+i+"\")' style='text-align:center;cursor:hand'>";
					buffer += "<td>"+data[0][i][0]+"</td>";
					buffer += "<td>"+data[0][i][1]+"</td>";
					buffer += "<td>"+data[0][i][2]+"</td>";
					buffer += "<td></td>";
					buffer += "<td></td>";
					buffer += "</tr>";
					buffer += "<tbody id='content_7_"+i+"'></tbody>";
				}
				buffer += "</table><br>";
			}
			else if(data[1] == "<%=Constants.APPROVAL_AUTHORITY_7_2%>") {
				buffer = "<table width='900' border='0' cellpadding='0' cellspacing='0' class='InfoListPanel_color'>";
				buffer += "<tr><th width='20'></th><th width='200'>申请人</th><th width='200'>申请时间</th><th width='240'>学科负责人</th><th width='240'>审批时间</th></tr>";
				for(var i=0; i<num; i++){
					buffer += "<tr onclick='javascript:toggleContent(\""+data[0][i][11]+"\", \"7\", \""+i+"\")' style='text-align:center;cursor:hand'>";
					buffer += "<td>"+data[0][i][0]+"</td>";
					buffer += "<td>"+data[0][i][1]+"</td>";
					buffer += "<td>"+data[0][i][2]+"</td>";
					buffer += "<td></td>";
					buffer += "<td></td>";
					buffer += "</tr>";
					buffer += "<tbody id='content_7_"+i+"'></tbody>";
				}
				buffer += "</table><br>";
			}
			else if(data[1] == "<%=Constants.APPROVAL_AUTHORITY_7_3%>") {
				buffer = "<table width='900' border='0' cellpadding='0' cellspacing='0' class='InfoListPanel_color'>";
				buffer += "<tr><th width='20'></th><th width='200'>申请人</th><th width='200'>申请时间</th><th width='240'>授课校区负责人</th><th width='240'>审批时间</th></tr>";
				for(var i=0; i<num; i++){
					buffer += "<tr onclick='javascript:toggleContent(\""+data[0][i][11]+"\", \"7\", \""+i+"\")' style='text-align:center;cursor:hand'>";
					buffer += "<td>"+data[0][i][0]+"</td>";
					buffer += "<td>"+data[0][i][1]+"</td>";
					buffer += "<td>"+data[0][i][2]+"</td>";
					buffer += "<td></td>";
					buffer += "<td></td>";
					buffer += "</tr>";
					buffer += "<tbody id='content_7_"+i+"'></tbody>";
				}
				buffer += "</table><br>";
			}
			else if(data[1] == "<%=Constants.APPROVAL_AUTHORITY_7_4%>") {
				numF = 11;
				buffer = "<table width='900' border='0' cellpadding='0' cellspacing='0' class='InfoListPanel_color'>";
				buffer += "<tr><th width='20'></th><th width='80'>申请人</th><th width='80'>申请时间</th><th width='80'>主管领导</th><th width='80'>审批时间</th><th width='105'>学科负责人</th><th width='80'>审批时间</th><th width='135'>授课校区负责人</th><th width='80'>审批时间</th><th width='80'>人力资源</th><th width='80'>审批时间</th></tr>";
				for(var i=0; i<num; i++){
					buffer += "<tr onclick='javascript:toggleContent(\""+data[0][i][11]+"\", \"7\", \""+i+"\")' style='text-align:center;cursor:hand'>";
					buffer += "<td>"+data[0][i][0]+"</td>";
					buffer += "<td>"+data[0][i][1]+"</td>";
					buffer += "<td>"+data[0][i][2]+"</td>";
					buffer += "<td>"+data[0][i][3]+"</td>";
					buffer += "<td>"+data[0][i][4]+"</td>";
					buffer += "<td>"+data[0][i][5]+"</td>";
					buffer += "<td>"+data[0][i][6]+"</td>";
					buffer += "<td>"+data[0][i][7]+"</td>";
					buffer += "<td>"+data[0][i][8]+"</td>";
					buffer += "<td></td>";
					buffer += "<td></td>";
					buffer += "</tr>";
					buffer += "<tbody id='content_7_"+i+"'></tbody>";
				}
				buffer += "</table><br>";
			}
			else if(data[1] == "<%=Constants.APPROVAL_AUTHORITY_7_5%>") {
				numF = 13;
				buffer = "<table width='900' border='0' cellpadding='0' cellspacing='0' class='InfoListPanel_color'>";
				buffer += "<tr><th width='20'></th><th width='55'>申请人</th><th width='70'>申请时间</th><th width='70'>主管领导</th><th width='70'>审批时间</th><th width='85'>学科负责人</th><th width='70'>审批时间</th><th width='120'>授课校区负责人</th><th width='70'>审批时间</th><th width='70'>人力资源</th><th width='70'>审批时间</th><th width='65'>行政校长</th><th width='65'>审批时间</th></tr>";
				for(var i=0; i<num; i++){
					buffer += "<tr onclick='javascript:toggleContent(\""+data[0][i][11]+"\", \"7\", \""+i+"\")' style='text-align:center;cursor:hand'>";
					buffer += "<td>"+data[0][i][0]+"</td>";
					buffer += "<td>"+data[0][i][1]+"</td>";
					buffer += "<td>"+data[0][i][2]+"</td>";
					buffer += "<td>"+data[0][i][3]+"</td>";
					buffer += "<td>"+data[0][i][4]+"</td>";
					buffer += "<td>"+data[0][i][5]+"</td>";
					buffer += "<td>"+data[0][i][6]+"</td>";
					buffer += "<td>"+data[0][i][7]+"</td>";
					buffer += "<td>"+data[0][i][8]+"</td>";
					buffer += "<td>"+data[0][i][9]+"</td>";
					buffer += "<td>"+data[0][i][10]+"</td>";
					buffer += "<td></td>";
					buffer += "<td></td>";
					buffer += "</tr>";
					buffer += "<tbody id='content_7_"+i+"'></tbody>";
				}
				buffer += "</table><br>";
			}

			$("#result7").html(buffer);
			$("#fullResult7").css("display", "inline");
		}
		else {
			if(data[1]=="noAuthority"){
				$("#fullResult7").css("display", "none");
			}
			else {
				$("#link7_1").css("display", "none");
				$("#link7_0").css("display", "inline");
				$("#result7").html("");
				$("#fullResult7").css("display", "inline");
			}
		}
	}, "json");
}
function toggleContent(uuid, mark, num){
	var id = "content_"+mark+"_"+num;
	if($("#"+id+"_div").height() == null || $("#"+id+"_div").height() == 0){
		showContent(uuid, id);
	}
	else {
		hideTimeout(id);
	}
}
function showContent(uuid, id){
	$.post(cp+"/ajaxs/resource/approval/manage/query_apply_info.html", {uuid:uuid}, function(data){
		if(data["type"] == "recruitment"){
			var buffer = "<tr><td colspan='9' align='center'><div id='"+id+"_div' style='overflow:hidden' value='0'>";
			buffer += "<br>";
			buffer += "<form id='"+id+"_form'>";
			buffer += "<input type='hidden' name='instance(Apply).uuid' value='"+uuid+"' />";
			buffer += "<table width='720' border='0' cellpadding='0' cellspacing='0' class='InfoShowPanel_2'>";
			buffer += "<tr>";
			buffer += "<th width='180'>需求部门：</th>";
			buffer += "<td width='540' colspan='3'>"+(data["applyInfo"].departmentUuid!=null ? data["applyInfo"].department.description : "&nbsp;")+"</td>";
			buffer += "</tr>";
			buffer += "<tr>";
			buffer += "<th width='180'>现有人数：</th>";
			buffer += "<td width='180'>"+(data["applyInfo"].existingNo!=null ? data["applyInfo"].existingNo : "")+"人</td>";
			buffer += "<th width='180'>预算人数：</th>";
			buffer += "<td width='180'>"+(data["applyInfo"].budgetNo!=null ? data["applyInfo"].budgetNo : "")+"人</td>";
			buffer += "</tr>";
			buffer += "<tr>";
			buffer += "<th width='180'>职位名称：</th>";
			buffer += "<td width='180'>"+(data["applyInfo"].position!=null ? data["applyInfo"].position : "&nbsp;")+"</td>";
			buffer += "<th width='180'>需求人数：</th>";
			buffer += "<td width='180'>"+(data["applyInfo"].demandNo!=null ? data["applyInfo"].demandNo : "")+"人</td>";
			buffer += "</tr>";
			buffer += "<tr>";
			buffer += "<th width='180'>级别：</th>";
			buffer += "<td width='540' colspan='3'>"+(data["applyInfo"].rankUuid!=null ? data["applyInfo"].rank.description : "&nbsp;")+"</td>";
			buffer += "</tr>";
			buffer += "<tr>";
			buffer += "<th width='180'>直接上级：</th>";
			buffer += "<td width='180'>"+(data["applyInfo"].leaderUuid!=null ? data["applyInfo"].leader.person.name : "&nbsp;")+"</td>";
			buffer += "</td>";
			buffer += "<th width='180'>直接下级：</th>";
			buffer += "</td>";
			buffer += "<td width='180'>"+(data["applyInfo"].subordinateUuid!=null ? data["applyInfo"].subordinate.person.name : "&nbsp;")+"</td>";
			buffer += "</tr>";
			buffer += "<tr>";
			buffer += "<th width='180'>下属人数：</th>";
			buffer += "<td width='180'>"+(data["applyInfo"].subordinatesNo!=null ? data["applyInfo"].subordinatesNo : "")+"人</td>";
			buffer += "<th width='180'>其他：</th>";
			buffer += "<td width='180'>"+(data["applyInfo"].otherUuid!=null ? data["applyInfo"].other.description : "&nbsp;")+"</td>";
			buffer += "</td>";
			buffer += "</tr>";
			buffer += "<tr>";
			buffer += "<th width='180'>试用期最低工资：</th>";
			buffer += "<td width='180'>"+(data["applyInfo"].probationLow!=null ? data["applyInfo"].probationLow : "")+"元</td>";
			buffer += "<th width='180'>试用期最高工资：</th>";
			buffer += "<td width='180'>"+(data["applyInfo"].probationHigh!=null ? data["applyInfo"].probationHigh : "")+"元</td>";
			buffer += "</tr>";
			buffer += "<tr>";
			buffer += "<th width='180'>转正最低工资：</th>";
			buffer += "<td width='180'>"+(data["applyInfo"].positiveLow!=null ? data["applyInfo"].positiveLow : "")+"元</td>";
			buffer += "<th width='180'>转正最高工资：</th>";
			buffer += "<td width='180'>"+(data["applyInfo"].positiveHigh!=null ? data["applyInfo"].positiveHigh : "")+"元</td>";
			buffer += "</tr>";
			buffer += "<tr>";
			buffer += "<th width='180'>其他福利待遇：</th>";
			buffer += "<td width='540' colspan='3'>"+(data["applyInfo"].welfare!=null ? data["applyInfo"].welfare : "&nbsp;")+"</td>";
			buffer += "</tr>";
			buffer += "<tr>";
			buffer += "<th width='180'>工作职责：</th>";
			buffer += "<td width='540' colspan='3'>"+(data["applyInfo"].duty!=null ? data["applyInfo"].duty : "&nbsp;")+"</td>";
			buffer += "</tr>";
			buffer += "<tr>";
			buffer += "<th width='180'>性别：</th>";
			buffer += "<td width='540' colspan='3'>"+(data["applyInfo"].genderUuid!=null ? data["applyInfo"].gender.description : "&nbsp;")+"</td>";
			buffer += "</tr>";
			buffer += "<tr>";
			buffer += "<th width='180'>最小年龄：</th>";
			buffer += "<td width='180'>"+(data["applyInfo"].ageLow!=null ? data["applyInfo"].ageLow : "")+"岁</td>";
			buffer += "<th width='180'>最大年龄：</th>";
			buffer += "<td width='180'>"+(data["applyInfo"].ageHigh!=null ? data["applyInfo"].ageHigh : "")+"岁</td>";
			buffer += "</tr>";
			buffer += "<tr>";
			buffer += "<th width='180'>学历：</th>";
			buffer += "<td width='180'>"+(data["applyInfo"].educationUuid!=null ? data["applyInfo"].education.description : "&nbsp;")+"</td>";
			buffer += "<th width='180'>主修专业：</th>";
			buffer += "<td width='180'>"+(data["applyInfo"].major!=null ? data["applyInfo"].major : "&nbsp;")+"</td>";
			buffer += "</tr>";
			buffer += "<tr>";
			buffer += "<th width='180'>专业技术：</th>";
			buffer += "<td width='540' colspan='3'>"+(data["applyInfo"].professional!=null ? data["applyInfo"].professional : "&nbsp;")+"</td>";
			buffer += "</tr>";
			buffer += "<tr>";
			buffer += "<th width='180'>管理能力：</th>";
			buffer += "<td width='540' colspan='3'>"+(data["applyInfo"].managementAbility!=null ? data["applyInfo"].managementAbility : "&nbsp;")+"</td>";
			buffer += "</tr>";
			buffer += "<tr>";
			buffer += "<th width='180'>工作背景：</th>";
			buffer += "<td width='540' colspan='3'>"+(data["applyInfo"].background!=null ? data["applyInfo"].background : "&nbsp;")+"</td>";
			buffer += "</tr>";
			buffer += "<tr>";
			buffer += "<th width='180'>其他技术：</th>";
			buffer += "<td width='540' colspan='3'>"+(data["applyInfo"].otherTechnology!=null ? data["applyInfo"].otherTechnology : "&nbsp;")+"</td>";
			buffer += "</tr>";
			buffer += "<tr>";
			buffer += "<th width='180'>希望几周内到岗：</th>";
			buffer += "<td width='180'>"+(data["applyInfo"].weeks!=null ? data["applyInfo"].weeks : "")+"周</td>";
			buffer += "<th width='180'>希望到岗日期：</th>";
			buffer += "<td width='180'>"+(data["applyInfo"].specificTime!=null ? data["applyInfo"].specificTime.substring(0, 10) : "&nbsp;")+"</td>";
			buffer += "</tr>";
			buffer += "</table>";
			buffer += "<br>";
			buffer += "<table width='720' border='0' cellpadding='0' cellspacing='0' class='InfoShowPanel_2'>";
			if(data["authoritys"].indexOf("<%=Constants.APPROVAL_AUTHORITY_1_1%>")==-1){
				buffer += "<tr>";
				buffer += "<th width='180'>部门处长意见：</th>";
				buffer += "<td width='540' colspan='3' style='height:100px;vertical-align:top;padding-top:5px'>"+(data["applyInfo"].apply.notesOne != null ? data["applyInfo"].apply.notesOne : "&nbsp;")+"</td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<th>审批结果：</th>";
				buffer += "<td width='540' colspan='3'>"+(data["applyInfo"].apply.checkStateOneUuid!=null ? data["applyInfo"].apply.checkStateOne.description : "&nbsp;")+"</td>";
				buffer += "</tr>";
			}
			else {
				buffer += "<tr>";
				buffer += "<th width='180'>部门处长意见：</th>";
				buffer += "<td width='540' colspan='3'><textarea name='instance(Apply).notesOne' style='width:530px;height:100px'></textarea></td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<th>审批结果：</th>";
				buffer += "<td width='540' colspan='3'><select name='instance(Apply).checkStateOneUuid'><option value='<%=Constants.EXAMINATION_STATE_PASSED%>'>通过</option><option value='<%=Constants.EXAMINATION_STATE_UNPASSED%>'>未通过</option></select>&nbsp;<font color='#996633'>*</font></td>";
				buffer += "</tr>";
			}
			if(data["authoritys"].indexOf("<%=Constants.APPROVAL_AUTHORITY_1_2%>")==-1){
				buffer += "<tr>";
				buffer += "<th width='180'>人力资源处处长意见：</th>";
				buffer += "<td width='540' colspan='3' style='height:100px;vertical-align:top;padding-top:5px'>"+(data["applyInfo"].apply.notesTwo != null ? data["applyInfo"].apply.notesTwo : "&nbsp;")+"</td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<th>审批结果：</th>";
				buffer += "<td width='540' colspan='3'>"+(data["applyInfo"].apply.checkStateTwoUuid!=null ? data["applyInfo"].apply.checkStateTwo.description : "&nbsp;")+"</td>";
				buffer += "</tr>";
			}
			else {
				buffer += "<tr>";
				buffer += "<th width='180'>人力资源处处长意见：</th>";
				buffer += "<td width='540' colspan='3'><textarea name='instance(Apply).notesTwo' style='width:530px;height:100px'></textarea></td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<th>审批结果：</th>";
				buffer += "<td width='540' colspan='3'><select name='instance(Apply).checkStateTwoUuid'><option value='<%=Constants.EXAMINATION_STATE_PASSED%>'>通过</option><option value='<%=Constants.EXAMINATION_STATE_UNPASSED%>'>未通过</option></select>&nbsp;<font color='#996633'>*</font></td>";
				buffer += "</tr>";
			}
			if(data["authoritys"].indexOf("<%=Constants.APPROVAL_AUTHORITY_1_3%>")==-1){
				buffer += "<tr>";
				buffer += "<th width='180'>校长意见：</th>";
				buffer += "<td width='540' colspan='3' style='height:100px;vertical-align:top;padding-top:5px'>"+(data["applyInfo"].apply.notesThree != null ? data["applyInfo"].apply.notesThree : "&nbsp;")+"</td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<th>审批结果：</th>";
				buffer += "<td width='540' colspan='3'>"+(data["applyInfo"].apply.checkStateThreeUuid!=null ? data["applyInfo"].apply.checkStateThree.description : "&nbsp;")+"</td>";
				buffer += "</tr>";
			}
			else {
				buffer += "<tr>";
				buffer += "<th width='180'>校长意见：</th>";
				buffer += "<td width='540' colspan='3'><textarea name='instance(Apply).notesThree' style='width:530px;height:100px'></textarea></td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<th>审批结果：</th>";
				buffer += "<td width='540' colspan='3'><select name='instance(Apply).checkStateThreeUuid'><option value='<%=Constants.EXAMINATION_STATE_PASSED%>'>通过</option><option value='<%=Constants.EXAMINATION_STATE_UNPASSED%>'>未通过</option></select>&nbsp;<font color='#996633'>*</font></td>";
				buffer += "</tr>";
			}
			buffer += "</table>";
			buffer += "</form>";
			buffer += "<br>";
			buffer += "<a href='javascript:createInstance(\""+id+"_form\")'><img src='"+cp+"/images/button/b_confirm_2.gif' /></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href='javascript:hideTimeout(\""+id+"\")'><img src='"+cp+"/images/button/b_cancel.gif'/></a>";
			buffer += "<br><br>";
			buffer += "</div></td></tr>";
		}
		else if(data["type"] == "relationship"){
			var buffer = "<tr><td colspan='9' align='center'><div id='"+id+"_div' style='overflow:hidden' value='0'>";
			buffer += "<br>";
			buffer += "<form id='"+id+"_form'>";
			buffer += "<input type='hidden' name='instance(Apply).uuid' value='"+uuid+"' />";
			buffer += "<table width='720' border='0' cellpadding='0' cellspacing='0' class='InfoShowPanel_2'>";
			buffer += "<tr>";
			buffer += "<th width='180'>姓名：</th>";
			buffer += "<td width='540' colspan='3'>"+(data["applyInfo"].teacherUuid!=null ? data["applyInfo"].teacher.person.name : "&nbsp;")+"</td>";
			buffer += "</tr>";
			buffer += "<tr>";
			buffer += "<th width='180'>原组织机构：</th>";
			buffer += "<td width='180'>"+(data["applyInfo"].originalUuid!=null ? data["applyInfo"].original.description : "&nbsp;")+"</td>";
			buffer += "<th width='180'>调往组织机构：</th>";
			buffer += "<td width='180'>"+(data["applyInfo"].transferUuid!=null ? data["applyInfo"].transfer.description : "&nbsp;")+"</td>";
			buffer += "</tr>";
			buffer += "<tr>";
			buffer += "<th width='180'>离岗时间：</th>";
			buffer += "<td width='180'>"+(data["applyInfo"].postTime!=null ? data["applyInfo"].postTime.substring(0, 10) : "&nbsp;")+"</td>";
			buffer += "<th width='180'>到岗时间：</th>";
			buffer += "<td width='180'>"+(data["applyInfo"].arrivalTime!=null ? data["applyInfo"].arrivalTime.substring(0, 10) : "&nbsp;")+"</td>";
			buffer += "</tr>";
			buffer += "</table>";
			buffer += "<br>";
			buffer += "<table width='720' border='0' cellpadding='0' cellspacing='0' class='InfoShowPanel_2'>";
			if(data["authoritys"].indexOf("<%=Constants.APPROVAL_AUTHORITY_2_1%>")==-1){
				buffer += "<tr>";
				buffer += "<th width='180'>人力资源处处长意见：</th>";
				buffer += "<td width='540' colspan='3' style='height:100px;vertical-align:top;padding-top:5px'>"+(data["applyInfo"].apply.notesOne != null ? data["applyInfo"].apply.notesOne : "&nbsp;")+"</td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<th>审批结果：</th>";
				buffer += "<td width='540' colspan='3'>"+(data["applyInfo"].apply.checkStateOneUuid!=null ? data["applyInfo"].apply.checkStateOne.description : "&nbsp;")+"</td>";
				buffer += "</tr>";
			}
			else {
				buffer += "<tr>";
				buffer += "<th width='180'>人力资源处处长意见：</th>";
				buffer += "<td width='540' colspan='3'><textarea name='instance(Apply).notesOne' style='width:530px;height:100px'></textarea></td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<th>审批结果：</th>";
				buffer += "<td width='540' colspan='3'><select name='instance(Apply).checkStateOneUuid'><option value='<%=Constants.EXAMINATION_STATE_PASSED%>'>通过</option><option value='<%=Constants.EXAMINATION_STATE_UNPASSED%>'>未通过</option></select>&nbsp;<font color='#996633'>*</font></td>";
				buffer += "</tr>";
			}
			if(data["authoritys"].indexOf("<%=Constants.APPROVAL_AUTHORITY_2_2%>")==-1){
				buffer += "<tr>";
				buffer += "<th width='180'>副校长意见：</th>";
				buffer += "<td width='540' colspan='3' style='height:100px;vertical-align:top;padding-top:5px'>"+(data["applyInfo"].apply.notesTwo != null ? data["applyInfo"].apply.notesTwo : "&nbsp;")+"</td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<th>审批结果：</th>";
				buffer += "<td width='540' colspan='3'>"+(data["applyInfo"].apply.checkStateTwoUuid!=null ? data["applyInfo"].apply.checkStateTwo.description : "&nbsp;")+"</td>";
				buffer += "</tr>";
			}
			else {
				buffer += "<tr>";
				buffer += "<th width='180'>副校长意见：</th>";
				buffer += "<td width='540' colspan='3'><textarea name='instance(Apply).notesTwo' style='width:530px;height:100px'></textarea></td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<th>审批结果：</th>";
				buffer += "<td width='540' colspan='3'><select name='instance(Apply).checkStateTwoUuid'><option value='<%=Constants.EXAMINATION_STATE_PASSED%>'>通过</option><option value='<%=Constants.EXAMINATION_STATE_UNPASSED%>'>未通过</option></select>&nbsp;<font color='#996633'>*</font></td>";
				buffer += "</tr>";
			}
			if(data["authoritys"].indexOf("<%=Constants.APPROVAL_AUTHORITY_2_3%>")==-1){
				buffer += "<tr>";
				buffer += "<th width='180'>校长意见：</th>";
				buffer += "<td width='540' colspan='3' style='height:100px;vertical-align:top;padding-top:5px'>"+(data["applyInfo"].apply.notesThree != null ? data["applyInfo"].apply.notesThree : "&nbsp;")+"</td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<th>审批结果：</th>";
				buffer += "<td width='540' colspan='3'>"+(data["applyInfo"].apply.checkStateThreeUuid!=null ? data["applyInfo"].apply.checkStateThree.description : "&nbsp;")+"</td>";
				buffer += "</tr>";
			}
			else {
				buffer += "<tr>";
				buffer += "<th width='180'>校长意见：</th>";
				buffer += "<td width='540' colspan='3'><textarea name='instance(Apply).notesThree' style='width:530px;height:100px'></textarea></td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<th>审批结果：</th>";
				buffer += "<td width='540' colspan='3'><select name='instance(Apply).checkStateThreeUuid'><option value='<%=Constants.EXAMINATION_STATE_PASSED%>'>通过</option><option value='<%=Constants.EXAMINATION_STATE_UNPASSED%>'>未通过</option></select>&nbsp;<font color='#996633'>*</font></td>";
				buffer += "</tr>";
			}
			buffer += "</table>";
			buffer += "</form>";
			buffer += "<br>";
			buffer += "<a href='javascript:createInstance(\""+id+"_form\")'><img src='"+cp+"/images/button/b_confirm_2.gif' /></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href='javascript:hideTimeout(\""+id+"\")'><img src='"+cp+"/images/button/b_cancel.gif'/></a>";
			buffer += "<br><br>";
			buffer += "</div></td></tr>";
		}
		else if(data["type"] == "quit"){
			var buffer = "<tr><td colspan='11' align='center'><div id='"+id+"_div' style='overflow:hidden' value='0'>";
			buffer += "<br>";
			buffer += "<form id='"+id+"_form'>";
			buffer += "<input type='hidden' name='instance(Apply).uuid' value='"+uuid+"' />";
			buffer += "<table width='720' border='0' cellpadding='0' cellspacing='0' class='InfoShowPanel_2'>";
			buffer += "<tr>";
			buffer += "<th width='180'>离职员工姓名：</th>";
			buffer += "<td width='180'>"+(data["applyInfo"].employeeUuid!=null ? data["applyInfo"].employee.person.name : "&nbsp;")+"</td>";
			buffer += "<th width='180'>组织机构：</th>";
			buffer += "<td width='180'>"+(data["applyInfo"].departmentUuid!=null ? data["applyInfo"].department.description : "&nbsp;")+"</td>";
			buffer += "</tr>";
			buffer += "<tr>";
			buffer += "<th width='180'>离职类别：</th>";
			buffer += "<td width='180'>"+(data["applyInfo"].departureTypeUuid!=null ? data["applyInfo"].departureType.description : "&nbsp;")+"</td>";
			buffer += "<th width='180'>离职时间：</th>";
			buffer += "<td width='180'>"+(data["applyInfo"].departureTime!=null ? data["applyInfo"].departureTime.substring(0, 10) : "&nbsp;")+"</td>";
			buffer += "</tr>";
			buffer += "<tr>";
			buffer += "<th width='180'>离职原因：</th>";
			buffer += "<td width='540' colspan='3'>"+(data["applyInfo"].reason!=null ? data["applyInfo"].reason : "&nbsp;")+"</td>";
			buffer += "</tr>";
			buffer += "</table>";
			buffer += "<br>";
			buffer += "<table width='720' border='0' cellpadding='0' cellspacing='0' class='InfoShowPanel_2'>";
			if(data["authoritys"].indexOf("<%=Constants.APPROVAL_AUTHORITY_3_1%>")==-1){
				buffer += "<tr>";
				buffer += "<th width='180'>分校校长意见：</th>";
				buffer += "<td width='540' colspan='3' style='height:100px;vertical-align:top;padding-top:5px'>"+(data["applyInfo"].apply.notesOne != null ? data["applyInfo"].apply.notesOne : "&nbsp;")+"</td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<th>审批结果：</th>";
				buffer += "<td width='540' colspan='3'>"+(data["applyInfo"].apply.checkStateOneUuid!=null ? data["applyInfo"].apply.checkStateOne.description : "&nbsp;")+"</td>";
				buffer += "</tr>";
			}
			else {
				buffer += "<tr>";
				buffer += "<th width='180'>分校校长意见：</th>";
				buffer += "<td width='540' colspan='3'><textarea name='instance(Apply).notesOne' style='width:530px;height:100px'></textarea></td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<th>审批结果：</th>";
				buffer += "<td width='540' colspan='3'><select name='instance(Apply).checkStateOneUuid'><option value='<%=Constants.EXAMINATION_STATE_PASSED%>'>通过</option><option value='<%=Constants.EXAMINATION_STATE_UNPASSED%>'>未通过</option></select>&nbsp;<font color='#996633'>*</font></td>";
				buffer += "</tr>";
			}
			if(data["authoritys"].indexOf("<%=Constants.APPROVAL_AUTHORITY_3_2%>")==-1){
				buffer += "<tr>";
				buffer += "<th width='180'>人力资源处处长意见：</th>";
				buffer += "<td width='540' colspan='3' style='height:100px;vertical-align:top;padding-top:5px'>"+(data["applyInfo"].apply.notesTwo != null ? data["applyInfo"].apply.notesTwo : "&nbsp;")+"</td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<th>审批结果：</th>";
				buffer += "<td width='540' colspan='3'>"+(data["applyInfo"].apply.checkStateTwoUuid!=null ? data["applyInfo"].apply.checkStateTwo.description : "&nbsp;")+"</td>";
				buffer += "</tr>";
			}
			else {
				buffer += "<tr>";
				buffer += "<th width='180'>人力资源处处长意见：</th>";
				buffer += "<td width='540' colspan='3'><textarea name='instance(Apply).notesTwo' style='width:530px;height:100px'></textarea></td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<th>审批结果：</th>";
				buffer += "<td width='540' colspan='3'><select name='instance(Apply).checkStateTwoUuid'><option value='<%=Constants.EXAMINATION_STATE_PASSED%>'>通过</option><option value='<%=Constants.EXAMINATION_STATE_UNPASSED%>'>未通过</option></select>&nbsp;<font color='#996633'>*</font></td>";
				buffer += "</tr>";
			}
			if(data["authoritys"].indexOf("<%=Constants.APPROVAL_AUTHORITY_3_3%>")==-1){
				buffer += "<tr>";
				buffer += "<th width='180'>副校长意见：</th>";
				buffer += "<td width='540' colspan='3' style='height:100px;vertical-align:top;padding-top:5px'>"+(data["applyInfo"].apply.notesThree != null ? data["applyInfo"].apply.notesThree : "&nbsp;")+"</td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<th>审批结果：</th>";
				buffer += "<td width='540' colspan='3'>"+(data["applyInfo"].apply.checkStateThreeUuid!=null ? data["applyInfo"].apply.checkStateThree.description : "&nbsp;")+"</td>";
				buffer += "</tr>";
			}
			else {
				buffer += "<tr>";
				buffer += "<th width='180'>副校长意见：</th>";
				buffer += "<td width='540' colspan='3'><textarea name='instance(Apply).notesThree' style='width:530px;height:100px'></textarea></td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<th>审批结果：</th>";
				buffer += "<td width='540' colspan='3'><select name='instance(Apply).checkStateThreeUuid'><option value='<%=Constants.EXAMINATION_STATE_PASSED%>'>通过</option><option value='<%=Constants.EXAMINATION_STATE_UNPASSED%>'>未通过</option></select>&nbsp;<font color='#996633'>*</font></td>";
				buffer += "</tr>";
			}						
			if(data["authoritys"].indexOf("<%=Constants.APPROVAL_AUTHORITY_3_4%>")==-1){
				buffer += "<tr>";
				buffer += "<th width='180'>校长意见：</th>";
				buffer += "<td width='540' colspan='3' style='height:100px;vertical-align:top;padding-top:5px'>"+(data["applyInfo"].apply.notesFour != null ? data["applyInfo"].apply.notesFour : "&nbsp;")+"</td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<th>审批结果：</th>";
				buffer += "<td width='540' colspan='3'>"+(data["applyInfo"].apply.checkStateFourUuid!=null ? data["applyInfo"].apply.checkStateFour.description : "&nbsp;")+"</td>";
				buffer += "</tr>";
			}
			else {
				buffer += "<tr>";
				buffer += "<th width='180'>校长意见：</th>";
				buffer += "<td width='540' colspan='3'><textarea name='instance(Apply).notesFour' style='width:530px;height:100px'></textarea></td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<th>审批结果：</th>";
				buffer += "<td width='540' colspan='3'><select name='instance(Apply).checkStateFourUuid'><option value='<%=Constants.EXAMINATION_STATE_PASSED%>'>通过</option><option value='<%=Constants.EXAMINATION_STATE_UNPASSED%>'>未通过</option></select>&nbsp;<font color='#996633'>*</font></td>";
				buffer += "</tr>";
			}	
			buffer += "</table>";
			buffer += "</form>";
			buffer += "<br>";
			buffer += "<a href='javascript:createInstance(\""+id+"_form\")'><img src='"+cp+"/images/button/b_confirm_2.gif' /></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href='javascript:hideTimeout(\""+id+"\")'><img src='"+cp+"/images/button/b_cancel.gif'/></a>";
			buffer += "<br><br>";
			buffer += "</div></td></tr>";
		}
		else if(data["type"] == "leave"){
			var buffer = "<tr><td colspan='9' align='center'><div id='"+id+"_div' style='overflow:hidden' value='0'>";
			buffer += "<br>";
			buffer += "<form id='"+id+"_form'>";
			buffer += "<input type='hidden' name='instance(Apply).uuid' value='"+uuid+"' />";
			buffer += "<input type='hidden' name='instance(Apply).timeStamp' value='"+(data["applyInfo"].days!=null ? data["applyInfo"].days : "0")+"' />";
			buffer += "<table width='720' border='0' cellpadding='0' cellspacing='0' class='InfoShowPanel_2'>";
			buffer += "<tr>";
			buffer += "<th width='180'>申请人：</th>";
			buffer += "<td width='180'>"+(data["applyInfo"].apply.applicantUuid!=null ? data["applyInfo"].apply.applicant.person.name : "&nbsp;")+"</td>";
			buffer += "<th width='180'>组织机构：</th>";
			buffer += "<td width='180'>"+(data["applyInfo"].departmentUuid!=null ? data["applyInfo"].department.description : "&nbsp;")+"</td>";
			buffer += "</tr>";
			buffer += "<tr>";
			buffer += "<th width='180'>请假类别：</th>";
			buffer += "<td width='180' colspan='3'>"+(data["applyInfo"].leaveTypeUuid!=null ? data["applyInfo"].leaveType.description : "&nbsp;")+"</td>";
			buffer += "</tr>";
			buffer += "<tr>";
			buffer += "<th width='180'>请假事由：</th>";
			buffer += "<td width='540' colspan='3'>"+(data["applyInfo"].leaveReason!=null ? data["applyInfo"].leaveReason : "&nbsp;")+"</td>";
			buffer += "</tr>";
			buffer += "<tr>";
			buffer += "<th width='180'>开始时间：</th>";
			buffer += "<td width='180'>"+(data["applyInfo"].fromDt!=null ? data["applyInfo"].fromDt.substring(0, 10) : "&nbsp;")+"</td>";
			buffer += "<th width='180'>结束时间：</th>";
			buffer += "<td width='180'>"+(data["applyInfo"].toDt!=null ? data["applyInfo"].toDt.substring(0, 10) : "&nbsp;")+"</td>";
			buffer += "</tr>";
			buffer += "<tr>";
			buffer += "<th width='180'>请假天数：</th>";
			buffer += "<td width='540' colspan='3'>"+(data["applyInfo"].days!=null ? data["applyInfo"].days : "&nbsp;")+"</td>";
			buffer += "</tr>";
			buffer += "</table>";
			buffer += "<br>";
			buffer += "<table width='720' border='0' cellpadding='0' cellspacing='0' class='InfoShowPanel_2'>";
			if(data["authoritys"].indexOf("<%=Constants.APPROVAL_AUTHORITY_4_1%>")==-1){
				buffer += "<tr>";
				buffer += "<th width='180'>主管领导意见：</th>";
				buffer += "<td width='540' colspan='3' style='height:100px;vertical-align:top;padding-top:5px'>"+(data["applyInfo"].apply.notesOne != null ? data["applyInfo"].apply.notesOne : "&nbsp;")+"</td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<th>审批结果：</th>";
				buffer += "<td width='540' colspan='3'>"+(data["applyInfo"].apply.checkStateOneUuid!=null ? data["applyInfo"].apply.checkStateOne.description : "&nbsp;")+"</td>";
				buffer += "</tr>";
			}
			else {
				buffer += "<tr>";
				buffer += "<th width='180'>主管领导意见：</th>";
				buffer += "<td width='540' colspan='3'><textarea name='instance(Apply).notesOne' style='width:530px;height:100px'></textarea></td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<th>审批结果：</th>";
				buffer += "<td width='540' colspan='3'><select name='instance(Apply).checkStateOneUuid'><option value='<%=Constants.EXAMINATION_STATE_PASSED%>'>通过</option><option value='<%=Constants.EXAMINATION_STATE_UNPASSED%>'>未通过</option></select>&nbsp;<font color='#996633'>*</font></td>";
				buffer += "</tr>";
			}
			if(data["authoritys"].indexOf("<%=Constants.APPROVAL_AUTHORITY_4_2%>")==-1){
				buffer += "<tr>";
				buffer += "<th width='180'>分校校长意见：</th>";
				buffer += "<td width='540' colspan='3' style='height:100px;vertical-align:top;padding-top:5px'>"+(data["applyInfo"].apply.notesTwo != null ? data["applyInfo"].apply.notesTwo : "&nbsp;")+"</td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<th>审批结果：</th>";
				buffer += "<td width='540' colspan='3'>"+(data["applyInfo"].apply.checkStateTwoUuid!=null ? data["applyInfo"].apply.checkStateTwo.description : "&nbsp;")+"</td>";
				buffer += "</tr>";
			}
			else {
				buffer += "<tr>";
				buffer += "<th width='180'>分校校长意见：</th>";
				buffer += "<td width='540' colspan='3'><textarea name='instance(Apply).notesTwo' style='width:530px;height:100px'></textarea></td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<th>审批结果：</th>";
				buffer += "<td width='540' colspan='3'><select name='instance(Apply).checkStateTwoUuid'><option value='<%=Constants.EXAMINATION_STATE_PASSED%>'>通过</option><option value='<%=Constants.EXAMINATION_STATE_UNPASSED%>'>未通过</option></select>&nbsp;<font color='#996633'>*</font></td>";
				buffer += "</tr>";
			}
			if(data["authoritys"].indexOf("<%=Constants.APPROVAL_AUTHORITY_4_3%>")==-1){
				buffer += "<tr>";
				buffer += "<th width='180'>校长意见：</th>";
				buffer += "<td width='540' colspan='3' style='height:100px;vertical-align:top;padding-top:5px'>"+(data["applyInfo"].apply.notesThree != null ? data["applyInfo"].apply.notesThree : "&nbsp;")+"</td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<th>审批结果：</th>";
				buffer += "<td width='540' colspan='3'>"+(data["applyInfo"].apply.checkStateThreeUuid!=null ? data["applyInfo"].apply.checkStateThree.description : "&nbsp;")+"</td>";
				buffer += "</tr>";
			}
			else {
				buffer += "<tr>";
				buffer += "<th width='180'>校长意见：</th>";
				buffer += "<td width='540' colspan='3'><textarea name='instance(Apply).notesThree' style='width:530px;height:100px'></textarea></td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<th>审批结果：</th>";
				buffer += "<td width='540' colspan='3'><select name='instance(Apply).checkStateThreeUuid'><option value='<%=Constants.EXAMINATION_STATE_PASSED%>'>通过</option><option value='<%=Constants.EXAMINATION_STATE_UNPASSED%>'>未通过</option></select>&nbsp;<font color='#996633'>*</font></td>";
				buffer += "</tr>";
			}						
			buffer += "</table>";
			buffer += "</form>";
			buffer += "<br>";
			buffer += "<a href='javascript:createInstance(\""+id+"_form\")'><img src='"+cp+"/images/button/b_confirm_2.gif' /></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href='javascript:hideTimeout(\""+id+"\")'><img src='"+cp+"/images/button/b_cancel.gif'/></a>";
			buffer += "<br><br>";
			buffer += "</div></td></tr>";
		}
		else if(data["type"] == "publicity"){
			var buffer = "<tr><td colspan='7' align='center'><div id='"+id+"_div' style='overflow:hidden' value='0'>";
			buffer += "<br>";
			buffer += "<form id='"+id+"_form'>";
			buffer += "<input type='hidden' name='instance(Apply).uuid' value='"+uuid+"' />";
			buffer += "<table width='720' border='0' cellpadding='0' cellspacing='0' class='InfoShowPanel_2'>";
			buffer += "<tr>";
			buffer += "<th width='120'>申请人：</th>";
			buffer += "<td width='120'>"+(data["applyInfo"].applyUuid!=null ? data["applyInfo"].apply.applicant.person.name : "&nbsp;")+"</td>";
			buffer += "<th width='120'>组织机构：</th>";
			buffer += "<td width='120'>"+(data["applyInfo"].departmentUuid!=null ? data["applyInfo"].department.description : "&nbsp;")+"</td>";
			buffer += "<th width='120'>校区：</th>";
			buffer += "<td width='120'>"+(data["applyInfo"].campusUuid!=null ? data["applyInfo"].campus.description : "&nbsp;")+"</td>";
			buffer += "</tr>";
			buffer += "<tr>";
			buffer += "<th width='120'>活动简述：</th>";
			buffer += "<td width='600' colspan='5'>";
			buffer += "<div style='height:100px;margin-top:3px'>&nbsp;&nbsp;"+(data["applyInfo"].description!=null ? data["applyInfo"].description : "&nbsp;")+"</div>";
			buffer += "</td>";
			buffer += "</tr>";
			buffer += "<tr>";
			buffer += "<th width='120'>活动时间：</th>";
			buffer += "<td width='600' colspan='5'>"+(data["applyInfo"].activityTime!=null ? data["applyInfo"].activityTime.substring(0, 10) : "&nbsp;")+"</td>";
			buffer += "</tr>";
			buffer += "<tr>";
			buffer += "<th width='120'>活动地点：</th>";
			buffer += "<td width='600' colspan='5'>"+(data["applyInfo"].location!=null ? data["applyInfo"].location : "&nbsp;")+"</td>";
			buffer += "</tr>";
			buffer += "<tr>";
			buffer += "<th width='120'>文案：</th>";
			buffer += "<td width='600' colspan='5' style='vertical-align:top'>";
			buffer += "<div style='height:100px;margin-top:3px'>&nbsp;&nbsp;"+(data["applyInfo"].copyContent!=null ? data["applyInfo"].copyContent : "&nbsp;")+"</div>";
			buffer += "<a href='javascript:downloadResource(\""+data["applyInfo"].copyFileUuid+"\")'>"+(data["applyInfo"].copyFileUuid!=null ? data["applyInfo"].copyFile.name : "")+"</a>";
			buffer += "</td>";
			buffer += "</tr>";
			buffer += "<tr>";
			buffer += "<th width='120'>预参与员工：</th>";
			buffer += "<td width='600' colspan='5'>";
			for(var i=0; i<data["applyInfo"].preParticipators.length; i++){
				buffer += data["applyInfo"].preParticipators[i].employee.person.name+",";
			}
			buffer += "</td>";
			buffer += "</tr>";
			buffer += "<tr>";
			buffer += "<th width='120'>预估成本：</th>";
			buffer += "<td width='600' colspan='5'>"+(data["applyInfo"].preCost!=null ? data["applyInfo"].preCost : "")+"&nbsp;元</td>";
			buffer += "</tr>";
			buffer += "<tr>";
			buffer += "<th width='120'>备注：</th>";
			buffer += "<td width='600' colspan='5'>";
			buffer += "<div style='height:100px;margin-top:3px'>&nbsp;&nbsp;"+(data["applyInfo"].notes!=null ? data["applyInfo"].notes : "&nbsp;")+"</div>";
			buffer += "</td>";
			buffer += "</tr>";
			buffer += "</table>";
			buffer += "<br>";
			for(var i=0; i<data["applyInfo"].materials.length; i++){
				buffer += "<table width='720' border='0' cellpadding='0' cellspacing='0' class='InfoShowPanel_2'>";
				buffer += "<tr>";
				buffer += "<th width='720' colspan='3'>";
				buffer += "宣传品"+(i+1);
				buffer += "</th>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<th width='120'>申请物料：</th>";
				buffer += "<td width='600' colspan='2'>"+(data["applyInfo"].materials[i].applicationMaterialUuid!=null ? data["applyInfo"].materials[i].applicationMaterial.description : "")+"&nbsp;"+(data["applyInfo"].materials[i].materialOther!=null ? data["applyInfo"].materials[i].materialOther : "")+"</td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<th width='120'>申请数量：</th>";
				buffer += "<td width='600' colspan='2'>"+(data["applyInfo"].materials[i].applicationNumber!=null ? data["applyInfo"].materials[i].applicationNumber : "&nbsp;")+"</td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<th width='120' rowspan='3'>规格要求：</th>";
				buffer += "<td width='100'>尺寸(成品)</td>";
				buffer += "<td width='500'>"+(data["applyInfo"].materials[i].applicationMaterialSizeUuid!=null ? data["applyInfo"].materials[i].applicationMaterialSize.description : "")+"&nbsp;"+(data["applyInfo"].materials[i].sizeOther!=null ? data["applyInfo"].materials[i].sizeOther : "")+"</td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<td width='100'>色彩</td>";
				buffer += "<td width='500'>"+(data["applyInfo"].materials[i].applicationMaterialColorUuid!=null ? data["applyInfo"].materials[i].applicationMaterialColor.description : "&nbsp;");
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<td width='100'>材质</td>";
				buffer += "<td width='500'>"+(data["applyInfo"].materials[i].applicationMaterialTextureUuid!=null ? data["applyInfo"].materials[i].applicationMaterialTexture.description : "")+"&nbsp;"+(data["applyInfo"].materials[i].textureOther!=null ? data["applyInfo"].materials[i].textureOther : "")+"</td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<th width='120'>制作单位：</th>";
				buffer += "<td width='600' colspan='2'>"+(data["applyInfo"].materials[i].productionUnitUuid!=null ? data["applyInfo"].materials[i].productionUnit.description : "")+"&nbsp;"+(data["applyInfo"].materials[i].unitOther!=null ? data["applyInfo"].materials[i].unitOther : "")+"</td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<th width='120'>设计负责人：</th>";
				buffer += "<td width='600' colspan='2'>"+(data["applyInfo"].materials[i].designer!=null ? data["applyInfo"].materials[i].designer : "&nbsp;")+"</td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<th width='120'>制作周期：</th>";
				buffer += "<td width='600' colspan='2'>"+(data["applyInfo"].materials[i].makeStartTime!=null ? data["applyInfo"].materials[i].makeStartTime.substring(0, 10) : "&nbsp;")+"&nbsp;-&nbsp;"+(data["applyInfo"].materials[i].makeEndTime!=null ? data["applyInfo"].materials[i].makeEndTime.substring(0, 10) : "&nbsp;")+"&nbsp;&nbsp;"+(data["applyInfo"].materials[i].makeDays!=null ? data["applyInfo"].materials[i].makeDays : "&nbsp;")+"&nbsp;天</td>";
				buffer += "</tr>";
				buffer += "</table>";
				buffer += "<br>";
			}
			buffer += "<table width='720' border='0' cellpadding='0' cellspacing='0' class='InfoShowPanel_2'>";
			if(data["authoritys"].indexOf("<%=Constants.APPROVAL_AUTHORITY_5_1%>")==-1){
				buffer += "<tr>";
				buffer += "<th width='140'>企划部负责人意见：</th>";
				buffer += "<td width='580' colspan='3' style='height:100px;vertical-align:top;padding-top:5px'>"+(data["applyInfo"].apply.notesOne != null ? data["applyInfo"].apply.notesOne : "&nbsp;")+"</td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<th>审批结果：</th>";
				buffer += "<td width='580' colspan='3'>"+(data["applyInfo"].apply.checkStateOneUuid!=null ? data["applyInfo"].apply.checkStateOne.description : "&nbsp;")+"</td>";
				buffer += "</tr>";
			}
			else {
				buffer += "<tr>";
				buffer += "<th width='140'>企划部负责人意见：</th>";
				buffer += "<td width='580' colspan='3'><textarea name='instance(Apply).notesOne' style='width:530px;height:100px'></textarea></td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<th>审批结果：</th>";
				buffer += "<td width='580' colspan='3'><select name='instance(Apply).checkStateOneUuid'><option value='<%=Constants.EXAMINATION_STATE_PASSED%>'>通过</option><option value='<%=Constants.EXAMINATION_STATE_UNPASSED%>'>未通过</option></select>&nbsp;<font color='#996633'>*</font></td>";
				buffer += "</tr>";
			}
			if(data["authoritys"].indexOf("<%=Constants.APPROVAL_AUTHORITY_5_2%>")==-1){
				buffer += "<tr>";
				buffer += "<th width='140'>主管校领导意见：</th>";
				buffer += "<td width='580' colspan='3' style='height:100px;vertical-align:top;padding-top:5px'>"+(data["applyInfo"].apply.notesTwo != null ? data["applyInfo"].apply.notesTwo : "&nbsp;")+"</td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<th>审批结果：</th>";
				buffer += "<td width='580' colspan='3'>"+(data["applyInfo"].apply.checkStateTwoUuid!=null ? data["applyInfo"].apply.checkStateTwo.description : "&nbsp;")+"</td>";
				buffer += "</tr>";
			}
			else {
				buffer += "<tr>";
				buffer += "<th width='140'>主管校领导意见：</th>";
				buffer += "<td width='580' colspan='3'><textarea name='instance(Apply).notesTwo' style='width:530px;height:100px'></textarea></td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<th>审批结果：</th>";
				buffer += "<td width='580' colspan='3'><select name='instance(Apply).checkStateTwoUuid'><option value='<%=Constants.EXAMINATION_STATE_PASSED%>'>通过</option><option value='<%=Constants.EXAMINATION_STATE_UNPASSED%>'>未通过</option></select>&nbsp;<font color='#996633'>*</font></td>";
				buffer += "</tr>";
			}
			buffer += "</table>";
			buffer += "</form>";
			buffer += "<br>";
			buffer += "<a href='javascript:createInstance(\""+id+"_form\")'><img src='"+cp+"/images/button/b_confirm_2.gif' /></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href='javascript:hideTimeout(\""+id+"\")'><img src='"+cp+"/images/button/b_cancel.gif'/></a>";
			buffer += "<br><br>";
			buffer += "</div></td></tr>";
		}
		else if(data["type"] == "material"){
			var buffer = "<tr><td colspan='9' align='center'><div id='"+id+"_div' style='overflow:hidden' value='0'>";
			buffer += "<br>";
			buffer += "<form id='"+id+"_form'>";
			buffer += "<input type='hidden' name='instance(Apply).uuid' value='"+uuid+"' />";
			buffer += "<table width='720' border='0' cellpadding='0' cellspacing='0' class='InfoShowPanel_2'>";
			buffer += "<tr>";
			buffer += "<th width='40'>序号</th><th width='100'>物品名称</th><th width='110'>物品编号</th><th width='110'>规格型号</th><th width='50'>单位</th><th width='80'>申请数量</th><th width='100'>总校审批数量</th><th width='130'>备注</th>";
			buffer += "</tr>";
			for(var i=0; i<data["applyInfo"].officeMaterials.length; i++){
				buffer += "<tr>";
				buffer += "<td width='40'>"+(i+1)+"</td>";
				buffer += "<td width='100'>"+data["applyInfo"].officeMaterials[i].material.type.description+"</td>";
				buffer += "<td width='110'>"+data["applyInfo"].officeMaterials[i].material.materialNo+"</td>";
				buffer += "<td width='110'>"+data["applyInfo"].officeMaterials[i].material.specification+"</td>";
				buffer += "<td width='50' style='text-align:center'>"+data["applyInfo"].officeMaterials[i].material.unit+"</td>";
				buffer += "<td width='80' style='text-align:center'>"+data["applyInfo"].officeMaterials[i].materialAmount+"</td>";
				if(data["authoritys"].indexOf("<%=Constants.APPROVAL_AUTHORITY_6_3%>")==-1){
					buffer += "<td width='100'></td>";
					buffer += "<td width='130'></td>";
				}
				else {
					buffer += "<td width='100'>";
					buffer += "<input type='hidden' name='instance(OfficeApplicationInfo["+i+"]).uuid' value='"+data["applyInfo"].officeMaterials[i].uuid+"' />";
					buffer += "<input type='hidden' name='instance(OfficeApplicationInfo["+i+"]).timeStamp' value='"+data["applyInfo"].officeMaterials[i].timeStamp+"' />";
					buffer += "<input type='hidden' name='instance(OfficeApplicationInfo["+i+"]).bizDataUuid' value='"+data["applyInfo"].officeMaterials[i].bizDataUuid+"' />";
					buffer += "<input type='hidden' name='instance(OfficeApplicationInfo["+i+"]).operationStatus' value='1' />";
					buffer += "<input type='hidden' name='instance(OfficeApplicationInfo["+i+"]).materialUuid' value='"+data["applyInfo"].officeMaterials[i].materialUuid+"' />";
					buffer += "<input type='hidden' name='instance(OfficeApplicationInfo["+i+"]).materialAmount' value='"+data["applyInfo"].officeMaterials[i].materialAmount+"' />";
					buffer += "<input type='hidden' name='instance(OfficeApplicationInfo["+i+"]).ifGenerate' value='"+data["applyInfo"].officeMaterials[i].ifGenerate+"' />";
					buffer += "<input type='hidden' name='instance(OfficeApplicationInfo["+i+"]).receipStateUuid' value='"+data["applyInfo"].officeMaterials[i].receipStateUuid+"' />";
					buffer += "<input type='text' id='"+id+"_form_amount_"+i+"' name='instance(OfficeApplicationInfo["+i+"]).approvalAmount' style='width:50px' />&nbsp;<font color='#996633'>*</font>";
					buffer += "</td>";
					buffer += "<td width='130'><textarea name='instance(OfficeApplicationInfo["+i+"]).notes' style='width:110px;height:40px'></textarea></td>";
				}
				buffer += "</tr>";
			}
			buffer += "</table>";
			buffer += "<br>";
			buffer += "<table width='720' border='0' cellpadding='0' cellspacing='0' class='InfoShowPanel_2'>";
			if(data["authoritys"].indexOf("<%=Constants.APPROVAL_AUTHORITY_6_1%>")==-1){
				buffer += "<tr>";
				buffer += "<th width='180'>申请单位负责人意见：</th>";
				buffer += "<td width='540' colspan='3' style='height:100px;vertical-align:top;padding-top:5px'>"+(data["applyInfo"].apply.notesOne != null ? data["applyInfo"].apply.notesOne : "&nbsp;")+"</td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<th>审批结果：</th>";
				buffer += "<td width='540' colspan='3'>"+(data["applyInfo"].apply.checkStateOneUuid!=null ? data["applyInfo"].apply.checkStateOne.description : "&nbsp;")+"</td>";
				buffer += "</tr>";
			}
			else {
				buffer += "<tr>";
				buffer += "<th width='180'>申请单位负责人意见：</th>";
				buffer += "<td width='540' colspan='3'><textarea name='instance(Apply).notesOne' style='width:530px;height:100px'></textarea></td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<th>审批结果：</th>";
				buffer += "<td width='540' colspan='3'><select name='instance(Apply).checkStateOneUuid'><option value='<%=Constants.EXAMINATION_STATE_PASSED%>'>通过</option><option value='<%=Constants.EXAMINATION_STATE_UNPASSED%>'>未通过</option></select>&nbsp;<font color='#996633'>*</font></td>";
				buffer += "</tr>";
			}
			if(data["authoritys"].indexOf("<%=Constants.APPROVAL_AUTHORITY_6_2%>")==-1){
				buffer += "<tr>";
				buffer += "<th width='180'>总校物资管理负责人意见：</th>";
				buffer += "<td width='540' colspan='3' style='height:100px;vertical-align:top;padding-top:5px'>"+(data["applyInfo"].apply.notesTwo != null ? data["applyInfo"].apply.notesTwo : "&nbsp;")+"</td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<th>审批结果：</th>";
				buffer += "<td width='540' colspan='3'>"+(data["applyInfo"].apply.checkStateTwoUuid!=null ? data["applyInfo"].apply.checkStateTwo.description : "&nbsp;")+"</td>";
				buffer += "</tr>";
			}
			else {
				buffer += "<tr>";
				buffer += "<th width='180'>总校物资管理负责人意见：</th>";
				buffer += "<td width='540' colspan='3'><textarea name='instance(Apply).notesTwo' style='width:530px;height:100px'></textarea></td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<th>审批结果：</th>";
				buffer += "<td width='540' colspan='3'><select name='instance(Apply).checkStateTwoUuid'><option value='<%=Constants.EXAMINATION_STATE_PASSED%>'>通过</option><option value='<%=Constants.EXAMINATION_STATE_UNPASSED%>'>未通过</option></select>&nbsp;<font color='#996633'>*</font></td>";
				buffer += "</tr>";
			}
			if(data["authoritys"].indexOf("<%=Constants.APPROVAL_AUTHORITY_6_3%>")==-1){
				buffer += "<tr>";
				buffer += "<th width='180'>总校主管负责人意见：</th>";
				buffer += "<td width='540' colspan='3' style='height:100px;vertical-align:top;padding-top:5px'>"+(data["applyInfo"].apply.notesThree != null ? data["applyInfo"].apply.notesThree : "&nbsp;")+"</td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<th>审批结果：</th>";
				buffer += "<td width='540' colspan='3'>"+(data["applyInfo"].apply.checkStateThreeUuid!=null ? data["applyInfo"].apply.checkStateThree.description : "&nbsp;")+"</td>";
				buffer += "</tr>";
			}
			else {
				buffer += "<tr>";
				buffer += "<th width='180'>总校主管负责人意见：</th>";
				buffer += "<td width='540' colspan='3'><textarea name='instance(Apply).notesThree' style='width:530px;height:100px'></textarea></td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<th>审批结果：</th>";
				buffer += "<td width='540' colspan='3'><select name='instance(Apply).checkStateThreeUuid'><option value='<%=Constants.EXAMINATION_STATE_PASSED%>'>通过</option><option value='<%=Constants.EXAMINATION_STATE_UNPASSED%>'>未通过</option></select>&nbsp;<font color='#996633'>*</font></td>";
				buffer += "</tr>";
			}
			buffer += "</table>";
			buffer += "</form>";
			buffer += "<br>";
			buffer += "<a href='javascript:createInstance(\""+id+"_form\")'><img src='"+cp+"/images/button/b_confirm_2.gif' /></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href='javascript:hideTimeout(\""+id+"\")'><img src='"+cp+"/images/button/b_cancel.gif'/></a>";
			buffer += "<br><br>";
			buffer += "</div></td></tr>";			
		}
		else if (data["type"] == "regular") {
			var buffer = "<tr><td colspan='"+numF+"' align='center'><div id='"+id+"_div' style='overflow:hidden' value='0'>";
			buffer += "<br>";
			buffer += "<form id='"+id+"_form'>";
			buffer += "<input type='hidden' name='instance(Apply).uuid' value='"+uuid+"' />";
			buffer += "<input type='hidden' name='instance(RegularApproval).uuid' value='"+data["applyInfo"].approvalUuid+"' />";
			buffer += "<input type='hidden' name='instance(RegularApproval).timeStamp' value='"+data["applyInfo"].approval.timeStamp+"' />";
			buffer += "<table width='720' border='0' cellpadding='0' cellspacing='0' class='InfoShowPanel_2'>";
			buffer += "<tr>";
			buffer += "<th width='160px'>姓名：</th>";
			buffer += "<td width='200px'>"+(data["applyInfo"].apply.applicant.person !=null ? data["applyInfo"].apply.applicant.person.name : "&nbsp;")+"</td>";
			buffer += "<th width='160px'>组织机构：</th>";
			buffer += "<td width='200px'>"+(data["applyInfo"].department !=null ? data["applyInfo"].department.description : "&nbsp;")+"</td>";
			buffer += "</tr>";
			buffer += "<tr>";
			buffer += "<th width='160px'>校区：</th>";
			buffer += "<td width='200px'>"+(data["applyInfo"].campus !=null ? data["applyInfo"].campus.description : "&nbsp;")+"</td>";
			buffer += "<th width='160px'>岗位：</th>";
			buffer += "<td width='200px'>"+(data["applyInfo"].job !=null ? data["applyInfo"].job.description : "&nbsp;")+"</td>";
			buffer += "</tr>";
			buffer += "<tr>";
			buffer += "<th width='160px'>试用期起止时间：</th>";
			buffer += "<td width='200px'>"+(data["applyInfo"].fromDt !=null ? data["applyInfo"].fromDt.substring(0, 10) : "&nbsp;")+" - "+(data["applyInfo"].toDt !=null ? data["applyInfo"].toDt.substring(0, 10) : "&nbsp;")+"</td>";
			buffer += "<th width='160px'>申请时间：</th>";
			buffer += "<td width='200px'>"+(data["applyInfo"].apply.applicationTime !=null ? data["applyInfo"].apply.applicationTime.substring(0, 16) : "&nbsp;")+"</td>";
			buffer += "</tr>";
			buffer += "<tr style='height:81px'>";
			buffer += "<th>试用期述职<br>(工作内容和成果)：</th>";
			buffer += "<td colspan='3' style='height:100px;vertical-align:top;padding-top:5px'>"+(data["applyInfo"].debrief !=null ? data["applyInfo"].debrief : "&nbsp;")+"</td>";
			buffer += "</tr>";
			buffer += "<tr style='height:81px'>";
			buffer += "<th>转正后工作<br>开展计划：</th>";
			buffer += "<td colspan='3' style='height:100px;vertical-align:top;padding-top:5px'>"+(data["applyInfo"].workPlan !=null ? data["applyInfo"].workPlan : "&nbsp;")+"</td>";
			buffer += "</tr>";
			buffer += "<tr style='height:81px'>";
			buffer += "<th>其他建议：</th>";
			buffer += "<td colspan='3' style='height:100px;vertical-align:top;padding-top:5px'>"+(data["applyInfo"].suggestion !=null ? data["applyInfo"].suggestion : "&nbsp;")+"</td>";
			buffer += "</tr>";
			buffer += "<tr>";
			buffer += "<th>申请人签字：</th>";
			buffer += "<td colspan='3'>"+(data["applyInfo"].apply.applicant.person !=null ? data["applyInfo"].apply.applicant.person.name : "&nbsp;")+"</td>";
			buffer += "</tr>";
			buffer += "</table>";
			buffer += "<br>";
			buffer += "<table width='720' border='0' cellpadding='0' cellspacing='0' class='InfoShowPanel_2'>";
			if (data["authoritys"].indexOf("<%=Constants.APPROVAL_AUTHORITY_7_1%>") != -1) {
				buffer += "<tr>";
				buffer += "<th width='120px' rowspan='10'>考评项目：</th>";
				buffer += "<td width='120px' rowspan='4'>工作态度：</td>";
				buffer += "<td width='160px'>出勤情况：&nbsp;&nbsp;&nbsp;&nbsp;(10分)</td>";
				buffer += "<td width='320px'>";
				buffer += "<input type='text' style='width:25px' id='score_1' name='instance(RegularApproval).attendanceMark' onchange='javascript:calculateSum()' value='0' validate='true' />分&nbsp;&nbsp;&nbsp;&nbsp;请假";
				buffer += "<input type='text' style='width:25px' name='instance(RegularApproval).leaveCount' validate='true' value='0' />次/迟到";
				buffer += "<input type='text' style='width:25px' name='instance(RegularApproval).lateCount' validate='true' value='0' />次/旷工";
				buffer += "<input type='text' style='width:25px' name='instance(RegularApproval).absenceCount' validate='true' value='0' />次";
				buffer += "</td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<td>行为规范：&nbsp;&nbsp;&nbsp;&nbsp;(10分)</td>";
				buffer += "<td>";
				buffer += "<input type='text' style='width:25px' id='score_2' name='instance(RegularApproval).behaviorMark' onchange='javascript:calculateSum()' value='0' validate='true' />分";
				buffer += "</td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<td>工作责任感：&nbsp;&nbsp;(10分)</td>";
				buffer += "<td>";
				buffer += "<input type='text' style='width:25px' id='score_3' name='instance(RegularApproval).responsibilityMark' onchange='javascript:calculateSum()' value='0' validate='true' />分";
				buffer += "</td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<td>工作勤懒：&nbsp;&nbsp;&nbsp;&nbsp;(10分)</td>";
				buffer += "<td>";
				buffer += "<input type='text' style='width:25px' id='score_4' name='instance(RegularApproval).diligenceMark' onchange='javascript:calculateSum()' value='0' validate='true' />分";
				buffer += "</td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<td rowspan='4'>工作技能：</td>";
				buffer += "<td>工作技能：&nbsp;&nbsp;&nbsp;&nbsp;(10分)</td>";
				buffer += "<td>";
				buffer += "<input type='text' style='width:25px' id='score_5' name='instance(RegularApproval).skillMark' onchange='javascript:calculateSum()' value='0' validate='true' />分";
				buffer += "</td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<td>沟通协调：&nbsp;&nbsp;&nbsp;&nbsp;(10分)</td>";
				buffer += "<td>";
				buffer += "<input type='text' style='width:25px' id='score_6' name='instance(RegularApproval).coordinationMark' onchange='javascript:calculateSum()' value='0' validate='true' />分";
				buffer += "</td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<td>策划能力：&nbsp;&nbsp;&nbsp;&nbsp;(10分)</td>";
				buffer += "<td>";
				buffer += "<input type='text' style='width:25px' id='score_7' name='instance(RegularApproval).planMark' onchange='javascript:calculateSum()' value='0' validate='true' />分";
				buffer += "</td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<td>执行能力：&nbsp;&nbsp;&nbsp;&nbsp;(10分)</td>";
				buffer += "<td>";
				buffer += "<input type='text' style='width:25px' id='score_8' name='instance(RegularApproval).executeMark' onchange='javascript:calculateSum()' value='0' validate='true' />分";
				buffer += "</td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<td rowspan='2'>工作业绩：</td>";
				buffer += "<td>工作业绩/质量:(10分)</td>";
				buffer += "<td>";
				buffer += "<input type='text' style='width:25px' id='score_9' name='instance(RegularApproval).qualityMark' onchange='javascript:calculateSum()' value='0' validate='true' />分";
				buffer += "</td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<td>工作效率：&nbsp;&nbsp;&nbsp;&nbsp;(10分)</td>";
				buffer += "<td>";
				buffer += "<input type='text' style='width:25px' id='score_10' name='instance(RegularApproval).efficiencyMark' onchange='javascript:calculateSum()' value='0' validate='true' />分";
				buffer += "</td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<th>合计得分：</th>";
				buffer += "<td colspan='3'>";
				buffer += "<div id='score_sum' name='instance(RegularApproval).totalScore' style='display:inline;width:30px'>0</div>&nbsp;&nbsp;分";
				buffer += "</td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<th>综合评估：</th>";
				buffer += "<td colspan='3' height='104px'>";
				buffer += "<textarea name='instance(Apply).notesOne' style='width:584px;height:100px'></textarea>";
				buffer += "</td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<th>审批结果：</th>";
				buffer += "<td colspan='3'><select name='instance(Apply).checkStateOneUuid' onchange='javascript:judgeProlong(this)'><option value='<%=Constants.EXAMINATION_STATE_PASSED%>'>通过</option><option value='<%=Constants.EXAMINATION_STATE_UNPASSED%>'>未通过</option><option value='<%=Constants.EXAMINATION_STATE_PROLONG%>'>延期</option></select>&nbsp;<font color='#996633'>*</font>&nbsp;&nbsp;&nbsp;&nbsp;<div id='showP' style='display:none'><input type='text' style='width:25px' name='instance(RegularApproval).prolongMonth' value='0' />月</div></td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<th>主管领导签字：</th>";
				buffer += "<td colspan='3'>";
				buffer += "<s:property value="#session.LOGIN_EMPLOYEE.person.name" />";
				buffer += "</td>";
				buffer += "</tr>";
			}
			else if(data["authoritys"].indexOf("<%=Constants.APPROVAL_AUTHORITY_7_2%>") != -1) {
				buffer += "<tr>";
				buffer += "<th width='120px'>教研表现：</th>";
				buffer += "<td colspan='3' height='104px' width='600px'>";
				buffer += "<textarea name='instance(RegularApproval).teachPerformance' style='width:584px;height:100px'></textarea>";
				buffer += "</td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<th width='120px'>综合评估：</th>";
				buffer += "<td colspan='3' height='104px' width='600px'>";
				buffer += "<textarea name='instance(Apply).notesTwo' style='width:584px;height:100px'></textarea>";
				buffer += "</td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<th>审批结果：</th>";
				buffer += "<td colspan='3'><select name='instance(Apply).checkStateTwoUuid'><option value='<%=Constants.EXAMINATION_STATE_PASSED%>'>通过</option><option value='<%=Constants.EXAMINATION_STATE_UNPASSED%>'>未通过</option></select>&nbsp;<font color='#996633'>*</font></td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<th>学科负责人签字：</th>";
				buffer += "<td colspan='3'>";
				buffer += "<s:property value="#session.LOGIN_EMPLOYEE.person.name" />";
				buffer += "</td>";
				buffer += "</tr>";
			}
			else if(data["authoritys"].indexOf("<%=Constants.APPROVAL_AUTHORITY_7_3%>") != -1) {
				buffer += "<tr>";
				buffer += "<th width='120px'>所授课程，时间：</th>";
				buffer += "<td colspan='3' height='104px' width='600px'>";
				buffer += "<textarea name='instance(RegularApproval).teachEXInfo' style='width:584px;height:100px'></textarea>";
				buffer += "</td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<th width='120px'>综合评估：</th>";
				buffer += "<td colspan='3' height='104px' width='600px'>";
				buffer += "<textarea name='instance(Apply).notesThree' style='width:584px;height:100px'></textarea>";
				buffer += "</td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<th>审批结果：</th>";
				buffer += "<td colspan='3'><select name='instance(Apply).checkStateThreeUuid'><option value='<%=Constants.EXAMINATION_STATE_PASSED%>'>通过</option><option value='<%=Constants.EXAMINATION_STATE_UNPASSED%>'>未通过</option></select>&nbsp;<font color='#996633'>*</font></td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<th>评估人签字：</th>";
				buffer += "<td colspan='3'>";
				buffer += "<s:property value="#session.LOGIN_EMPLOYEE.person.name" />";
				buffer += "</td>";
				buffer += "</tr>";
			}
			else if(data["authoritys"].indexOf("<%=Constants.APPROVAL_AUTHORITY_7_4%>") != -1) {
				buffer += "<tr><th colspan='4'>考核评估表-主管领导</th></tr>";
				buffer += "<tr>";
				buffer += "<th width='120px' rowspan='10'>考评项目：</th>";
				buffer += "<td width='120px' rowspan='4'>工作态度：</td>";
				buffer += "<td width='160px'>出勤情况：&nbsp;&nbsp;&nbsp;&nbsp;(10分)</td>";
				buffer += "<td width='320px'>"+(data["applyInfo"].approval.attendanceMark != null ? data["applyInfo"].approval.attendanceMark : "&nbsp;")+"分&nbsp;&nbsp;&nbsp;&nbsp;请假";
				buffer += (data["applyInfo"].approval.leaveCount != null ? data["applyInfo"].approval.leaveCount : "&nbsp;") + "次/迟到";
				buffer += (data["applyInfo"].approval.lateCount != null ? data["applyInfo"].approval.lateCount : "&nbsp;") + "次/旷工";
				buffer += (data["applyInfo"].approval.absenceCount != null ? data["applyInfo"].approval.absenceCount : "&nbsp;") + "次";
				buffer += "</td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<td>行为规范：&nbsp;&nbsp;&nbsp;&nbsp;(10分)</td>";
				buffer += "<td>";
				buffer += (data["applyInfo"].approval.behaviorMark != null ? data["applyInfo"].approval.behaviorMark : "&nbsp;") + "分";
				buffer += "</td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<td>工作责任感：&nbsp;&nbsp;(10分)</td>";
				buffer += "<td>";
				buffer += (data["applyInfo"].approval.responsibilityMark != null ? data["applyInfo"].approval.responsibilityMark : "&nbsp;") + "分";
				buffer += "</td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<td>工作勤懒：&nbsp;&nbsp;&nbsp;&nbsp;(10分)</td>";
				buffer += "<td>";
				buffer += (data["applyInfo"].approval.diligenceMark != null ? data["applyInfo"].approval.diligenceMark : "&nbsp;") + "分";
				buffer += "</td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<td rowspan='4'>工作技能：</td>";
				buffer += "<td>工作技能：&nbsp;&nbsp;&nbsp;&nbsp;(10分)</td>";
				buffer += "<td>";
				buffer += (data["applyInfo"].approval.skillMark != null ? data["applyInfo"].approval.skillMark : "&nbsp;") + "分";
				buffer += "</td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<td>沟通协调：&nbsp;&nbsp;&nbsp;&nbsp;(10分)</td>";
				buffer += "<td>";
				buffer += (data["applyInfo"].approval.coordinationMark != null ? data["applyInfo"].approval.coordinationMark : "&nbsp;") + "分";
				buffer += "</td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<td>策划能力：&nbsp;&nbsp;&nbsp;&nbsp;(10分)</td>";
				buffer += "<td>";
				buffer += (data["applyInfo"].approval.planMark != null ? data["applyInfo"].approval.planMark : "&nbsp;") + "分";
				buffer += "</td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<td>执行能力：&nbsp;&nbsp;&nbsp;&nbsp;(10分)</td>";
				buffer += "<td>";
				buffer += (data["applyInfo"].approval.executeMark != null ? data["applyInfo"].approval.executeMark : "&nbsp;") + "分";
				buffer += "</td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<td rowspan='2'>工作业绩：</td>";
				buffer += "<td>工作业绩/质量:(10分)</td>";
				buffer += "<td>";
				buffer += (data["applyInfo"].approval.qualityMark != null ? data["applyInfo"].approval.qualityMark : "&nbsp;") + "分";
				buffer += "</td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<td>工作效率：&nbsp;&nbsp;&nbsp;&nbsp;(10分)</td>";
				buffer += "<td>";
				buffer += (data["applyInfo"].approval.efficiencyMark != null ? data["applyInfo"].approval.efficiencyMark : "&nbsp;") + "分";
				buffer += "</td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<th>合计得分：</th>";
				buffer += "<td colspan='3'>";
				buffer += (data["applyInfo"].approval.totalScore != null ? data["applyInfo"].approval.totalScore : "&nbsp;") + "&nbsp;&nbsp;分";
				buffer += "</td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<th width='120px'>综合评估：</th>";
				buffer += "<td colspan='3' style='width:600px;height:100px;vertical-align:top;padding-top:5px'>"+(data["applyInfo"].apply.notesOne != null ? data["applyInfo"].apply.notesOne : "&nbsp;")+"</td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<th width='120px'>审批结果：</th>";
				if(data["applyInfo"].apply.checkStateOneUuid != "<%=Constants.EXAMINATION_STATE_PROLONG%>") {
					buffer += "<td width='600px' colspan='3'>"+(data["applyInfo"].apply.checkStateOneUuid != null ? data["applyInfo"].apply.checkStateOne.description : "&nbsp;")+"</td>";
				}
				else {
					buffer += "<td width='600px' colspan='3'>"+(data["applyInfo"].apply.checkStateOneUuid != null ? data["applyInfo"].apply.checkStateOne.description : "&nbsp;")+"&nbsp;&nbsp;"+(data["applyInfo"].approval.prolongMonth != null ? data["applyInfo"].approval.prolongMonth : "&nbsp;")+"月</td>";
				}
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<th>主管领导签字：</th>";
				buffer += "<td colspan='3'>";
				buffer += (data["applyInfo"].apply.checkerOneUuid != null ? data["applyInfo"].apply.checkerOne.person.name : "&nbsp;");
				buffer += "</td>";
				buffer += "</tr>";
				buffer += "</table>";
				buffer += "<br>";

				buffer += "<table width='720' border='0' cellpadding='0' cellspacing='0' class='InfoShowPanel_2'>";
				buffer += "<tr><th colspan='2'>考核评估表-学科负责人</th></tr>";
				buffer += "<tr>";
				buffer += "<th width='120px'>教研表现：</th>";
				buffer += "<td style='width:600px;height:100px;vertical-align:top;padding-top:5px'>";
				buffer += (data["applyInfo"].approval.teachPerformance != null ? data["applyInfo"].approval.teachPerformance : "&nbsp;");
				buffer += "</td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<th width='120px'>综合评估：</th>";
				buffer += "<td style='width:600px;height:100px;vertical-align:top;padding-top:5px'>";
				buffer += (data["applyInfo"].apply.notesTwo != null ? data["applyInfo"].apply.notesTwo : "&nbsp;");
				buffer += "</td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<th>审批结果：</th>";
				buffer += "<td>";
				buffer += (data["applyInfo"].apply.checkStateTwoUuid != null ? data["applyInfo"].apply.checkStateTwo.description : "&nbsp;");
				buffer += "</td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<th>学科负责人签字：</th>";
				buffer += "<td>";
				buffer += (data["applyInfo"].apply.checkerTwoUuid != null ? data["applyInfo"].apply.checkerTwo.person.name : "&nbsp;");
				buffer += "</td>";
				buffer += "</tr>";
				buffer += "</table>";
				buffer += "<br>";

				buffer += "<table width='720' border='0' cellpadding='0' cellspacing='0' class='InfoShowPanel_2'>";
				buffer += "<tr><th colspan='2'>考核评估表-授课校区负责人</th></tr>";
				buffer += "<tr>";
				buffer += "<th width='120px'>所授课程、时间：</th>";
				buffer += "<td style='width:600px;height:100px;vertical-align:top;padding-top:5px'><pre>";
				buffer += (data["applyInfo"].approval.teachEXInfo != null ? data["applyInfo"].approval.teachEXInfo : "&nbsp;");
				buffer += "</pre></td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<th width='120px'>综合评估：</th>";
				buffer += "<td style='width:600px;height:100px;vertical-align:top;padding-top:5px'><pre>";
				buffer += (data["applyInfo"].apply.notesThree != null ? data["applyInfo"].apply.notesThree : "&nbsp;");
				buffer += "</pre></td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<th>审批结果：</th>";
				buffer += "<td>";
				buffer += (data["applyInfo"].apply.checkStateThreeUuid != null ? data["applyInfo"].apply.checkStateThree.description : "&nbsp;");
				buffer += "</td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<th>评估人签字：</th>";
				buffer += "<td>";
				buffer += (data["applyInfo"].apply.checkerThreeUuid != null ? data["applyInfo"].apply.checkerThree.person.name : "&nbsp;");
				buffer += "</td>";
				buffer += "</tr>";
				buffer += "</table>";
				buffer += "<br>";

				buffer += "<table width='720px' border='0' cellpadding='0' cellspacing='0' class='InfoShowPanel_2'>";
				buffer += "<tr>";
				buffer += "<th width='120px'>人力资源意见：</th>";
				buffer += "<td height='104px' width='600px'>";
				buffer += "<textarea name='instance(Apply).notesFour' style='width:584px;height:100px'></textarea>";
				buffer += "</td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<th>审批结果：</th>";
				buffer += "<td><select name='instance(Apply).checkStateFourUuid'><option value='<%=Constants.EXAMINATION_STATE_PASSED%>'>通过</option><option value='<%=Constants.EXAMINATION_STATE_UNPASSED%>'>未通过</option></select>&nbsp;<font color='#996633'>*</font></td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<th>人力资源签字：</th>";
				buffer += "<td>";
				buffer += "<s:property value="#session.LOGIN_EMPLOYEE.person.name" />";
				buffer += "</td>";
				buffer += "</tr>";
			}
			else if(data["authoritys"].indexOf("<%=Constants.APPROVAL_AUTHORITY_7_5%>") != -1) {
				buffer += "<tr><th colspan='4'>考核评估表-主管领导</th></tr>";
				buffer += "<tr>";
				buffer += "<th width='120px' rowspan='10'>考评项目：</th>";
				buffer += "<td width='120px' rowspan='4'>工作态度：</td>";
				buffer += "<td width='160px'>出勤情况：&nbsp;&nbsp;&nbsp;&nbsp;(10分)</td>";
				buffer += "<td width='320px'>"+(data["applyInfo"].approval.attendanceMark != null ? data["applyInfo"].approval.attendanceMark : "&nbsp;")+"分&nbsp;&nbsp;&nbsp;&nbsp;请假";
				buffer += (data["applyInfo"].approval.leaveCount != null ? data["applyInfo"].approval.leaveCount : "&nbsp;") + "次/迟到";
				buffer += (data["applyInfo"].approval.lateCount != null ? data["applyInfo"].approval.lateCount : "&nbsp;") + "次/旷工";
				buffer += (data["applyInfo"].approval.absenceCount != null ? data["applyInfo"].approval.absenceCount : "&nbsp;") + "次";
				buffer += "</td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<td>行为规范：&nbsp;&nbsp;&nbsp;&nbsp;(10分)</td>";
				buffer += "<td>";
				buffer += (data["applyInfo"].approval.behaviorMark != null ? data["applyInfo"].approval.behaviorMark : "&nbsp;") + "分";
				buffer += "</td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<td>工作责任感：&nbsp;&nbsp;(10分)</td>";
				buffer += "<td>";
				buffer += (data["applyInfo"].approval.responsibilityMark != null ? data["applyInfo"].approval.responsibilityMark : "&nbsp;") + "分";
				buffer += "</td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<td>工作勤懒：&nbsp;&nbsp;&nbsp;&nbsp;(10分)</td>";
				buffer += "<td>";
				buffer += (data["applyInfo"].approval.diligenceMark != null ? data["applyInfo"].approval.diligenceMark : "&nbsp;") + "分";
				buffer += "</td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<td rowspan='4'>工作技能：</td>";
				buffer += "<td>工作技能：&nbsp;&nbsp;&nbsp;&nbsp;(10分)</td>";
				buffer += "<td>";
				buffer += (data["applyInfo"].approval.skillMark != null ? data["applyInfo"].approval.skillMark : "&nbsp;") + "分";
				buffer += "</td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<td>沟通协调：&nbsp;&nbsp;&nbsp;&nbsp;(10分)</td>";
				buffer += "<td>";
				buffer += (data["applyInfo"].approval.coordinationMark != null ? data["applyInfo"].approval.coordinationMark : "&nbsp;") + "分";
				buffer += "</td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<td>策划能力：&nbsp;&nbsp;&nbsp;&nbsp;(10分)</td>";
				buffer += "<td>";
				buffer += (data["applyInfo"].approval.planMark != null ? data["applyInfo"].approval.planMark : "&nbsp;") + "分";
				buffer += "</td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<td>执行能力：&nbsp;&nbsp;&nbsp;&nbsp;(10分)</td>";
				buffer += "<td>";
				buffer += (data["applyInfo"].approval.executeMark != null ? data["applyInfo"].approval.executeMark : "&nbsp;") + "分";
				buffer += "</td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<td rowspan='2'>工作业绩：</td>";
				buffer += "<td>工作业绩/质量:(10分)</td>";
				buffer += "<td>";
				buffer += (data["applyInfo"].approval.qualityMark != null ? data["applyInfo"].approval.qualityMark : "&nbsp;") + "分";
				buffer += "</td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<td>工作效率：&nbsp;&nbsp;&nbsp;&nbsp;(10分)</td>";
				buffer += "<td>";
				buffer += (data["applyInfo"].approval.efficiencyMark != null ? data["applyInfo"].approval.efficiencyMark : "&nbsp;") + "分";
				buffer += "</td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<th>合计得分：</th>";
				buffer += "<td colspan='3'>";
				buffer += (data["applyInfo"].approval.totalScore != null ? data["applyInfo"].approval.totalScore : "&nbsp;") + "&nbsp;&nbsp;分";
				buffer += "</td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<th width='120px'>综合评估：</th>";
				buffer += "<td colspan='3' style='width:600px;height:100px;vertical-align:top;padding-top:5px'>"+(data["applyInfo"].apply.notesOne != null ? data["applyInfo"].apply.notesOne : "&nbsp;")+"</td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<th width='120px'>审批结果：</th>";
				if(data["applyInfo"].apply.checkStateOneUuid != <%=Constants.EXAMINATION_STATE_PROLONG%>) {
					buffer += "<td width='600px' colspan='3'>"+(data["applyInfo"].apply.checkStateOneUuid != null ? data["applyInfo"].apply.checkStateOne.description : "&nbsp;")+"</td>";
				}
				else {
					buffer += "<td width='600px' colspan='3'>"+(data["applyInfo"].apply.checkStateOneUuid != null ? data["applyInfo"].apply.checkStateOne.description : "&nbsp;")+"&nbsp;&nbsp;"+(data["applyInfo"].approval.prolongMonth != null ? data["applyInfo"].approval.prolongMonth : "&nbsp;")+"月</td>";
				}
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<th>主管领导签字：</th>";
				buffer += "<td colspan='3'>";
				buffer += (data["applyInfo"].apply.checkerOneUuid != null ? data["applyInfo"].apply.checkerOne.person.name : "&nbsp;");
				buffer += "</td>";
				buffer += "</tr>";
				buffer += "</table>";
				buffer += "<br>";

				buffer += "<table width='720' border='0' cellpadding='0' cellspacing='0' class='InfoShowPanel_2'>";
				buffer += "<tr><th colspan='2'>考核评估表-学科负责人</th></tr>";
				buffer += "<tr>";
				buffer += "<th width='120px'>教研表现：</th>";
				buffer += "<td style='width:600px;height:100px;vertical-align:top;padding-top:5px'>";
				buffer += (data["applyInfo"].approval.teachPerformance != null ? data["applyInfo"].approval.teachPerformance : "&nbsp;");
				buffer += "</td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<th width='120px'>综合评估：</th>";
				buffer += "<td style='width:600px;height:100px;vertical-align:top;padding-top:5px'>";
				buffer += (data["applyInfo"].apply.notesTwo != null ? data["applyInfo"].apply.notesTwo : "&nbsp;");
				buffer += "</td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<th>审批结果：</th>";
				buffer += "<td>";
				buffer += (data["applyInfo"].apply.checkStateTwoUuid != null ? data["applyInfo"].apply.checkStateTwo.description : "&nbsp;");
				buffer += "</td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<th>学科负责人签字：</th>";
				buffer += "<td>";
				buffer += (data["applyInfo"].apply.checkerTwoUuid != null ? data["applyInfo"].apply.checkerTwo.person.name : "&nbsp;");
				buffer += "</td>";
				buffer += "</tr>";
				buffer += "</table>";
				buffer += "<br>";

				buffer += "<table width='720' border='0' cellpadding='0' cellspacing='0' class='InfoShowPanel_2'>";
				buffer += "<tr><th colspan='2'>考核评估表-授课校区负责人</th></tr>";
				buffer += "<tr>";
				buffer += "<th width='120px'>所授课程、时间：</th>";
				buffer += "<td style='width:600px;height:100px;vertical-align:top;padding-top:5px'><pre>";
				buffer += (data["applyInfo"].approval.teachEXInfo != null ? data["applyInfo"].approval.teachEXInfo : "&nbsp;");
				buffer += "</pre></td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<th width='120px'>综合评估：</th>";
				buffer += "<td style='width:600px;height:100px;vertical-align:top;padding-top:5px'><pre>";
				buffer += (data["applyInfo"].apply.notesThree != null ? data["applyInfo"].apply.notesThree : "&nbsp;");
				buffer += "</pre></td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<th>审批结果：</th>";
				buffer += "<td>";
				buffer += (data["applyInfo"].apply.checkStateThreeUuid != null ? data["applyInfo"].apply.checkStateThree.description : "&nbsp;");
				buffer += "</td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<th>评估人签字：</th>";
				buffer += "<td>";
				buffer += (data["applyInfo"].apply.checkerThreeUuid != null ? data["applyInfo"].apply.checkerThree.person.name : "&nbsp;");
				buffer += "</td>";
				buffer += "</tr>";
				buffer += "</table>";
				buffer += "<br>";

				buffer += "<table width='720px' border='0' cellpadding='0' cellspacing='0' class='InfoShowPanel_2'>";
				buffer += "<tr><th colspan='2'>考核评估表-人力资源</th></tr>";
				buffer += "<tr>";
				buffer += "<th width='120px'>人力资源意见：</th>";
				buffer += "<td style='width:600px;height:100px;vertical-align:top;padding-top:5px'>";
				buffer += (data["applyInfo"].apply.notesFour != null ? data["applyInfo"].apply.notesFour : "&nbsp;");
				buffer += "</td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<th>审批结果：</th>";
				buffer += "<td>";
				buffer += (data["applyInfo"].apply.checkStateFourUuid != null ? data["applyInfo"].apply.checkStateFour.description : "&nbsp;");
				buffer += "</td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<th>人力资源签字：</th>";
				buffer += "<td>";
				buffer += (data["applyInfo"].apply.checkerFourUuid != null ? data["applyInfo"].apply.checkerFour.person.name : "&nbsp;");
				buffer += "</td>";
				buffer += "</tr>";
				buffer += "</table>";
				buffer += "<br>";

				buffer += "<table width='720px' border='0' cellpadding='0' cellspacing='0' class='InfoShowPanel_2'>";
				buffer += "<tr>";
				buffer += "<th width='120px'>行政校长意见：</th>";
				buffer += "<td height='104px' width='600px'>";
				buffer += "<textarea name='instance(Apply).notesFive' style='width:584px;height:100px'></textarea>";
				buffer += "</td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<th>审批结果：</th>";
				buffer += "<td><select name='instance(Apply).checkStateFiveUuid'><option value='<%=Constants.EXAMINATION_STATE_PASSED%>'>通过</option><option value='<%=Constants.EXAMINATION_STATE_UNPASSED%>'>未通过</option></select>&nbsp;<font color='#996633'>*</font></td>";
				buffer += "</tr>";
				buffer += "<tr>";
				buffer += "<th>人力资源签字：</th>";
				buffer += "<td>";
				buffer += "<s:property value="#session.LOGIN_EMPLOYEE.person.name" />";
				buffer += "</td>";
				buffer += "</tr>";
			}
			buffer += "</table>";
			buffer += "<br>";
			buffer += "</form>";
			buffer += "<a href='javascript:createInstance(\""+id+"_form\")'><img src='"+cp+"/images/button/b_confirm_2.gif' /></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href='javascript:hideTimeout(\""+id+"\")'><img src='"+cp+"/images/button/b_cancel.gif'/></a>";
			buffer += "<br><br>"; 
			buffer += "</div></td></tr>";
		}
		$("#"+id).html(buffer);
		$("#"+id).css("display", "");
		$("#"+id).val($("#"+id).height());
		$("label").filter(".BaseTree").basetree({});
		showTimeout(id);
	}, "json");
}
function showTimeout(id){
	var i = $("#"+id+"_div").val();
	var height = $("#"+id).val();
	if(i <= 10){
		$("#"+id+"_div").height(i*height/10);
		$("#"+id+"_div").val(++i);
		setTimeout(function(){showTimeout(id)}, 20);
	}
	else {
		$("#"+id+"_div").val("0");
	}
}
function hideTimeout(id){
	var i = $("#"+id+"_div").val();
	var height = $("#"+id).val();
	if(i <= 10){
		$("#"+id+"_div").height((10-i)*height/10);
		$("#"+id+"_div").val(++i);
		setTimeout(function(){hideTimeout(id)}, 20);
	}
	else {
		$("#"+id).css("display", "none");
		$("#"+id+"_div").val("0");
	}
}
function judgeProlong(temp) {
	if($(temp).val() == "<%=Constants.EXAMINATION_STATE_PROLONG%>") {
		$("#showP").css("display","inline");
	}
	else
	{
		$("#showP").css("display","none");
	}
}
function calculateSum() {
	var sum = 0;
	for(var i=1; i <= 10; i++){
		sum += parseInt($("#score_"+i).val());
	}
	$("#score_sum").html(sum);
}
function createInstance(formId){
	if(formId.indexOf("content_6") != -1){
		var noAmountMark = false;
		$("[id^='"+formId+"_amount_']").each(function(){
			if($(this).val()==""){
				noAmountMark = true;
			}
		});
		if(noAmountMark){
			alert("总校审批数量不能为空！");
			return;
		}
	}
	if(Validation.excuteValidate(formId)){
		if(confirm("确认操作？")){
			var param=Submit.excute(formId);
			$.post(cp+"/ajaxs/resource/approval/manage/create_approval.html",param,function(){
				if(formId.indexOf("content_1") != -1){
					execute1();
				}
				else if(formId.indexOf("content_2") != -1){
					execute2();
				}
				else if(formId.indexOf("content_3") != -1){
					execute3();
				}
				else if(formId.indexOf("content_4") != -1){
					execute4();
				}
				else if(formId.indexOf("content_5") != -1){
					execute5();
				}
				else if(formId.indexOf("content_6") != -1){
					execute6();
				}
				else if(formId.indexOf("content_7") != -1){
					execute7();
				}
			})
		}
	}
}
function showAll(mark){
	location.href = cp+"/https/resource/approval/manage/query_approval_"+mark+".html";
}
function downloadResource(uuid){
	var f = document.getElementById("form");
	f.action = cp + "/views/resource/campus/manage/campus/publicity/publicity/apply/forward_resource.html";
	f.uuid.value = uuid;
	f.type.value = "publicityApplication";
	f.submit();
}
</script>
<div style="font-family: 黑体; font-size: 20px;">&nbsp;审 批 管 理</div>
<br>
<br>
<br>
<hr style="width: 900px; margin-top: -1px">
<div id="fullResult1" style="display: none">
<div style="font-size: 18px; font-weight: bold; margin-top: 20px; margin-bottom: 10px">人员需求申请&nbsp;&nbsp;
<div id="link1_1" style="font-size: 13px; font-weight: normal; color: black; cursor: hand" onclick="javascript:toggleList('1')">待审批&nbsp;
<div id="link1_num" style="display: inline; font-weight: bold; color: red"></div>
</div>
<a id="link1_0" style="font-size: 13px; font-weight: normal; color: #888888; cursor: hand" title="暂无待审批的申请！">待审批&nbsp;<b>(0)</b></a>&nbsp;&nbsp;
<a style="display: inline; font-size: 13px; font-weight: normal; color: black" href="javascript:showAll('recruitment')">查看全部</a>
</div>
<div id="result1" class="bigResultCon" style="width: 740px; display: none"></div>
<br>
<br>
<hr style="width: 900px">
</div>
<div id="fullResult2" style="display: none">
<div style="font-size: 18px; font-weight: bold; margin-top: 20px; margin-bottom: 10px">关系调整申请&nbsp;&nbsp;
<div id="link2_1" style="font-size: 13px; font-weight: normal; color: black; cursor: hand" onclick="javascript:toggleList('2')">待审批&nbsp;
<div id="link2_num" style="display: inline; font-weight: bold; color: red"></div>
</div>
<a id="link2_0" style="font-size: 13px; font-weight: normal; color: #888888; cursor: hand" title="暂无待审批的申请！">待审批&nbsp;<b>(0)</b></a>&nbsp;&nbsp;
<a style="display: inline; font-size: 13px; font-weight: normal; color: black" href="javascript:showAll('relationship')">查看全部</a>
</div>
<div id="result2" class="bigResultCon" style="width: 740px; display: none"></div>
<br>
<br>
<hr style="width: 900px">
</div>
<div id="fullResult3" style="display: none">
<div style="font-size: 18px; font-weight: bold; margin-top: 20px; margin-bottom: 10px">员工离职申请&nbsp;&nbsp;
<div id="link3_1" style="font-size: 13px; font-weight: normal; color: black; cursor: hand" onclick="javascript:toggleList('3')">待审批&nbsp;
<div id="link3_num" style="display: inline; font-weight: bold; color: red"></div>
</div>
<a id="link3_0" style="font-size: 13px; font-weight: normal; color: #888888; cursor: hand" title="暂无待审批的申请！">待审批&nbsp;<b>(0)</b></a>&nbsp;&nbsp;
<a style="display: inline; font-size: 13px; font-weight: normal; color: black" href="javascript:showAll('quit')">查看全部</a>
</div>
<div id="result3" class="bigResultCon" style="width: 740px; display: none"></div>
<br>
<br>
<hr style="width: 900px">
</div>
<div id="fullResult4" style="display: none">
<div style="font-size: 18px; font-weight: bold; margin-top: 20px; margin-bottom: 10px">员工请假申请&nbsp;&nbsp;
<div id="link4_1" style="font-size: 13px; font-weight: normal; color: black; cursor: hand" onclick="javascript:toggleList('4')">待审批&nbsp;
<div id="link4_num" style="display: inline; font-weight: bold; color: red"></div>
</div>
<a id="link4_0" style="font-size: 13px; font-weight: normal; color: #888888; cursor: hand" title="暂无待审批的申请！">待审批&nbsp;<b>(0)</b></a>&nbsp;&nbsp;
<a style="display: inline; font-size: 13px; font-weight: normal; color: black" href="javascript:showAll('leave')">查看全部</a>
</div>
<div id="result4" class="bigResultCon" style="width: 740px; display: none"></div>
<br>
<br>
<hr style="width: 900px">
</div>
<div id="fullResult5" style="display: none">
<div style="font-size: 18px; font-weight: bold; margin-top: 20px; margin-bottom: 10px">市场活动申请&nbsp;&nbsp;
<div id="link5_1" style="font-size: 13px; font-weight: normal; color: black; cursor: hand" onclick="javascript:toggleList('5')">待审批&nbsp;
<div id="link5_num" style="display: inline; font-weight: bold; color: red"></div>
</div>
<a id="link5_0" style="font-size: 13px; font-weight: normal; color: #888888; cursor: hand" title="暂无待审批的申请！">待审批&nbsp;<b>(0)</b></a>&nbsp;&nbsp;
<a style="display: inline; font-size: 13px; font-weight: normal; color: black" href="javascript:showAll('publicity')">查看全部</a>
</div>
<div id="result5" class="bigResultCon" style="width: 740px; display: none"></div>
<br>
<br>
<hr style="width: 900px">
</div>
<div id="fullResult6" style="display: none">
<div style="font-size: 18px; font-weight: bold; margin-top: 20px; margin-bottom: 10px">物资购买申请&nbsp;&nbsp;
<div id="link6_1" style="font-size: 13px; font-weight: normal; color: black; cursor: hand" onclick="javascript:toggleList('6')">待审批&nbsp;
<div id="link6_num" style="display: inline; font-weight: bold; color: red"></div>
</div>
<a id="link6_0" style="font-size: 13px; font-weight: normal; color: #888888; cursor: hand" title="暂无待审批的申请！">待审批&nbsp;<b>(0)</b></a>&nbsp;&nbsp;
<a style="display: inline; font-size: 13px; font-weight: normal; color: black" href="javascript:showAll('material')">查看全部</a>
</div>
<div id="result6" class="bigResultCon" style="width: 740px; display: none"></div>
<br>
<br>
<hr style="width: 900px">
</div>
<div id="fullResult7" style="display: none">
<div style="font-size: 18px; font-weight: bold; margin-top: 20px; margin-bottom: 10px">人员转正申请&nbsp;&nbsp;
<div id="link7_1" style="font-size: 13px; font-weight: normal; color: black; cursor: hand" onclick="javascript:toggleList('7')">待审批&nbsp;
<div id="link7_num" style="display: inline; font-weight: bold; color: red"></div>
</div>
<a id="link7_0" style="font-size: 13px; font-weight: normal; color: #888888; cursor: hand" title="暂无待审批的申请！">待审批&nbsp;<b>(0)</b></a>&nbsp;&nbsp;
<a style="display: inline; font-size: 13px; font-weight: normal; color: black" href="javascript:showAll('regular')">查看全部</a>
</div>
<div id="result7" class="bigResultCon" style="width: 740px; display: none"></div>
<br>
<br>
<hr style="width: 900px">
</div>
</body>
</html>
