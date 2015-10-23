<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ page import="com.ito.edito.util.Constants" %>
<html>
<head>
	<title>行为规范总览</title>
</head>
<body>
<form id="form" name="form" method="post">
<input type="hidden" name="uuid" />
<input type="hidden" name="resultCode" />
</form>
<script>
var tempDate = new Date();
var year = tempDate.getYear();
var month = tempDate.getMonth()+1 > 10 ? (tempDate.getMonth()+1) : "0" + (tempDate.getMonth()+1);
var day = tempDate.getDate() > 10 ? (tempDate.getDate()) : "0" + (tempDate.getDate());
var todayDay = year+"-"+month+"-"+day;

var rowLen;
var columnLen;
var tempTab;

$(document).ready(function(){
	execute();
});

function execute() {
	$.post(cp+"/ajaxs/resource/campus/manage/campus/human/work/inquiry/query_attedance_workrecord_campus.html", {}, function(data){
		var buffer = "";
		if(data.length > 0) {
			
			for(var i=0; i<data.length; i++) {
				rowLen = new Array(data.length);
				columnLen = new Array(data.length);
				tempTab = new Array(data.length);
				buffer += "<div id='campusDiv' style='width:750px'>";
				buffer += "<div style='width:750px'>";
				buffer += "<div style='display:inline;font-size:22px;cursor:hand' onclick='toggleContent(\""+todayDay+"\",\""+data[i][1]+"\", \""+i+"\")'>";
				buffer += "<a title='点击查看详细信息'>";
				buffer += data[i][0];
				buffer += "</a>";
				buffer += "</div>";
				buffer += "</div>";
				buffer += "<div id='showInstance_"+i+"'></div>";
				buffer += "</div>";
				buffer += "<br>";
			}
			buffer += "<div id='showDiv' style='display:none;float:right'></div>";
		}
		else {
			buffer += "<font color='red'>暂无分校信息！</font>";
		}
		$("#result").html(buffer);
	}, "json");
}

function toggleContent(times, campusUuid, num){
	var tbId = "showInstance_"+num;
	var id = tbId + "_div";
	if($("#"+id).html() == null){
		showContent(times, campusUuid, tbId, num);
	}
	if($("#"+id).css("display") == "none"){
		$("#"+id).css("display", "inline");
	}
	else {
		$("#"+id).css("display", "none");
	}
}
function showContent(time, campusUuid, id, num) {
	$.post(cp+"/ajaxs/resource/campus/manage/campus/human/behavior/inquiry/query_behavior_inquiry.html", {data:time, campusUuid:campusUuid}, function(data){
		var buffer = "";
		buffer += "<div id='"+id+"_div' style='overflow:hidden;width:750px' value='0'>";

		buffer += "<div style = 'width:750px'>";
		buffer += "<table width = '750px' cellpading = '0' cellspacing = '0' border = '0' class = 'schedule2'>";
		buffer += "<tr>";
		buffer += "<td style = 'background-color:#FFFFCB'>";
		buffer += "&nbsp;<img src = '"+cp+"/images/mainResource/arrow_left.gif' style='cursor:hand' onclick = 'javascript:changeMonth(-1, \""+campusUuid+"\", \""+id+"\", \""+num+"\", \""+time+"\");' title = '前一月'>";
		buffer += "&nbsp;<img src = '"+cp+"/images/mainResource/arrow_right.gif' style='cursor:hand' onclick = 'javascript:changeMonth(1, \""+campusUuid+"\", \""+id+"\", \""+num+"\", \""+time+"\");' title = '后一月'>";
		buffer += "&nbsp;" + time.substring(0, 4) + "-" + time.substring(5, 7) + "-01" + " - " + time.substring(0, 4) + "-" + time.substring(5, 7) + "-" + data[1][0][0].length;
		buffer += "&nbsp;&nbsp;&nbsp;<a href = 'javascript:changeMonth(0, \""+campusUuid+"\", \""+id+"\", \""+num+"\", \""+time+"\")'>本月</a>";
		buffer += "</td>";
		buffer += "</tr>";
		buffer += "</table>";
		buffer += "</div>";

		buffer += "<div id='Div_Left"+num+"' style='width:149;overflow-y:none;float:left'>";
		buffer += "<table width='150px' border='0' cellpadding='0' cellspacing='0' class='schedule2'>";
		
		rowLen[num] = (data[0].length)*3 +1;
		columnLen[num] = data[1][0][0].length + 2;
		tempTab[num] = new Array(rowLen[num]);
		for(var l=0; l<rowLen[num]; l++) {
			tempTab[num][l] = new Array(columnLen[num]);
		}

		buffer += "<tr><th colspan='2'></th></tr>";
		tempTab[num][0][0] = "";
		tempTab[num][0][1] = "";
		for(var j=0; j < data[0].length; j++) {
			buffer += "<tr>";
			buffer += "<th align='center' width='91' rowspan='3'>"+ data[0][j]+"</th>";
			buffer += "<th width='58px'>上午</th>";
			buffer += "</tr>";
			buffer += "<tr>";
			buffer += "<th>下午</th>";
			buffer += "</tr>";
			buffer += "<tr>";
			buffer += "<th>晚上</th>";
			buffer += "</tr>";
			tempTab[num][j * 3 + 1][0] = data[0][j];
			tempTab[num][j * 3 + 1][1] = "上午";
			tempTab[num][j * 3 + 2][1] = "下午";
			tempTab[num][j * 3 + 2][0] = "";
			tempTab[num][j * 3 + 3][1] = "晚上";
			tempTab[num][j * 3 + 3][0] = "";
		}

		buffer += "</table>";

		buffer += "<div style='float:left'>";
		buffer += "<table cellpading = '0' cellspacing = '0' border = '0'>";
		buffer += "<tr><th height='15px' width='147' style='background-color:#EFEFEF;border-style: solid;border-color: #CCCCCC;border-width: 0px 0px 0px 1px;'>&nbsp;</th></tr>";
		buffer += "</table>";
		buffer += "</div>";
		buffer += "</div>";

		buffer += "<div id='Div_Right"+num+"' style='width:599px;overflow-x:auto;float:right;border-right:1px solid #EFEFEF'>";
		buffer += "<table width='"+(data[1][0][0].length * 100 )+"px' border='0' cellpadding='0' cellspacing='0' class='schedule2'>";
		buffer += "<tr>";
		for(var k = 0; k < data[1][0][0].length; k++) {
			if(k < 9){
				buffer += "<th align='center' width='100px'>"+ time.substring(0, 4) +"-"+ time.substring(5, 7) +"-0"+ (k+1)+"</th>";
				tempTab[num][0][k+2] = time.substring(0, 4) +"-"+ time.substring(5, 7) +"-0"+ (k+1);
			}else {
				buffer += "<th align='center' width='100px'>"+ time.substring(0, 4) +"-"+ time.substring(5, 7) +"-"+ (k+1)+"</th>";
				tempTab[num][0][k+2] = time.substring(0, 4) +"-"+ time.substring(5, 7) +"-"+ (k+1);
			}
		}
		buffer += "</tr>";
		for(var j=0; j < data[1].length; j++) {
			for(var k = 0; k < data[1][j].length; k++) {
				buffer += "<tr>";
				for(var z = 0; z<data[1][j][k].length; z++){
					if(data[1][j][k][z] != "none" && data[1][j][k][z] != "null"){
						buffer +="<td align='center' width='100px'>"+ data[1][j][k][z]+"</td>";
						if(data[1][j][k][z].length > 10){
							tempTab[num][j*3 + k + 1][z+2] = (data[1][j][k][z]).substring(18, 20);
						}
						else {
							tempTab[num][j*3 + k + 1][z+2] = data[1][j][k][z];
						}
					}
					else {
						buffer +="<td align='center' width='100px'></td>";
						tempTab[num][j*3 + k + 1][z+2] = "";
					}
				}
				buffer += "</tr>";
			}
		}
		buffer += "</table>";
		buffer += "</div>";
		buffer += "<a href='javascript:exportToExcel(\""+num+"\")'><img id='exportBtn' src='<%=request.getContextPath()%>/images/button/b_export_excel.gif' /></a>";
		buffer += "</div>";

		$("#"+id).html(buffer);
		$("#"+id).css("display", "inline");

	}, "json");
}

function changeMonth(n, campusUuid, id, num, time){
	var modifyYear = time.substring(0, 4);
	var modifyMonth = time.substring(5, 7);
	var modifyDay = time.substring(8, 10);

	if(n > 0){
		if(modifyMonth == 12)
		{
			modifyMonth = "01";
			modifyYear++;
		}else{
			modifyMonth++;
			if(modifyMonth < 10){
				modifyMonth = "0"+modifyMonth;
			}
		}
	}else if(n < 0){
		if(modifyMonth == "01"){
			modifyMonth = 12;
			modifyYear--;
		}else{
			modifyMonth--;
			if(modifyMonth < 10){
				modifyMonth = "0"+modifyMonth;
			}
		}
	}else{
		modifyYear = todayDay.substring(0,4);
		modifyMonth = todayDay.substring(5,7);
	}
	var modifyDate = modifyYear + "-" + modifyMonth + "-" + modifyDay;
	showContent(modifyDate, campusUuid, id, num);
}
function exportToExcel(numF) {
	var oXL = new ActiveXObject("Excel.Application"); 
	var oWB = oXL.Workbooks.Add();
	var oSheet = oWB.ActiveSheet;
	oSheet.Cells(1, 1).value = "";
	for (var i = 0; i < rowLen[numF]; i++) {
		for (var j = 0; j < columnLen[numF]; j++) {
			oSheet.Cells(i + 1, j + 1).value = tempTab[numF][i][j];
		}
	}
	oXL.Visible = true;
}
</script>
<div style="font-family:黑体;font-size:20px;">&nbsp;行 为 规 范 总 览</div>
<br><br><br>
<div id="result" class="bigResultCon" style="width:720px"></div>
<br><br>
</body>
</html>
