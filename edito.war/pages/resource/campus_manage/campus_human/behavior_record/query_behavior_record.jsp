<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ page import="com.ito.edito.util.Constants" %>
<html>
<head>
	<title>行为规范</title>
</head>

<body>
<form id="form" name="form" method="post">
<input type="hidden" name="uuid" />
<input type="hidden" name="resultCode" />
</form>
<script>
var todayDay = "";
var todayDate = "";
var preSunday = "";
var flag = new Array(7);
for(var a=0; a < 7; a++)
{
	flag[a] = 0;
}
function execute(){
	$.ajaxSetup({async:false});
	var dateStr = $("#hiddenDate").val();
	var year = parseInt(dateStr.substr(0, 4), 10);
	var month = parseInt(dateStr.substr(5, 2), 10) - 1;
	var day = parseInt(dateStr.substr(8, 2), 10);
	var date = new Date(year, month, day);
	var dateDay = date.getDay();

	var curSunday = getWeekDay(date, 0);
	var curMonday = getWeekDay(date, 1);
	var curTuesday = getWeekDay(date, 2);
	var curWednesday = getWeekDay(date, 3);
	var curThursday = getWeekDay(date, 4);
	var curFriday = getWeekDay(date, 5);
	var curSaturday = getWeekDay(date, 6);
	var curWeek = [	curSunday, curMonday, curTuesday, curWednesday, curThursday, curFriday, curSaturday ];

	if(todayDate == ""){
		todayDate = dateStr;
		todayDay = dateDay;
	}

	if(preSunday != curSunday){
		preSunday = curSunday;
		$.post(cp+"/ajaxs/resource/campus/manage/campus/human/behavior/record/query_behavior_record.html", {date:dateStr,campusUuid:"none"}, function(data){
			var buffer = "";
			buffer += "<form id='formA'>";
			buffer += "<table width='745px' cellpadding='0' cellspacing='0' border='0' class='schedule'>";
			buffer += "<tr>";
			buffer += "<td colspan='9' style='background-color:#FFFFCB'>";
			buffer += "&nbsp;<img src='"+cp+"/images/mainResource/arrow_left.gif' style='cursor:hand' onclick='javascript:changeWeek(-1);' title='前一周'>";
			buffer += "&nbsp;<img src='"+cp+"/images/mainResource/arrow_right.gif' style='cursor:hand' onclick='javascript:changeWeek(1);' title='后一周'>";
			buffer += "&nbsp;" + curSunday + " - " + curSaturday;
			buffer += "&nbsp;&nbsp;&nbsp;<a href='javascript:changeWeek(0)' title='"+todayDate+"'>今天</a>";
			buffer += "</td>";
			buffer += "</tr>";
			buffer += "<tr><th width='115' height='400' colspan='2'></th><th width='90'>星期日<br>"+curSunday+"</th><th width='90'>星期一<br>"+curMonday+"</th><th width='90'>星期二<br>"+curTuesday+"</th><th width='90'>星期三<br>"+curWednesday+"</th><th width='90'>星期四<br>"+curThursday+"</th><th width='90'>星期五<br>"+curFriday+"</th><th width='90'>星期六<br>"+curSaturday+"</th></tr>";

			var num = 0;
			for(var i=0; i<data[0].length; i++){
				var employeeInfo = data[0][i].split("|");
				buffer += "<tr>";
				buffer += "<th width='70' rowspan='3'>" + employeeInfo[1] + "</th>";

				buffer += "<th width='45px'>上午</th>";
				for(var j=0; j<7; j++){
					flag[j] %= 3;
					if(data[1][i][0][j] == "none"){
						buffer += "<td id='td_"+j+"_"+i+"' width='90' align='center' title='不能创建未来的记录'>";
						buffer += "";
					}
					else if(data[1][i][0][j] == "null"){
						buffer += "<td id='td_"+j+"_"+i+"' width='90' align='center' title='创建记录'>";
						buffer += "<br>";
						buffer += "<input type='hidden' name='instance(BehaviourStandard["+num+"]).employeeUuid' value='"+employeeInfo[0]+"' />";
						buffer += "<input type='hidden' name='instance(BehaviourStandard["+num+"]).checkDate' value='"+curWeek[j]+"' />";
						buffer += "<input type='hidden' name='instance(BehaviourStandard["+num+"]).timesFlag' value='"+flag[j]+"' />";
						buffer += "<select name='instance(BehaviourStandard["+num+"]).typeUuid'>";
						buffer += "<option value='<%=Constants.BEHAVIOUR_STANDARD_UUID_NORMAL%>' selected='selected'>正常</option>";
						buffer += "<option value='<%=Constants.BEHAVIOUR_STANDARD_UUID_FROCK%>'>工装</option>";
						buffer += "<option value='<%=Constants.BEHAVIOUR_STANDARD_UUID_CARD%>'>工牌</option>";
						buffer += "<option value='<%=Constants.BEHAVIOUR_STANDARD_UUID_HYGIENE%>'>卫生</option>";
						buffer += "<option value='<%=Constants.BEHAVIOUR_STANDARD_UUID_MORNING_MEETING%>'>缺席晨会</option>";
						buffer += "<option value='<%=Constants.BEHAVIOUR_STANDARD_UUID_EVENING_MEETING%>'>缺席夕会</option>";
						buffer += "<option value='<%=Constants.BEHAVIOUR_STANDARD_UUID_GAUNT%>'>脱岗</option>";
						buffer += "<option value='<%=Constants.BEHAVIOUR_STANDARD_UUID_EATING%>'>吃东西</option>";
						buffer += "<option value='<%=Constants.BEHAVIOUR_STANDARD_UUID_MOVIE%>'>看电影</option>";
						buffer += "<option value='<%=Constants.BEHAVIOUR_STANDARD_UUID_SONG%>'>听歌</option>";
						buffer += "<option value='<%=Constants.BEHAVIOUR_STANDARD_UUID_SLEEPING%>'>睡觉</option>";
						buffer += "<option value='<%=Constants.BEHAVIOUR_STANDARD_UUID_OTHER%>'>其他娱乐</option>";
						buffer += "</select>&nbsp;";
						buffer += "<div style='font-size:11px;display:inline'><a href='javascript:editIntro(\"intro1_"+i+"_"+j+"\")' title='点击填写备注')'>注</a></div><br>";
						buffer += "<div id='intro1_"+i+"_"+j+"' style='display:none' submit='false'><br><textarea name='instance(BehaviourStandard["+num+"]).introduction' style='width:80px;height:50px'></textarea></div>";
						buffer += "<br>";
						flag[j]++;
						num++;
					}
					else {
						var info = data[1][i][0][j].split("|");

						buffer += "<td id='td_"+j+"_"+i+"' width='90' align='center' id='td_0_"+i+"_"+j+"' title='双击编辑记录' ondblclick='editContent(\"0_"+i+"\", \""+j+"\")'>";
						buffer += "<div id='show_0_"+i+"_"+j+"'>";
						buffer += info[2];
						if(info[3] != ""){
							buffer += "&nbsp;<div style='font-size:11px;display:inline;cursor:hand'><a title='"+info[3]+"')'>注</a></div>";
						}
						buffer += "</div>";
						buffer += "<div id='hide_0_"+i+"_"+j+"' submit='false' style='display:none'><br>";
						buffer += "<input type='hidden' name='instance(BehaviourStandard["+num+"]).uuid' value='"+info[0]+"' />";
						buffer += "<input type='hidden' name='instance(BehaviourStandard["+num+"]).employeeUuid' value='"+employeeInfo[0]+"' />";
						buffer += "<input type='hidden' name='instance(BehaviourStandard["+num+"]).checkDate' value='"+curWeek[j]+"' />";
						buffer += "<select name='instance(BehaviourStandard["+num+"]).typeUuid'>";
						buffer += "<option value='<%=Constants.BEHAVIOUR_STANDARD_UUID_NORMAL%>' ";
						if(info[1] == "<%=Constants.BEHAVIOUR_STANDARD_UUID_NORMAL%>"){
							buffer += "selected='selected'";
						}
						buffer += ">正常</option>";
						buffer += "<option value='<%=Constants.BEHAVIOUR_STANDARD_UUID_FROCK%>' ";
						if(info[1] == "<%=Constants.BEHAVIOUR_STANDARD_UUID_FROCK%>"){
							buffer += "selected='selected'";
						}
						buffer += ">工装</option>";
						buffer += "<option value='<%=Constants.BEHAVIOUR_STANDARD_UUID_CARD%>' ";
						if(info[1] == "<%=Constants.BEHAVIOUR_STANDARD_UUID_CARD%>"){
							buffer += "selected='selected'";
						}
						buffer += ">工牌</option>";
						buffer += "<option value='<%=Constants.BEHAVIOUR_STANDARD_UUID_HYGIENE%>' ";
						if(info[1] == "<%=Constants.BEHAVIOUR_STANDARD_UUID_HYGIENE%>"){
							buffer += "selected='selected'";
						}
						buffer += ">卫生</option>";
						buffer += "<option value='<%=Constants.BEHAVIOUR_STANDARD_UUID_MORNING_MEETING%>' ";
						if(info[1] == "<%=Constants.BEHAVIOUR_STANDARD_UUID_MORNING_MEETING%>"){
							buffer += "selected='selected'";
						}
						buffer += ">缺席晨会</option>";
						buffer += "<option value='<%=Constants.BEHAVIOUR_STANDARD_UUID_EVENING_MEETING%>' ";
						if(info[1] == "<%=Constants.BEHAVIOUR_STANDARD_UUID_EVENING_MEETING%>"){
							buffer += "selected='selected'";
						}
						buffer += ">缺席夕会</option>";
						buffer += "<option value='<%=Constants.BEHAVIOUR_STANDARD_UUID_GAUNT%>' ";
						if(info[1] == "<%=Constants.BEHAVIOUR_STANDARD_UUID_GAUNT%>"){
							buffer += "selected='selected'";
						}
						buffer += ">脱岗</option>";
						buffer += "<option value='<%=Constants.BEHAVIOUR_STANDARD_UUID_EATING%>' ";
						if(info[1] == "<%=Constants.BEHAVIOUR_STANDARD_UUID_EATING%>"){
							buffer += "selected='selected'";
						}
						buffer += ">吃东西</option>";
						buffer += "<option value='<%=Constants.BEHAVIOUR_STANDARD_UUID_MOVIE%>' ";
						if(info[1] == "<%=Constants.BEHAVIOUR_STANDARD_UUID_MOVIE%>"){
							buffer += "selected='selected'";
						}
						buffer += ">看电影</option>";
						buffer += "<option value='<%=Constants.BEHAVIOUR_STANDARD_UUID_SONG%>' ";
						if(info[1] == "<%=Constants.BEHAVIOUR_STANDARD_UUID_SONG%>"){
							buffer += "selected='selected'";
						}
						buffer += ">听歌</option>";
						buffer += "<option value='<%=Constants.BEHAVIOUR_STANDARD_UUID_SLEEPING%>' ";
						if(info[1] == "<%=Constants.BEHAVIOUR_STANDARD_UUID_SLEEPING%>"){
							buffer += "selected='selected'";
						}
						buffer += ">睡觉</option>";
						buffer += "<option value='<%=Constants.BEHAVIOUR_STANDARD_UUID_OTHER%>' ";
						if(info[1] == "<%=Constants.BEHAVIOUR_STANDARD_UUID_OTHER%>"){
							buffer += "selected='selected'";
						}
						buffer += ">其他娱乐</option>";
						buffer += "</select><br><br>";
						buffer += "<textarea name='instance(BehaviourStandard["+num+"]).introduction' style='width:75px;height:50px'>"+info[3]+"</textarea><br><br>";
						buffer += "</div>";

						num++;
					}
					
					buffer += "</td>";
				}
				buffer += "</tr>";

				buffer += "<th width='45px'>下午</th>";
				for(var j=0; j<7; j++){
					flag[j] %= 3;
					if(data[1][i][1][j] == "none"){
						buffer += "<td id='td_"+j+"_"+i+"' width='90' align='center' title='不能创建未来的记录'>";
						buffer += "";
					}
					else if(data[1][i][1][j] == "null"){
						buffer += "<td id='td_"+j+"_"+i+"' width='90' align='center' title='创建记录'>";
						buffer += "<br>";
						buffer += "<input type='hidden' name='instance(BehaviourStandard["+num+"]).employeeUuid' value='"+employeeInfo[0]+"' />";
						buffer += "<input type='hidden' name='instance(BehaviourStandard["+num+"]).checkDate' value='"+curWeek[j]+"' />";
						buffer += "<input type='hidden' name='instance(BehaviourStandard["+num+"]).timesFlag' value='"+flag[j]+"' />";
						buffer += "<select name='instance(BehaviourStandard["+num+"]).typeUuid'>";
						buffer += "<option value='<%=Constants.BEHAVIOUR_STANDARD_UUID_NORMAL%>' selected='selected'>正常</option>";
						buffer += "<option value='<%=Constants.BEHAVIOUR_STANDARD_UUID_FROCK%>'>工装</option>";
						buffer += "<option value='<%=Constants.BEHAVIOUR_STANDARD_UUID_CARD%>'>工牌</option>";
						buffer += "<option value='<%=Constants.BEHAVIOUR_STANDARD_UUID_HYGIENE%>'>卫生</option>";
						buffer += "<option value='<%=Constants.BEHAVIOUR_STANDARD_UUID_MORNING_MEETING%>'>缺席晨会</option>";
						buffer += "<option value='<%=Constants.BEHAVIOUR_STANDARD_UUID_EVENING_MEETING%>'>缺席夕会</option>";
						buffer += "<option value='<%=Constants.BEHAVIOUR_STANDARD_UUID_GAUNT%>'>脱岗</option>";
						buffer += "<option value='<%=Constants.BEHAVIOUR_STANDARD_UUID_EATING%>'>吃东西</option>";
						buffer += "<option value='<%=Constants.BEHAVIOUR_STANDARD_UUID_MOVIE%>'>看电影</option>";
						buffer += "<option value='<%=Constants.BEHAVIOUR_STANDARD_UUID_SONG%>'>听歌</option>";
						buffer += "<option value='<%=Constants.BEHAVIOUR_STANDARD_UUID_SLEEPING%>'>睡觉</option>";
						buffer += "<option value='<%=Constants.BEHAVIOUR_STANDARD_UUID_OTHER%>'>其他娱乐</option>";
						buffer += "</select>&nbsp;";
						buffer += "<div style='font-size:11px;display:inline'><a href='javascript:editIntro(\"intro1_"+i+"_"+j+"\")' title='点击填写备注')'>注</a></div><br>";
						buffer += "<div id='intro1_"+i+"_"+j+"' style='display:none' submit='false'><br><textarea name='instance(BehaviourStandard["+num+"]).introduction' style='width:80px;height:50px'></textarea></div>";
						buffer += "<br>";
						flag[j]++;
						num++;
					}
					else {
						var info = data[1][i][1][j].split("|");

						buffer += "<td id='td_"+j+"_"+i+"' width='90' align='center' id='td_1_"+i+"_"+j+"' title='双击编辑记录' ondblclick='editContent(\"1_"+i+"\", \""+j+"\")'>";
						buffer += "<div id='show_1_"+i+"_"+j+"'>";
						buffer += info[2];
						if(info[3] != ""){
							buffer += "&nbsp;<div style='font-size:11px;display:inline;cursor:hand'><a title='"+info[3]+"')'>注</a></div>";
						}
						buffer += "</div>";
						buffer += "<div id='hide_1_"+i+"_"+j+"' submit='false' style='display:none'><br>";
						buffer += "<input type='hidden' name='instance(BehaviourStandard["+num+"]).uuid' value='"+info[0]+"' />";
						buffer += "<input type='hidden' name='instance(BehaviourStandard["+num+"]).employeeUuid' value='"+employeeInfo[0]+"' />";
						buffer += "<input type='hidden' name='instance(BehaviourStandard["+num+"]).checkDate' value='"+curWeek[j]+"' />";
						buffer += "<select name='instance(BehaviourStandard["+num+"]).typeUuid'>";
						buffer += "<option value='<%=Constants.BEHAVIOUR_STANDARD_UUID_NORMAL%>' ";
						if(info[1] == "<%=Constants.BEHAVIOUR_STANDARD_UUID_NORMAL%>"){
							buffer += "selected='selected'";
						}
						buffer += ">正常</option>";
						buffer += "<option value='<%=Constants.BEHAVIOUR_STANDARD_UUID_FROCK%>' ";
						if(info[1] == "<%=Constants.BEHAVIOUR_STANDARD_UUID_FROCK%>"){
							buffer += "selected='selected'";
						}
						buffer += ">工装</option>";
						buffer += "<option value='<%=Constants.BEHAVIOUR_STANDARD_UUID_CARD%>' ";
						if(info[1] == "<%=Constants.BEHAVIOUR_STANDARD_UUID_CARD%>"){
							buffer += "selected='selected'";
						}
						buffer += ">工牌</option>";
						buffer += "<option value='<%=Constants.BEHAVIOUR_STANDARD_UUID_HYGIENE%>' ";
						if(info[1] == "<%=Constants.BEHAVIOUR_STANDARD_UUID_HYGIENE%>"){
							buffer += "selected='selected'";
						}
						buffer += ">卫生</option>";
						buffer += "<option value='<%=Constants.BEHAVIOUR_STANDARD_UUID_MORNING_MEETING%>' ";
						if(info[1] == "<%=Constants.BEHAVIOUR_STANDARD_UUID_MORNING_MEETING%>"){
							buffer += "selected='selected'";
						}
						buffer += ">缺席晨会</option>";
						buffer += "<option value='<%=Constants.BEHAVIOUR_STANDARD_UUID_EVENING_MEETING%>' ";
						if(info[1] == "<%=Constants.BEHAVIOUR_STANDARD_UUID_EVENING_MEETING%>"){
							buffer += "selected='selected'";
						}
						buffer += ">缺席夕会</option>";
						buffer += "<option value='<%=Constants.BEHAVIOUR_STANDARD_UUID_GAUNT%>' ";
						if(info[1] == "<%=Constants.BEHAVIOUR_STANDARD_UUID_GAUNT%>"){
							buffer += "selected='selected'";
						}
						buffer += ">脱岗</option>";
						buffer += "<option value='<%=Constants.BEHAVIOUR_STANDARD_UUID_EATING%>' ";
						if(info[1] == "<%=Constants.BEHAVIOUR_STANDARD_UUID_EATING%>"){
							buffer += "selected='selected'";
						}
						buffer += ">吃东西</option>";
						buffer += "<option value='<%=Constants.BEHAVIOUR_STANDARD_UUID_MOVIE%>' ";
						if(info[1] == "<%=Constants.BEHAVIOUR_STANDARD_UUID_MOVIE%>"){
							buffer += "selected='selected'";
						}
						buffer += ">看电影</option>";
						buffer += "<option value='<%=Constants.BEHAVIOUR_STANDARD_UUID_SONG%>' ";
						if(info[1] == "<%=Constants.BEHAVIOUR_STANDARD_UUID_SONG%>"){
							buffer += "selected='selected'";
						}
						buffer += ">听歌</option>";
						buffer += "<option value='<%=Constants.BEHAVIOUR_STANDARD_UUID_SLEEPING%>' ";
						if(info[1] == "<%=Constants.BEHAVIOUR_STANDARD_UUID_SLEEPING%>"){
							buffer += "selected='selected'";
						}
						buffer += ">睡觉</option>";
						buffer += "<option value='<%=Constants.BEHAVIOUR_STANDARD_UUID_OTHER%>' ";
						if(info[1] == "<%=Constants.BEHAVIOUR_STANDARD_UUID_OTHER%>"){
							buffer += "selected='selected'";
						}
						buffer += ">其他娱乐</option>";
						buffer += "</select><br><br>";
						buffer += "<textarea name='instance(BehaviourStandard["+num+"]).introduction' style='width:75px;height:50px'>"+info[3]+"</textarea><br><br>";
						buffer += "</div>";

						num++;
					}
					
					buffer += "</td>";
				}
				buffer += "</tr>";

				buffer += "<th width='45px'>晚上</th>";
				for(var j=0; j<7; j++){
					flag[j] %= 3;
					if(data[1][i][2][j] == "none"){
						buffer += "<td id='td_"+j+"_"+i+"' width='90' align='center' title='不能创建未来的记录'>";
						buffer += "";
					}
					else if(data[1][i][2][j] == "null"){
						buffer += "<td id='td_"+j+"_"+i+"' width='90' align='center' title='创建记录'>";
						buffer += "<br>";
						buffer += "<input type='hidden' name='instance(BehaviourStandard["+num+"]).employeeUuid' value='"+employeeInfo[0]+"' />";
						buffer += "<input type='hidden' name='instance(BehaviourStandard["+num+"]).checkDate' value='"+curWeek[j]+"' />";
						buffer += "<input type='hidden' name='instance(BehaviourStandard["+num+"]).timesFlag' value='"+flag[j]+"' />";
						buffer += "<select name='instance(BehaviourStandard["+num+"]).typeUuid'>";
						buffer += "<option value='<%=Constants.BEHAVIOUR_STANDARD_UUID_NORMAL%>' selected='selected'>正常</option>";
						buffer += "<option value='<%=Constants.BEHAVIOUR_STANDARD_UUID_FROCK%>'>工装</option>";
						buffer += "<option value='<%=Constants.BEHAVIOUR_STANDARD_UUID_CARD%>'>工牌</option>";
						buffer += "<option value='<%=Constants.BEHAVIOUR_STANDARD_UUID_HYGIENE%>'>卫生</option>";
						buffer += "<option value='<%=Constants.BEHAVIOUR_STANDARD_UUID_MORNING_MEETING%>'>缺席晨会</option>";
						buffer += "<option value='<%=Constants.BEHAVIOUR_STANDARD_UUID_EVENING_MEETING%>'>缺席夕会</option>";
						buffer += "<option value='<%=Constants.BEHAVIOUR_STANDARD_UUID_GAUNT%>'>脱岗</option>";
						buffer += "<option value='<%=Constants.BEHAVIOUR_STANDARD_UUID_EATING%>'>吃东西</option>";
						buffer += "<option value='<%=Constants.BEHAVIOUR_STANDARD_UUID_MOVIE%>'>看电影</option>";
						buffer += "<option value='<%=Constants.BEHAVIOUR_STANDARD_UUID_SONG%>'>听歌</option>";
						buffer += "<option value='<%=Constants.BEHAVIOUR_STANDARD_UUID_SLEEPING%>'>睡觉</option>";
						buffer += "<option value='<%=Constants.BEHAVIOUR_STANDARD_UUID_OTHER%>'>其他娱乐</option>";
						buffer += "</select>&nbsp;";
						buffer += "<div style='font-size:11px;display:inline'><a href='javascript:editIntro(\"intro1_"+i+"_"+j+"\")' title='点击填写备注')'>注</a></div><br>";
						buffer += "<div id='intro1_"+i+"_"+j+"' style='display:none' submit='false'><br><textarea name='instance(BehaviourStandard["+num+"]).introduction' style='width:80px;height:50px'></textarea></div>";
						buffer += "<br>";
						flag[j]++;
						num++;
					}
					else {
						var info = data[1][i][2][j].split("|");

						buffer += "<td id='td_"+j+"_"+i+"' width='90' align='center' id='td_2_"+i+"_"+j+"' title='双击编辑记录' ondblclick='editContent(\"2_"+i+"\", \""+j+"\")'>";
						buffer += "<div id='show_2_"+i+"_"+j+"'>";
						buffer += info[2];
						if(info[3] != ""){
							buffer += "&nbsp;<div style='font-size:11px;display:inline;cursor:hand'><a title='"+info[3]+"')'>注</a></div>";
						}
						buffer += "</div>";
						buffer += "<div id='hide_2_"+i+"_"+j+"' submit='false' style='display:none'><br>";
						buffer += "<input type='hidden' name='instance(BehaviourStandard["+num+"]).uuid' value='"+info[0]+"' />";
						buffer += "<input type='hidden' name='instance(BehaviourStandard["+num+"]).employeeUuid' value='"+employeeInfo[0]+"' />";
						buffer += "<input type='hidden' name='instance(BehaviourStandard["+num+"]).checkDate' value='"+curWeek[j]+"' />";
						buffer += "<select name='instance(BehaviourStandard["+num+"]).typeUuid'>";
						buffer += "<option value='<%=Constants.BEHAVIOUR_STANDARD_UUID_NORMAL%>' ";
						if(info[1] == "<%=Constants.BEHAVIOUR_STANDARD_UUID_NORMAL%>"){
							buffer += "selected='selected'";
						}
						buffer += ">正常</option>";
						buffer += "<option value='<%=Constants.BEHAVIOUR_STANDARD_UUID_FROCK%>' ";
						if(info[1] == "<%=Constants.BEHAVIOUR_STANDARD_UUID_FROCK%>"){
							buffer += "selected='selected'";
						}
						buffer += ">工装</option>";
						buffer += "<option value='<%=Constants.BEHAVIOUR_STANDARD_UUID_CARD%>' ";
						if(info[1] == "<%=Constants.BEHAVIOUR_STANDARD_UUID_CARD%>"){
							buffer += "selected='selected'";
						}
						buffer += ">工牌</option>";
						buffer += "<option value='<%=Constants.BEHAVIOUR_STANDARD_UUID_HYGIENE%>' ";
						if(info[1] == "<%=Constants.BEHAVIOUR_STANDARD_UUID_HYGIENE%>"){
							buffer += "selected='selected'";
						}
						buffer += ">卫生</option>";
						buffer += "<option value='<%=Constants.BEHAVIOUR_STANDARD_UUID_MORNING_MEETING%>' ";
						if(info[1] == "<%=Constants.BEHAVIOUR_STANDARD_UUID_MORNING_MEETING%>"){
							buffer += "selected='selected'";
						}
						buffer += ">缺席晨会</option>";
						buffer += "<option value='<%=Constants.BEHAVIOUR_STANDARD_UUID_EVENING_MEETING%>' ";
						if(info[1] == "<%=Constants.BEHAVIOUR_STANDARD_UUID_EVENING_MEETING%>"){
							buffer += "selected='selected'";
						}
						buffer += ">缺席夕会</option>";
						buffer += "<option value='<%=Constants.BEHAVIOUR_STANDARD_UUID_GAUNT%>' ";
						if(info[1] == "<%=Constants.BEHAVIOUR_STANDARD_UUID_GAUNT%>"){
							buffer += "selected='selected'";
						}
						buffer += ">脱岗</option>";
						buffer += "<option value='<%=Constants.BEHAVIOUR_STANDARD_UUID_EATING%>' ";
						if(info[1] == "<%=Constants.BEHAVIOUR_STANDARD_UUID_EATING%>"){
							buffer += "selected='selected'";
						}
						buffer += ">吃东西</option>";
						buffer += "<option value='<%=Constants.BEHAVIOUR_STANDARD_UUID_MOVIE%>' ";
						if(info[1] == "<%=Constants.BEHAVIOUR_STANDARD_UUID_MOVIE%>"){
							buffer += "selected='selected'";
						}
						buffer += ">看电影</option>";
						buffer += "<option value='<%=Constants.BEHAVIOUR_STANDARD_UUID_SONG%>' ";
						if(info[1] == "<%=Constants.BEHAVIOUR_STANDARD_UUID_SONG%>"){
							buffer += "selected='selected'";
						}
						buffer += ">听歌</option>";
						buffer += "<option value='<%=Constants.BEHAVIOUR_STANDARD_UUID_SLEEPING%>' ";
						if(info[1] == "<%=Constants.BEHAVIOUR_STANDARD_UUID_SLEEPING%>"){
							buffer += "selected='selected'";
						}
						buffer += ">睡觉</option>";
						buffer += "<option value='<%=Constants.BEHAVIOUR_STANDARD_UUID_OTHER%>' ";
						if(info[1] == "<%=Constants.BEHAVIOUR_STANDARD_UUID_OTHER%>"){
							buffer += "selected='selected'";
						}
						buffer += ">其他娱乐</option>";
						buffer += "</select><br><br>";
						buffer += "<textarea name='instance(BehaviourStandard["+num+"]).introduction' style='width:75px;height:50px'>"+info[3]+"</textarea><br><br>";
						buffer += "</div>";

						num++;
					}
					
					buffer += "</td>";
				}
				buffer += "</tr>";
			}
			buffer += "</table>";
			buffer += "</form><br>";
			buffer += "<a href='javascript:createInstance(\"formA\")'>";
			buffer += "<img src='"+cp+"/images/button/b_confirm_2.gif' />";
			buffer += "</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
			buffer += "<a href='"+cp+"/pages/resource/campus/manage/campus/human/behavior/record/query_behavior_record.html' >";
			buffer += "<img src='"+cp+"/images/button/b_cancel.gif' />";
			buffer += "</a>";

			$("#result").html(buffer);
		}, "json");
	}

	$("[id^='td_']").each(function(){
		$(this).css("background-color", "#FFFFFF");
	});
	$("[id^='td_"+dateDay+"']").each(function(){
		$(this).css("background-color", "#EFEFEF");
	});
	if(todayDate >= curSunday && todayDate <= curSaturday){
		$("[id^='td_"+todayDay+"']").each(function(){
			$(this).css("background-color", "#FFFFCB");
		});
	}
}
function getWeekDay(date, n){
	var dayOfWeek = date.getDay();
	var resultYear = date.getYear();
	var resultDate = new Date(resultYear, date.getMonth(), date.getDate() + n - dayOfWeek);
	var resultMonth = resultDate.getMonth() + 1 < 10 ? "0" + (resultDate.getMonth() + 1) : resultDate.getMonth() + 1;
	var resultDay = resultDate.getDate() < 10 ? "0" + resultDate.getDate() : resultDate.getDate();
	return resultYear + "-" + resultMonth + "-" + resultDay;
}
function changeWeek(n){
	var newDate = new Date();
	if(n != 0){
		var paramDateStr = $("#hiddenDate").val();
		var paramYear = parseInt(paramDateStr.substr(0, 4), 10);
		var paramMonth = parseInt(paramDateStr.substr(5, 2), 10) - 1;
		var paramDay = parseInt(paramDateStr.substr(8, 2), 10);

		newDate = new Date(paramYear, paramMonth, paramDay + 7 * n);
	}

	var newYear = newDate.getYear();
	var newMonth = newDate.getMonth() + 1;
	if(newMonth < 10){
		newMonth = "0" + newMonth;
	}
	var newDay = newDate.getDate();
	if(newDay < 10){
		newDay = "0" + newDay;
	}
	var newDateStr = newYear + "-" + newMonth + "-" + newDay;

	$("#hiddenDate").val(newDateStr);
	$(".DateTimeQuery").dateTimeQuery("updateText", newDate.getTime());
}
function createInstance(elementId){
	if(confirm("确认创建？")){
		var param=Submit.excute(elementId);
		$.post(cp+"/ajaxs/resource/campus/manage/campus/human/behavior/record/create_behavior_record.html",param,function(){
			location.href = cp+"/pages/resource/campus/manage/campus/human/behavior/record/query_behavior_record.html";
		})
	}
}
function editContent(i, j){
	if($("#show_"+i+"_"+j).css("display")=="block"){
		$("#td_"+i+"_"+j).attr("title", "双击取消编辑");
		$("#show_"+i+"_"+j).css("display", "none");
		$("#hide_"+i+"_"+j).css("display", "block");
		$("#hide_"+i+"_"+j).attr("submit", "true");
	}
	else{
		$("#td_"+i+"_"+j).attr("title", "双击编辑记录");
		$("#show_"+i+"_"+j).css("display", "block");
		$("#hide_"+i+"_"+j).css("display", "none");
		$("#hide_"+i+"_"+j).attr("submit", "false");
	}
}
function editIntro(divId){
	if($("#"+divId).css("display")=="none"){
		$("#"+divId).css("display", "block");
		$("#"+divId).attr("submit", "true");
	}
	else {
		$("#"+divId).css("display", "none");
		$("#"+divId).attr("submit", "false");
	}
}
</script>
<div style="font-family:黑体;font-size:20px;">&nbsp;行 为 规 范</div>
<br><br>
<div align="center">
	<input id="hiddenDate" class="DateTimeQuery" execute="execute" />
</div>
<br>
<input type="hidden" id="curDate" />
<div style="color:red"><s:property value="#session.LOGIN_EMPLOYEE.campus.description" /></div>
<div id="result" class="bigResultCon" style="width:720px"></div>
</body>
</html>
