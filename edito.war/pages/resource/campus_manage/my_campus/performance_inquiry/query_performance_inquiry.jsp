<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<html>
<head>
	<title>绩效查询</title>
</head>
<body>
<script>
var nowMonth = "";
$(document).ready(function(){
	nowMonth = $("#hiddenDate").val();
	execute();
});
function execute(){
	var month = $("#hiddenDate").val();

	var buffer = "";
	buffer += "<table width='720' border='0' cellpadding='0' cellspacing='0' class='InfoShowPanel'>";
	buffer += "<tr><th colspan='4'>月度绩效考核表("+month+")</th></tr>";

	if(month.localeCompare(nowMonth) > 0){
		buffer += "<tr><td colspan='4'>&nbsp;<font color='red'>该月绩效尚未统计！</font></td></tr>";
	}
	else {
		$.ajaxSetup({async:false});
		$.post(cp+"/ajaxs/resource/campus/manage/my/campus/performance/inquiry/query_performance_inquiry.html",{month:month},function(data){
			if(data["mark"] == "false"){
				buffer += "<tr><td colspan='4'>&nbsp;<font color='red'>该月绩效尚未创建！</font></td></tr>";
			}
			else {
				buffer += "<tr><th width='100'>考核项目</th><th width='400'>考核内容</th><th width='140'>考核结果</th><th width='80'>是否创建</th></tr>";
				if(data["perfAttendance"] != null){
					buffer += "<tr>";
					buffer += "<th width='100'>考勤</th>";
					buffer += "<td style='width:400px;vertical-align:top;line-height:20px'>";
					var num0 = (data["perfAttendance"].perfAttendanceM0 != null ? data["perfAttendance"].perfAttendanceM0 : 0)+(data["perfAttendance"].perfAttendanceA0 != null ? data["perfAttendance"].perfAttendanceA0 : 0);
					buffer += "正常："+num0+"&nbsp;次(上午："+(data["perfAttendance"].perfAttendanceM0 != null ? data["perfAttendance"].perfAttendanceM0 : 0)+"&nbsp;次；下午："+(data["perfAttendance"].perfAttendanceA0 != null ? data["perfAttendance"].perfAttendanceA0 : 0)+"&nbsp;次)<br>";
					var num14 = (data["perfAttendance"].perfAttendanceM14 != null ? data["perfAttendance"].perfAttendanceM14 : 0)+(data["perfAttendance"].perfAttendanceA14 != null ? data["perfAttendance"].perfAttendanceA14 : 0);
					buffer += "上课："+num14+"&nbsp;次(上午："+(data["perfAttendance"].perfAttendanceM14 != null ? data["perfAttendance"].perfAttendanceM14 : 0)+"&nbsp;次；下午："+(data["perfAttendance"].perfAttendanceA14 != null ? data["perfAttendance"].perfAttendanceA14 : 0)+"&nbsp;次)<br>";
					var num1 = (data["perfAttendance"].perfAttendanceM1 != null ? data["perfAttendance"].perfAttendanceM1 : 0)+(data["perfAttendance"].perfAttendanceA1 != null ? data["perfAttendance"].perfAttendanceA1 : 0);
					buffer += "公休："+num1+"&nbsp;次(上午："+(data["perfAttendance"].perfAttendanceM1 != null ? data["perfAttendance"].perfAttendanceM1 : 0)+"&nbsp;次；下午："+(data["perfAttendance"].perfAttendanceA1 != null ? data["perfAttendance"].perfAttendanceA1 : 0)+"&nbsp;次)<br>";
					var num2 = (data["perfAttendance"].perfAttendanceM2 != null ? data["perfAttendance"].perfAttendanceM2 : 0)+(data["perfAttendance"].perfAttendanceA2 != null ? data["perfAttendance"].perfAttendanceA2 : 0);
					buffer += "串休："+num2+"&nbsp;次(上午："+(data["perfAttendance"].perfAttendanceM2 != null ? data["perfAttendance"].perfAttendanceM2 : 0)+"&nbsp;次；下午："+(data["perfAttendance"].perfAttendanceA2 != null ? data["perfAttendance"].perfAttendanceA2 : 0)+"&nbsp;次)<br>";
					var num3 = (data["perfAttendance"].perfAttendanceM3 != null ? data["perfAttendance"].perfAttendanceM3 : 0)+(data["perfAttendance"].perfAttendanceA3 != null ? data["perfAttendance"].perfAttendanceA3 : 0);
					buffer += "分校："+num3+"&nbsp;次(上午："+(data["perfAttendance"].perfAttendanceM3 != null ? data["perfAttendance"].perfAttendanceM3 : 0)+"&nbsp;次；下午："+(data["perfAttendance"].perfAttendanceA3 != null ? data["perfAttendance"].perfAttendanceA3 : 0)+"&nbsp;次)<br>";
					var num4 = (data["perfAttendance"].perfAttendanceM4 != null ? data["perfAttendance"].perfAttendanceM4 : 0)+(data["perfAttendance"].perfAttendanceA4 != null ? data["perfAttendance"].perfAttendanceA4 : 0);
					buffer += "外出："+num4+"&nbsp;次(上午："+(data["perfAttendance"].perfAttendanceM4 != null ? data["perfAttendance"].perfAttendanceM4 : 0)+"&nbsp;次；下午："+(data["perfAttendance"].perfAttendanceA4 != null ? data["perfAttendance"].perfAttendanceA4 : 0)+"&nbsp;次)<br>";
					var num5 = (data["perfAttendance"].perfAttendanceM5 != null ? data["perfAttendance"].perfAttendanceM5 : 0)+(data["perfAttendance"].perfAttendanceA5 != null ? data["perfAttendance"].perfAttendanceA5 : 0);
					buffer += "迟到："+num5+"&nbsp;次(上午："+(data["perfAttendance"].perfAttendanceM5 != null ? data["perfAttendance"].perfAttendanceM5 : 0)+"&nbsp;次；下午："+(data["perfAttendance"].perfAttendanceA5 != null ? data["perfAttendance"].perfAttendanceA5 : 0)+"&nbsp;次)<br>";
					var num6 = (data["perfAttendance"].perfAttendanceM6 != null ? data["perfAttendance"].perfAttendanceM6 : 0)+(data["perfAttendance"].perfAttendanceA6 != null ? data["perfAttendance"].perfAttendanceA6 : 0);
					buffer += "早退："+num6+"&nbsp;次(上午："+(data["perfAttendance"].perfAttendanceM6 != null ? data["perfAttendance"].perfAttendanceM6 : 0)+"&nbsp;次；下午："+(data["perfAttendance"].perfAttendanceA6 != null ? data["perfAttendance"].perfAttendanceA6 : 0)+"&nbsp;次)<br>";
					var num7 = (data["perfAttendance"].perfAttendanceM7 != null ? data["perfAttendance"].perfAttendanceM7 : 0)+(data["perfAttendance"].perfAttendanceA7 != null ? data["perfAttendance"].perfAttendanceA7 : 0);
					buffer += "旷工："+num7+"&nbsp;次(上午："+(data["perfAttendance"].perfAttendanceM7 != null ? data["perfAttendance"].perfAttendanceM7 : 0)+"&nbsp;次；下午："+(data["perfAttendance"].perfAttendanceA7 != null ? data["perfAttendance"].perfAttendanceA7 : 0)+"&nbsp;次)<br>";
					var num8 = (data["perfAttendance"].perfAttendanceM8 != null ? data["perfAttendance"].perfAttendanceM8 : 0)+(data["perfAttendance"].perfAttendanceA8 != null ? data["perfAttendance"].perfAttendanceA8 : 0);
					buffer += "事假："+num8+"&nbsp;次(上午："+(data["perfAttendance"].perfAttendanceM8 != null ? data["perfAttendance"].perfAttendanceM8 : 0)+"&nbsp;次；下午："+(data["perfAttendance"].perfAttendanceA8 != null ? data["perfAttendance"].perfAttendanceA8 : 0)+"&nbsp;次)<br>";
					var num9 = (data["perfAttendance"].perfAttendanceM9 != null ? data["perfAttendance"].perfAttendanceM9 : 0)+(data["perfAttendance"].perfAttendanceA9 != null ? data["perfAttendance"].perfAttendanceA9 : 0);
					buffer += "病假："+num9+"&nbsp;次(上午："+(data["perfAttendance"].perfAttendanceM9 != null ? data["perfAttendance"].perfAttendanceM9 : 0)+"&nbsp;次；下午："+(data["perfAttendance"].perfAttendanceA9 != null ? data["perfAttendance"].perfAttendanceA9 : 0)+"&nbsp;次)<br>";
					var num10 = (data["perfAttendance"].perfAttendanceM10 != null ? data["perfAttendance"].perfAttendanceM10 : 0)+(data["perfAttendance"].perfAttendanceA10 != null ? data["perfAttendance"].perfAttendanceA10 : 0);
					buffer += "丧假："+num10+"&nbsp;次(上午："+(data["perfAttendance"].perfAttendanceM10 != null ? data["perfAttendance"].perfAttendanceM10 : 0)+"&nbsp;次；下午："+(data["perfAttendance"].perfAttendanceA10 != null ? data["perfAttendance"].perfAttendanceA10 : 0)+"&nbsp;次)<br>";
					var num11 = (data["perfAttendance"].perfAttendanceM11 != null ? data["perfAttendance"].perfAttendanceM11 : 0)+(data["perfAttendance"].perfAttendanceA11 != null ? data["perfAttendance"].perfAttendanceA11 : 0);
					buffer += "婚假："+num11+"&nbsp;次(上午："+(data["perfAttendance"].perfAttendanceM11 != null ? data["perfAttendance"].perfAttendanceM11 : 0)+"&nbsp;次；下午："+(data["perfAttendance"].perfAttendanceA11 != null ? data["perfAttendance"].perfAttendanceA11 : 0)+"&nbsp;次)<br>";
					var num15 = (data["perfAttendance"].perfAttendanceM15 != null ? data["perfAttendance"].perfAttendanceM15 : 0)+(data["perfAttendance"].perfAttendanceA15 != null ? data["perfAttendance"].perfAttendanceA15 : 0);
					buffer += "正常："+num15+"&nbsp;次(上午："+(data["perfAttendance"].perfAttendanceM15 != null ? data["perfAttendance"].perfAttendanceM15 : 0)+"&nbsp;次；下午："+(data["perfAttendance"].perfAttendanceA15 != null ? data["perfAttendance"].perfAttendanceA15 : 0)+"&nbsp;次)<br>";
					var num12 = (data["perfAttendance"].perfAttendanceM12 != null ? data["perfAttendance"].perfAttendanceM12 : 0)+(data["perfAttendance"].perfAttendanceA12 != null ? data["perfAttendance"].perfAttendanceA12 : 0);
					buffer += "出差："+num12+"&nbsp;次(上午："+(data["perfAttendance"].perfAttendanceM12 != null ? data["perfAttendance"].perfAttendanceM12 : 0)+"&nbsp;次；下午："+(data["perfAttendance"].perfAttendanceA12 != null ? data["perfAttendance"].perfAttendanceA12 : 0)+"&nbsp;次)<br>";
					var num13 = (data["perfAttendance"].perfAttendanceM13 != null ? data["perfAttendance"].perfAttendanceM13 : 0)+(data["perfAttendance"].perfAttendanceA13 != null ? data["perfAttendance"].perfAttendanceA13 : 0);
					buffer += "其他："+num13+"&nbsp;次(上午："+(data["perfAttendance"].perfAttendanceM13 != null ? data["perfAttendance"].perfAttendanceM13 : 0)+"&nbsp;次；下午："+(data["perfAttendance"].perfAttendanceA13 != null ? data["perfAttendance"].perfAttendanceA13 : 0)+"&nbsp;次)<br>";
					buffer += "晚上休息："+(data["perfAttendance"].perfAttendanceE0 != null ? data["perfAttendance"].perfAttendanceE0 : 0)+"&nbsp;次；晚上上课："+(data["perfAttendance"].perfAttendanceE1 != null ? data["perfAttendance"].perfAttendanceE1 : 0)+"&nbsp;次；晚上值班："+(data["perfAttendance"].perfAttendanceE2 != null ? data["perfAttendance"].perfAttendanceE2 : 0)+"&nbsp;次<br>";
					buffer += "</td>";
					buffer += "<td style='width:140px;vertical-align:top;margin-top:5px;word-break:break-all'>"+(data["perfAttendance"].result != null ? data["perfAttendance"].result : "")+"</td>";
					buffer += "<td style='width:80px;text-align:center'>"+data["perfAttendanceCreate"]+"</td>";
					buffer += "</tr>";
				}
				if(data["perfBehaviour"] != null){
					buffer += "<tr>";
					buffer += "<th width='100'>行为规范</th>";
					buffer += "<td style='width:400px;vertical-align:top;line-height:20px'>";
					buffer += "日志："+(data["perfBehaviour"].perfBehaviour0 != null ? data["perfBehaviour"].perfBehaviour0 : 0)+"&nbsp;篇(应写&nbsp;"+(data["perfBehaviour"].perfBehaviourS0 != null ? data["perfBehaviour"].perfBehaviourS0 : 0)+"&nbsp;篇)&nbsp;&nbsp;";
					buffer += "发帖："+(data["perfBehaviour"].perfBehaviour1 != null ? data["perfBehaviour"].perfBehaviour1 : 0)+"&nbsp;条(应发&nbsp;"+(data["perfBehaviour"].perfBehaviourS1 != null ? data["perfBehaviour"].perfBehaviourS1 : 0)+"&nbsp;条)<br>";
					buffer += "缺席早会："+(data["perfBehaviour"].perfBehaviour2 != null ? data["perfBehaviour"].perfBehaviour2 : 0)+"&nbsp;次&nbsp;&nbsp;";
					buffer += "缺席夕会："+(data["perfBehaviour"].perfBehaviour3 != null ? data["perfBehaviour"].perfBehaviour3 : 0)+"&nbsp;次<br>";
					var num4 = (data["perfBehaviour"].perfBehaviourM4 != null ? data["perfBehaviour"].perfBehaviourM4 : 0)+(data["perfBehaviour"].perfBehaviourA4 != null ? data["perfBehaviour"].perfBehaviourA4 : 0)+(data["perfBehaviour"].perfBehaviourE4 != null ? data["perfBehaviour"].perfBehaviourE4 : 0);
					buffer += "工装："+num4+"&nbsp;次(上午："+(data["perfBehaviour"].perfBehaviourM4 != null ? data["perfBehaviour"].perfBehaviourM4 : 0)+"&nbsp;次；下午："+(data["perfBehaviour"].perfBehaviourA4 != null ? data["perfBehaviour"].perfBehaviourA4 : 0)+"&nbsp;次；晚上："+(data["perfBehaviour"].perfBehaviourE4 != null ? data["perfBehaviour"].perfBehaviourE4 : 0)+"&nbsp;次)<br>";
					var num5 = (data["perfBehaviour"].perfBehaviourM5 != null ? data["perfBehaviour"].perfBehaviourM5 : 0)+(data["perfBehaviour"].perfBehaviourA5 != null ? data["perfBehaviour"].perfBehaviourA5 : 0)+(data["perfBehaviour"].perfBehaviourE5 != null ? data["perfBehaviour"].perfBehaviourE5 : 0);
					buffer += "工牌："+num5+"&nbsp;次(上午："+(data["perfBehaviour"].perfBehaviourM5 != null ? data["perfBehaviour"].perfBehaviourM5 : 0)+"&nbsp;次；下午："+(data["perfBehaviour"].perfBehaviourA5 != null ? data["perfBehaviour"].perfBehaviourA5 : 0)+"&nbsp;次；晚上："+(data["perfBehaviour"].perfBehaviourE5 != null ? data["perfBehaviour"].perfBehaviourE5 : 0)+"&nbsp;次)<br>";
					var num6 = (data["perfBehaviour"].perfBehaviourM6 != null ? data["perfBehaviour"].perfBehaviourM6 : 0)+(data["perfBehaviour"].perfBehaviourA6 != null ? data["perfBehaviour"].perfBehaviourA6 : 0)+(data["perfBehaviour"].perfBehaviourE6 != null ? data["perfBehaviour"].perfBehaviourE6 : 0);
					buffer += "卫生："+num6+"&nbsp;次(上午："+(data["perfBehaviour"].perfBehaviourM6 != null ? data["perfBehaviour"].perfBehaviourM6 : 0)+"&nbsp;次；下午："+(data["perfBehaviour"].perfBehaviourA6 != null ? data["perfBehaviour"].perfBehaviourA6 : 0)+"&nbsp;次；晚上："+(data["perfBehaviour"].perfBehaviourE6 != null ? data["perfBehaviour"].perfBehaviourE6 : 0)+"&nbsp;次)<br>";
					var num7 = (data["perfBehaviour"].perfBehaviourM7 != null ? data["perfBehaviour"].perfBehaviourM7 : 0)+(data["perfBehaviour"].perfBehaviourA7 != null ? data["perfBehaviour"].perfBehaviourA7 : 0)+(data["perfBehaviour"].perfBehaviourE7 != null ? data["perfBehaviour"].perfBehaviourE7 : 0);
					buffer += "脱岗："+num7+"&nbsp;次(上午："+(data["perfBehaviour"].perfBehaviourM7 != null ? data["perfBehaviour"].perfBehaviourM7 : 0)+"&nbsp;次；下午："+(data["perfBehaviour"].perfBehaviourA7 != null ? data["perfBehaviour"].perfBehaviourA7 : 0)+"&nbsp;次；晚上："+(data["perfBehaviour"].perfBehaviourE7 != null ? data["perfBehaviour"].perfBehaviourE7 : 0)+"&nbsp;次)<br>";
					var num8 = (data["perfBehaviour"].perfBehaviourM8 != null ? data["perfBehaviour"].perfBehaviourM8 : 0)+(data["perfBehaviour"].perfBehaviourA8 != null ? data["perfBehaviour"].perfBehaviourA8 : 0)+(data["perfBehaviour"].perfBehaviourE8 != null ? data["perfBehaviour"].perfBehaviourE8 : 0);
					buffer += "吃东西："+num8+"&nbsp;次(上午："+(data["perfBehaviour"].perfBehaviourM8 != null ? data["perfBehaviour"].perfBehaviourM8 : 0)+"&nbsp;次；下午："+(data["perfBehaviour"].perfBehaviourA8 != null ? data["perfBehaviour"].perfBehaviourA8 : 0)+"&nbsp;次；晚上："+(data["perfBehaviour"].perfBehaviourE8 != null ? data["perfBehaviour"].perfBehaviourE8 : 0)+"&nbsp;次)<br>";
					var num9 = (data["perfBehaviour"].perfBehaviourM9 != null ? data["perfBehaviour"].perfBehaviourM9 : 0)+(data["perfBehaviour"].perfBehaviourA9 != null ? data["perfBehaviour"].perfBehaviourA9 : 0)+(data["perfBehaviour"].perfBehaviourE9 != null ? data["perfBehaviour"].perfBehaviourE9 : 0);
					buffer += "看电影："+num9+"&nbsp;次(上午："+(data["perfBehaviour"].perfBehaviourM9 != null ? data["perfBehaviour"].perfBehaviourM9 : 0)+"&nbsp;次；下午："+(data["perfBehaviour"].perfBehaviourA9 != null ? data["perfBehaviour"].perfBehaviourA9 : 0)+"&nbsp;次；晚上："+(data["perfBehaviour"].perfBehaviourE9 != null ? data["perfBehaviour"].perfBehaviourE9 : 0)+"&nbsp;次)<br>";
					var num10 = (data["perfBehaviour"].perfBehaviourM10 != null ? data["perfBehaviour"].perfBehaviourM10 : 0)+(data["perfBehaviour"].perfBehaviourA10 != null ? data["perfBehaviour"].perfBehaviourA10 : 0)+(data["perfBehaviour"].perfBehaviourE10 != null ? data["perfBehaviour"].perfBehaviourE10 : 0);
					buffer += "听歌："+num10+"&nbsp;次(上午："+(data["perfBehaviour"].perfBehaviourM10 != null ? data["perfBehaviour"].perfBehaviourM10 : 0)+"&nbsp;次；下午："+(data["perfBehaviour"].perfBehaviourA10 != null ? data["perfBehaviour"].perfBehaviourA10 : 0)+"&nbsp;次；晚上："+(data["perfBehaviour"].perfBehaviourE10 != null ? data["perfBehaviour"].perfBehaviourE10 : 0)+"&nbsp;次)<br>";
					var num11 = (data["perfBehaviour"].perfBehaviourM11 != null ? data["perfBehaviour"].perfBehaviourM11 : 0)+(data["perfBehaviour"].perfBehaviourA11 != null ? data["perfBehaviour"].perfBehaviourA11 : 0)+(data["perfBehaviour"].perfBehaviourE11 != null ? data["perfBehaviour"].perfBehaviourE11 : 0);
					buffer += "睡觉："+num11+"&nbsp;次(上午："+(data["perfBehaviour"].perfBehaviourM11 != null ? data["perfBehaviour"].perfBehaviourM11 : 0)+"&nbsp;次；下午："+(data["perfBehaviour"].perfBehaviourA11 != null ? data["perfBehaviour"].perfBehaviourA11 : 0)+"&nbsp;次；晚上："+(data["perfBehaviour"].perfBehaviourE11 != null ? data["perfBehaviour"].perfBehaviourE11 : 0)+"&nbsp;次)<br>";
					var num12 = (data["perfBehaviour"].perfBehaviourM12 != null ? data["perfBehaviour"].perfBehaviourM12 : 0)+(data["perfBehaviour"].perfBehaviourA12 != null ? data["perfBehaviour"].perfBehaviourA12 : 0)+(data["perfBehaviour"].perfBehaviourE12 != null ? data["perfBehaviour"].perfBehaviourE12 : 0);
					buffer += "其他娱乐："+num12+"&nbsp;次(上午："+(data["perfBehaviour"].perfBehaviourM12 != null ? data["perfBehaviour"].perfBehaviourM12 : 0)+"&nbsp;次；下午："+(data["perfBehaviour"].perfBehaviourA12 != null ? data["perfBehaviour"].perfBehaviourA12 : 0)+"&nbsp;次；晚上："+(data["perfBehaviour"].perfBehaviourE12 != null ? data["perfBehaviour"].perfBehaviourE12 : 0)+"&nbsp;次)<br>";
					buffer += "投诉："+(data["perfBehaviour"].perfBehaviour13 != null ? data["perfBehaviour"].perfBehaviour13 : 0)+"&nbsp;次<br>";
					buffer += "</td>";
					buffer += "<td style='width:140px;vertical-align:top;margin-top:5px;word-break:break-all'>"+(data["perfBehaviour"].result != null ? data["perfBehaviour"].result : "")+"</td>";
					buffer += "<td style='width:80px;text-align:center'>"+data["perfBehaviourCreate"]+"</td>";
					buffer += "</tr>";
				}
				if(data["perfReception"] != null){
					buffer += "<tr>";
					buffer += "<th width='100'>接待管理</th>";
					buffer += "<td style='width:400px;vertical-align:top'>";
					buffer += "</td>";
					buffer += "<td style='width:140px;height:100px;vertical-align:top;margin-top:3px'>"+(data["perfReception"].result != null ? data["perfReception"].result : "")+"</td>";
					buffer += "<td style='width:80px;text-align:center'>是</td>";
					buffer += "</tr>";
				}
				if(data["perfFacility"] != null){
					buffer += "<tr>";
					buffer += "<th width='100'>设施管理</th>";
					buffer += "<td style='width:400px;vertical-align:top'>";
					buffer += "</td>";
					buffer += "<td style='width:140px;height:100px;vertical-align:top;margin-top:3px'>"+(data["perfFacility"].result != null ? data["perfFacility"].result : "")+"</td>";
					buffer += "<td style='width:80px;text-align:center'>是</td>";
					buffer += "</tr>";
				}
				if(data["perfMaterial"] != null){
					buffer += "<tr>";
					buffer += "<th width='100'>物资管理</th>";
					buffer += "<td style='width:400px;vertical-align:top'>";
					buffer += "</td>";
					buffer += "<td style='width:140px;height:100px;vertical-align:top;margin-top:3px'>"+(data["perfMaterial"].result != null ? data["perfMaterial"].result : "")+"</td>";
					buffer += "<td style='width:80px;text-align:center'>是</td>";
					buffer += "</tr>";
				}
				if(data["perfFinancial"] != null){
					buffer += "<tr>";
					buffer += "<th width='100'>财务管理</th>";
					buffer += "<td style='width:400px;vertical-align:top'>";
					buffer += "</td>";
					buffer += "<td style='width:140px;height:100px;vertical-align:top;margin-top:3px'>"+(data["perfFinancial"].result != null ? data["perfFinancial"].result : "")+"</td>";
					buffer += "<td style='width:80px;text-align:center'>是</td>";
					buffer += "</tr>";
				}
				if(data["perfLession"] != null){
					buffer += "<tr>";
					buffer += "<th width='100'>课时统计</th>";
					buffer += "<td style='width:400px;vertical-align:top'>";
					buffer += "</td>";
					buffer += "<td style='width:140px;height:100px;vertical-align:top;margin-top:3px'>"+(data["perfLession"].result != null ? data["perfLession"].result : "")+"</td>";
					buffer += "<td style='width:80px;text-align:center'>是</td>";
					buffer += "</tr>";
				}
				if(data["perfTeaching"] != null){
					buffer += "<tr>";
					buffer += "<th width='100'>教学达成</th>";
					buffer += "<td style='width:400px;vertical-align:top'>";
					buffer += "</td>";
					buffer += "<td style='width:140px;height:100px;vertical-align:top;margin-top:3px'>"+(data["perfTeaching"].result != null ? data["perfTeaching"].result : "")+"</td>";
					buffer += "<td style='width:80px;text-align:center'>是</td>";
					buffer += "</tr>";
				}
				if(data["perfChildren"] != null){
					buffer += "<tr>";
					buffer += "<th width='100'>少儿部门考核</th>";
					buffer += "<td style='width:400px;vertical-align:top'>";
					buffer += "</td>";
					buffer += "<td style='width:140px;height:100px;vertical-align:top;margin-top:3px'>"+(data["perfChildren"].result != null ? data["perfChildren"].result : "")+"</td>";
					buffer += "<td style='width:80px;text-align:center'>是</td>";
					buffer += "</tr>";
				}
				if(data["perfLongTerm"] != null){
					buffer += "<tr>";
					buffer += "<th width='100'>长期班学员及班级管理</th>";
					buffer += "<td style='width:400px;vertical-align:top'>";
					buffer += "</td>";
					buffer += "<td style='width:140px;height:100px;vertical-align:top;margin-top:3px'>"+(data["perfLongTerm"].result != null ? data["perfLongTerm"].result : "")+"</td>";
					buffer += "<td style='width:80px;text-align:center'>是</td>";
					buffer += "</tr>";
				}
				if(data["perfShortTerm"] != null){
					buffer += "<tr>";
					buffer += "<th width='100'>短期班班主任及教务管理</th>";
					buffer += "<td style='width:400px;vertical-align:top'>";
					buffer += "</td>";
					buffer += "<td style='width:140px;height:100px;vertical-align:top;margin-top:3px'>"+(data["perfShortTerm"].result != null ? data["perfShortTerm"].result : "")+"</td>";
					buffer += "<td style='width:80px;text-align:center'>是</td>";
					buffer += "</tr>";
				}
				if(data["perfObtain"] != null){
					buffer += "<tr>";
					buffer += "<th width='100'>就业管理</th>";
					buffer += "<td style='width:400px;vertical-align:top'>";
					buffer += "</td>";
					buffer += "<td style='width:140px;height:100px;vertical-align:top;margin-top:3px'>"+(data["perfObtain"].result != null ? data["perfObtain"].result : "")+"</td>";
					buffer += "<td style='width:80px;text-align:center'>是</td>";
					buffer += "</tr>";
				}
				if(data["perfRecruit"] != null){
					buffer += "<tr>";
					buffer += "<th width='100'>招生任务</th>";
					buffer += "<td style='width:400px;vertical-align:top'>";
					buffer += "</td>";
					buffer += "<td style='width:140px;height:100px;vertical-align:top;margin-top:3px'>"+(data["perfRecruit"].result != null ? data["perfRecruit"].result : "")+"</td>";
					buffer += "<td style='width:80px;text-align:center'>是</td>";
					buffer += "</tr>";
				}
				if(data["perfPropaganda"] != null){
					buffer += "<tr>";
					buffer += "<th width='100'>市场宣传</th>";
					buffer += "<td style='width:400px;vertical-align:top'>";
					buffer += "</td>";
					buffer += "<td style='width:140px;height:100px;vertical-align:top;margin-top:3px'>"+(data["perfPropaganda"].result != null ? data["perfPropaganda"].result : "")+"</td>";
					buffer += "<td style='width:80px;text-align:center'>是</td>";
					buffer += "</tr>";
				}
				if(data["perfAdmin"] != null){
					buffer += "<tr>";
					buffer += "<th width='100'>行政管理</th>";
					buffer += "<td style='width:400px;vertical-align:top'>";
					buffer += "</td>";
					buffer += "<td style='width:140px;height:100px;vertical-align:top;margin-top:3px'>"+(data["perfAdmin"].result != null ? data["perfAdmin"].result : "")+"</td>";
					buffer += "<td style='width:80px;text-align:center'>是</td>";
					buffer += "</tr>";
				}
				if(data["perfIncharge"] != null){
					buffer += "<tr>";
					buffer += "<th width='100'>分校及部门负责人</th>";
					buffer += "<td style='width:400px;vertical-align:top'>";
					buffer += "</td>";
					buffer += "<td style='width:140px;height:100px;vertical-align:top;margin-top:3px'>"+(data["perfIncharge"].result != null ? data["perfIncharge"].result : "")+"</td>";
					buffer += "<td style='width:80px;text-align:center'>是</td>";
					buffer += "</tr>";
				}
				if(data["perfDriver"] != null){
					buffer += "<tr>";
					buffer += "<th width='100'>司机及总务</th>";
					buffer += "<td style='width:400px;vertical-align:top'>";
					buffer += "</td>";
					buffer += "<td style='width:140px;height:100px;vertical-align:top;margin-top:3px'>"+(data["perfDriver"].result != null ? data["perfDriver"].result : "")+"</td>";
					buffer += "<td style='width:80px;text-align:center'>是</td>";
					buffer += "</tr>";
				}
				if(data["perfSecurityClean"] != null){
					buffer += "<tr>";
					buffer += "<th width='100'>保洁保安</th>";
					buffer += "<td style='width:400px;vertical-align:top'>";
					buffer += "</td>";
					buffer += "<td style='width:140px;height:100px;vertical-align:top;margin-top:3px'>"+(data["perfSecurityClean"].result != null ? data["perfSecurityClean"].result : "")+"</td>";
					buffer += "<td style='width:80px;text-align:center'>是</td>";
					buffer += "</tr>";
				}
				if(data["perfOther"] != null){
					buffer += "<tr>";
					buffer += "<th width='100'>其他</th>";
					buffer += "<td style='width:400px;vertical-align:top'>";
					buffer += "</td>";
					buffer += "<td style='width:140px;height:100px;vertical-align:top;margin-top:3px'>"+(data["perfOther"].result != null ? data["perfOther"].result : "")+"</td>";
					buffer += "<td style='width:80px;text-align:center'>是</td>";
					buffer += "</tr>";
				}
			}
		}, "json");
	}

	buffer += "</table>";
	$("#result").html(buffer);
}
</script>
<div style="font-family:黑体;font-size:20px;">&nbsp;绩 效 查 询</div>
<br><br><br>
<table width="720" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">
	<tr>
		<th width="720" colspan="6">员工信息</th>
	</tr>
	<tr>
		<th width="100">员工号：</th>
		<td width="140"><s:property value="#session.LOGIN_EMPLOYEE.person.personNo" /></td>
		<th width="100">姓名：</th>
		<td width="140"><s:property value="#session.LOGIN_EMPLOYEE.person.name" /></td>
		<th width="100">性别：</th>
		<td width="140"><s:property value="#session.LOGIN_EMPLOYEE.person.gender.description" /></td>
	</tr>
	<tr>
		<th width="100">组织机构：</th>
		<td width="140"><s:property value="#session.LOGIN_EMPLOYEE.department.description" /></td>
		<th width="100">校区：</th>
		<td width="140"><s:property value="#session.LOGIN_EMPLOYEE.campus.description" /></td>
		<th width="100">工作电话：</th>
		<td width="140"><s:property value="#session.LOGIN_EMPLOYEE.workPhone" /></td>
	</tr>
</table>
<br>
<div style="text-align:center"><input id="hiddenDate" class="DateTimeQuery" format="part" execute="execute" /></div>
<br>
<div id="result" class="bigResultCon" style="width:720px"></div>
<br>
</body>
</html>
