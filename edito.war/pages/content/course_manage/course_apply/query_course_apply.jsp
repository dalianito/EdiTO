<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.ito.edito.util.Constants"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
	<title>排课申请</title>
<style type="text/css">
	.surfacedBox {
		z-index:1;
		position:fixed;
		left:45%;
		top:150px;
		margin-left:-210px;
	}
	.surfacedBoxT {
		z-index:1;
		position:fixed;
		left:45%;
		top:220px;
		margin-left:-210px;
	}
	pre {
		white-space: pre-wrap; 
		white-space: -moz-pre-wrap; 
		white-space: -pre-wrap; 
		white-space: -o-pre-wrap; 
		Word-wrap: break-word; 
	}
</style>
</head>
<body>
<form id="form" name="form" method="post">
<input type="hidden" name="uuid" />
<input type="hidden" name="resultCode" />
</form>
<script>
Validation.init("content/course_manage/course_apply/create_arrange_class.xml");
var isIe=(document.all)?true:false;
function nextToSecStep(elementId){
	if($("#courseNameB").html() == "" || $("#courseNameB").html().length == 0) {
		alert("请选择上课的课程！");
		return;
	}
	if(Validation.excuteValidate(elementId)) {
		$("#firstStep").css("display","none");
		var campusNmae = $("#campusUuid").text();
		$("#arrangeClsCampusSS").html(campusNmae);
		var clsNo = $("#arrangeClsNoFS").val();
		$("#arrangeClsNoSS").html(clsNo);

		var clsType = $("#arrangeClsTypeFS").text();
		$("#arrangeClsTypeLS").html(clsType);
		$("#arrangeClsNoLS").html(clsNo);
		$("#arrangeClsCampusLS").html(campusNmae);
		var clsNotes = $("#arrangeClsNotesFS").val();
		$("#arrangeClsNotesLS").html(clsNotes);

		$("#secondStep").css("display","inline");
	}
}
function lastToFirstStep(){
		$("#secondStep").css("display","none");
		$("#firstStep").css("display","inline");
}
function nextToThirdStep(){
	if(Validation.excuteValidate("secondStep")) {
		if($("#timePositionTeacher").children().length == 0) {
			alert("请选择上课时间、地点及授课教师！");
			return;
		}
		var children = $("#timePositionTeacher").children();
		for(var i=0; i<children.length; i++){
			if(children.eq(i).find("div[id^='xzsj_']").html() == "选择时间" ) {
				alert("请选择上课时间");
				return;
			}
		}
		$("#secondStep").css("display","none");
		var clsActualHour = $("#clsActualHourSS").val();
		$("#clsActualHourLS").html(clsActualHour);
		var clsActualCost = $("#clsActualCostSS").val();
		$("#clsActualCostLS").html(clsActualCost);
		var maxNoP = $("#maxNoPSS").val();
		$("#maxNoPLS").html(maxNoP);

		var children = $("#timePositionTeacher").children();
		var buffer = "<div style='width:840px;overflow:left-none'>";
		buffer += "<table width='840px' border='0' cellpadding='0' cellspacing='0' class='InputPanel'>";
		buffer += "<tr><th colspan='4'>上课时间、地点及授课教师信息</th></tr>";
		buffer += "<tr><th style='width:50px;text-align:center'>序号</th>";
		buffer += "<th style='width:450px;text-align:center'>时间信息</th>";
		buffer += "<th style='width:200px;text-align:center'>教室信息</th>";
		buffer += "<th style='text-align:center'>教师信息</th></tr>";
		for(var i=0; i<children.length; i++){
			var teacherUuid = children.eq(i).find("input[id^='teacherUuid_']").val();
			buffer += "<tr><td style='text-align:center'>";
			buffer += (i+1);
			buffer += "</td><td style='text-align:center'>";
			buffer += children.eq(i).find("div[id^='xzsj_']").html();
			buffer += "</td><td style='text-align:center'>";
			if(children.eq(i).find("div[id^='xzjs_']").html() == "选择教室"){
				buffer += "暂未选择教室";
			}
			else {
				buffer += children.eq(i).find("div[id^='xzjs_']").html();
			}
			buffer += "</td><td style='text-align:center'>";
			if(children.eq(i).find("div[id^='xzls_']").html() == "选择教师") {
				buffer += "暂未选择教师";
				}
			else {
				var teacherDescription = children.eq(i).find("div[id^='xzls_']").html();
				buffer += "<a id='operation_"+i+"' href='javascript:toggleContent(\""+teacherDescription+"\",\""+teacherUuid+"\", \""+i+"\")'>";
				buffer += teacherDescription;
				buffer += "<img src='<%=request.getContextPath()%>/images/button/b_down_view.gif' /></a>";
			}
			buffer += "</td></tr><tbody id='teacherContent_"+i+"'></tbody>";
		}
		buffer += "</table></div>";
		$("#timePositionTeacherLS").html(buffer);

		$("#thirdStep").css("display","inline");
	}
}

function toggleContent(Desc,uuid, num){
	var id = "teacherContent_"+num;
	if($("#"+id+"_div").height() == null || $("#"+id+"_div").height() == 0){
		showContent(uuid, id);
		$("#operation_"+num).text(Desc );
		$("#operation_"+num).append('<img src="<%=request.getContextPath()%>/images/button/b_up_close.gif" />');
	}
	else {
		$("#"+id).css("display", "none");
		$("#operation_"+num).text(Desc);
		$("#operation_"+num).append('<img src="<%=request.getContextPath()%>/images/button/b_down_view.gif" />');
	}
}
function showContent(uuid, id){
	$.post(cp+"/ajaxs/content/course/manage/course/apply/query_teacher_infos.html", {uuid:uuid}, function(data){
		var buffer = "<tr><td colspan='4' ><div id='"+id+"_div' style='overflow:hidden' value='0'>";
		buffer += "<br>";
		buffer += "<table style='width:720px;margin:0px auto;' border='0' cellpadding='3' cellspacing='0' class='InputPanel'>";
		buffer += "<tr><th width='100px'>员工号</th>";
		buffer += "<td style='width:140px;text-align:center'>"+data[0][1]+"</td>";
		buffer += "<th width='100px'>教师姓名</th>";
		buffer += "<td style='width:140px;text-align:center'>"+data[0][2]+"</td>";
		buffer += "<th width='100px'>校区</th>";
		buffer += "<td style='text-align:center'>"+data[0][4]+"</td></tr>";
		buffer += "<tr><th>在职状态</th>";
		buffer += "<td colspan='5' style='text-align:center'>"+data[0][3]+"</td></tr>";
		buffer += "<tr><th>目前授课班级</th>";
		buffer += "<td colspan='5' style='text-align:center'>"+data[0][5]+"</td></tr>";
		buffer += "</table>";
		buffer += "<br>";
		buffer += "</div></td></tr>";

		$("#"+id).html(buffer);
		$("#"+id).css("display", "inline");
		document.getElementById(id).style.display = "";
		$("#"+id).val($("#"+id).height());
		$("label").filter(".BaseTree").basetree({});
	}, "json");
}
function lastToSecondStep(){
	$("#thirdStep").css("display","none");
	$("#secondStep").css("display","inline");
}
function showOrHideSurfacedBox(targetDiv, num){
	if($("#"+targetDiv).css("display") == "none"){
		$("#"+targetDiv).css("display", "block");
		var bWidth=parseInt(document.documentElement.scrollWidth);
		var bHeight=parseInt(document.documentElement.scrollHeight);
		var back=document.createElement("div");
		back.id="back";
		var styleStr="top:0px;left:0px;position:absolute;background:#666;width:"+bWidth+"px;height:"+bHeight+"px;";
		styleStr+=(isIe)?"filter:alpha(opacity=0);":"opacity:0;";
		back.style.cssText=styleStr;
		document.body.appendChild(back);
		showBackground(back,50);
	}
	else{
		$("#"+targetDiv).css("display", "none");
		if(document.getElementById('back')!=null) {
			document.getElementById('back').parentNode.removeChild(document.getElementById('back'));
		}
	}
}
function getClassroom(num){
	$("#roomContent").empty();
	var	flag = true;
	var campusUuid = $("#campusUuid").val();
	var attendClsTP = $("input[name='instance(ArrangeClassTime["+num+"]).attendClsTP']:checked").val();
	var attendClsFreq = $("input[name='instance(ArrangeClassTime["+num+"]).attendClsFreqTP']:checked").val();
	var attendClsFreqP = "";
	if(attendClsFreq == "attendClsFreqBWK") {
		attendClsFreqP = $("input[name='instance(ArrangeClassTime["+num+"]).attendClsFreqBWK']").val();
	}
	else {
		attendClsFreqP = $("input[name='instance(ArrangeClassTime["+num+"]).attendClsFreqBMon']").val();
	}
	var clsMon = $("input[name='instance(ArrangeClassTime["+num+"]).attendClsOnMon']:checked").val();
	var clsTues = $("input[name='instance(ArrangeClassTime["+num+"]).attendClsOnTues']:checked").val();
	var clsWeb = $("input[name='instance(ArrangeClassTime["+num+"]).attendClsOnWeb']:checked").val();
	var clsThurs = $("input[name='instance(ArrangeClassTime["+num+"]).attendClsOnThurs']:checked").val();
	var clsFri = $("input[name='instance(ArrangeClassTime["+num+"]).attendClsOnFri']:checked").val();
	var clsSat = $("input[name='instance(ArrangeClassTime["+num+"]).attendClsOnSat']:checked").val();
	var clsSun = $("input[name='instance(ArrangeClassTime["+num+"]).attendClsOnSun']:checked").val();
	var clsBeginDate =  $("input[name='instance(ArrangeClassTime["+num+"]).clsBeginDate']").val();
	var clsEndDate= $("input[name='instance(ArrangeClassTime["+num+"]).clsEndDateTP']:checked").val();
	var clsEndTimes="";
	if(clsEndDate == "clsEndDate") {
		clsEndTimes = $("input[name='instance(ArrangeClassTime["+num+"]).clsEndDate']").val();
	}
	else {
		clsEndTimes = $("input[name='instance(ArrangeClassTime["+num+"]).clsEndTimes']").val();
		var tempTime = new Date(clsBeginDate);
		tempTime.setDate(tempTime.getDate() + (clsEndTimes * 7));
		var year = tempTime.getFullYear();
	    var month = tempTime.getMonth() + 1;
	    var day = tempTime.getDate();
		clsEndTimes = year + "-" + (month < 10 ? "0" + month : month) + "-" + (day < 10 ? "0" + day : day);
	}
	var clsStartTimeH = $("input[name='instance(ArrangeClassTime["+num+"]).clsStartTimeH']").val();
	var clsStartTimeM = $("input[name='instance(ArrangeClassTime["+num+"]).clsStartTimeM']").val();
	var clsFinishTimeH = $("input[name='instance(ArrangeClassTime["+num+"]).clsFinishTimeH']").val();
	var clsFinishTimeM = $("input[name='instance(ArrangeClassTime["+num+"]).clsFinishTimeM']").val();
	if(clsStartTimeH == "") {
		alert("请先选择时间");
		return;
	}

	$.ajax({
        url : cp+"/ajaxs/content/course/manage/course/apply/query_classroom_info.html",
        data:{campusUuid:campusUuid,
        	attendClsTP:attendClsTP,
        	attendClsFreq:attendClsFreq,
        	attendClsFreqP:attendClsFreqP,
        	clsMon:clsMon,
        	clsTues:clsTues,
        	clsWeb:clsWeb,
        	clsThurs:clsThurs,
        	clsFri:clsFri,
        	clsSat:clsSat,
        	clsSun:clsSun,
        	clsBeginDate:clsBeginDate,
        	clsEndDate:clsEndDate,
        	clsEndTimes:clsEndTimes,
        	clsStartTimeH:clsStartTimeH,
        	clsStartTimeM:clsStartTimeM,
        	clsFinishTimeH:clsFinishTimeH,
        	clsFinishTimeM:clsFinishTimeM
        },
        cache : false, 
        async : false,
        type : "POST",
        dataType : 'json',
        success : function (data){
            if(data.length == 0){
				alert("暂无可用教室");
				flag = false;
            }
            else {
	        	for(var i=0; i<data.length; i++){
	    			var div = $("<div style='width:196px;height:196px;float:left'></div>");
	    			div.css("border","1px solid #000");
	    			div.css("margin","6px 6px");
	    			var str = "";
	    			if(data[i][5] == "可用") {
	    				str += "<div style='text-align:center'><font style='font-family:黑体;font-size:15px'>可用</font></div>";
		    		}
	    			else {
	    				str += "<div style='text-align:center'><font style='font-family:黑体;font-size:15px;color:red'>不可用</font></div>";
		    		}
	    			var roomDescription = data[i][1]+"("+data[i][2]+"人)["+data[i][4]+"]";
	    			str += "<div style='text-align:center'><font style='font-family:黑体;font-size:15px'>"+data[i][1]+"("+data[i][2]+"人)</font></div>";
	    			str += "<div style='text-align:center'><font style='font-family:黑体;font-size:15px'>"+data[i][4]+"</font></div>";
	    			str += "<div style='width:144px;height:75px;word-break:break-all;margin:0px 4px'><font style='font-family:黑体;font-size:15px'>&nbsp;&nbsp;"+data[i][3]+"</font></div>";
	    			str += "<br>"
	    			str += "<div style='text-align:center'><input type='button' style='width:48px;height:24px' onclick='javascript:selectRoom(\""+data[i][0]+"\",\""+roomDescription+"\",\""+num+"\")' value='选择' /></div>";
	    			div.append(str);
	    			$("#roomContent").append(div);
	    		}
            }
        }
    });
    if(flag) {
		$("#ChooseClsRm").css("display","block");
		var bWidth=parseInt(document.documentElement.scrollWidth);
		var bHeight=parseInt(document.documentElement.scrollHeight);
		var back=document.createElement("div");
		back.id="back";
		var styleStr="top:0px;left:0px;position:absolute;background:#666;width:"+bWidth+"px;height:"+bHeight+"px;";
		styleStr+=(isIe)?"filter:alpha(opacity=0);":"opacity:0;";
		back.style.cssText=styleStr;
		document.body.appendChild(back);
		showBackground(back,50);
    }
}
function getTeacher(num){
	$("#teacherContent").empty();
	var	flag = true;
	var courseUuid = $("input[name='courseUuid']").val();
	var attendClsTP = $("input[name='instance(ArrangeClassTime["+num+"]).attendClsTP']:checked").val();
	var attendClsFreq = $("input[name='instance(ArrangeClassTime["+num+"]).attendClsFreqTP']:checked").val();
	var attendClsFreqP = "";
	if(attendClsFreq == "attendClsFreqBWK") {
		attendClsFreqP = $("input[name='instance(ArrangeClassTime["+num+"]).attendClsFreqBWK']").val();
	}
	else {
		attendClsFreqP = $("input[name='instance(ArrangeClassTime["+num+"]).attendClsFreqBMon']").val();
	}
	var clsMon = $("input[name='instance(ArrangeClassTime["+num+"]).attendClsOnMon']:checked").val();
	var clsTues = $("input[name='instance(ArrangeClassTime["+num+"]).attendClsOnTues']:checked").val();
	var clsWeb = $("input[name='instance(ArrangeClassTime["+num+"]).attendClsOnWeb']:checked").val();
	var clsThurs = $("input[name='instance(ArrangeClassTime["+num+"]).attendClsOnThurs']:checked").val();
	var clsFri = $("input[name='instance(ArrangeClassTime["+num+"]).attendClsOnFri']:checked").val();
	var clsSat = $("input[name='instance(ArrangeClassTime["+num+"]).attendClsOnSat']:checked").val();
	var clsSun = $("input[name='instance(ArrangeClassTime["+num+"]).attendClsOnSun']:checked").val();
	var clsBeginDate =  $("input[name='instance(ArrangeClassTime["+num+"]).clsBeginDate']").val();
	var clsEndDate= $("input[name='instance(ArrangeClassTime["+num+"]).clsEndDateTP']:checked").val();
	var clsEndTimes="";
	if(clsEndDate == "clsEndDate") {
		clsEndTimes = $("input[name='instance(ArrangeClassTime["+num+"]).clsEndDate']").val();
	}
	else {
		clsEndTimes = $("input[name='instance(ArrangeClassTime["+num+"]).clsEndTimes']").val();
		var tempTime = new Date(clsBeginDate);
		tempTime.setDate(tempTime.getDate() + (clsEndTimes * 7));
		var year = tempTime.getFullYear();
	    var month = tempTime.getMonth() + 1;
	    var day = tempTime.getDate();
		clsEndTimes = year + "-" + (month < 10 ? "0" + month : month) + "-" + (day < 10 ? "0" + day : day);
	}
	var clsStartTimeH = $("input[name='instance(ArrangeClassTime["+num+"]).clsStartTimeH']").val();
	var clsStartTimeM = $("input[name='instance(ArrangeClassTime["+num+"]).clsStartTimeM']").val();
	var clsFinishTimeH = $("input[name='instance(ArrangeClassTime["+num+"]).clsFinishTimeH']").val();
	var clsFinishTimeM = $("input[name='instance(ArrangeClassTime["+num+"]).clsFinishTimeM']").val();
	$.ajax({
        url : cp+"/ajaxs/content/course/manage/course/apply/query_teacher_info.html",
        data:{courseUuid:courseUuid,
        	attendClsTP:attendClsTP,
        	attendClsFreq:attendClsFreq,
        	attendClsFreqP:attendClsFreqP,
        	clsMon:clsMon,
        	clsTues:clsTues,
        	clsWeb:clsWeb,
        	clsThurs:clsThurs,
        	clsFri:clsFri,
        	clsSat:clsSat,
        	clsSun:clsSun,
        	clsBeginDate:clsBeginDate,
        	clsEndDate:clsEndDate,
        	clsEndTimes:clsEndTimes,
        	clsStartTimeH:clsStartTimeH,
        	clsStartTimeM:clsStartTimeM,
        	clsFinishTimeH:clsFinishTimeH,
        	clsFinishTimeM:clsFinishTimeM
        },
        cache : false, 
        async : false,
        type : "POST",
        dataType : 'json',
        success : function (data){
        	if(data.length == 0){
				alert("暂无可用教师");
				flag = false;
            }
        	else {
	        	var div = $("<div style='width:560px;text-align:center' class='resultTableDiv'></div>");
	    		var buffer = "<table style='width:555px' border='0' cellpadding='0' cellspacing='0' class='InfoListPanel_color'>";
	    		buffer += "<tr><th width='65'>员工号</th><th width='85'>教师姓名</th><th width='80'>在职状态</th><th width='120'>校区</th><th width='120'>时间是否冲突</th><th width='85'>操作</th></tr>";
	    		for(var i=0; i<data.length; i++){
	    			if(i%2==0){
	    				buffer += "<tr class='tr1'>";
	    			}
	    			else {
	    				buffer += "<tr class='tr2'>";
	    			}
	    			buffer += "<td align='center'>"+data[i][1]+"</td>";
	    			buffer += "<td align='center'>"+data[i][2]+"</td>";
	    			buffer += "<td align='center'>"+data[i][3]+"</td>";
	    			buffer += "<td align='center'>"+data[i][4]+"</td>";
	    			if(data[i][5] == "冲突") {
	    				buffer += "<td align='center'><font color='red'>是</font></td>";
		    		}
	    			else {
	    				buffer += "<td align='center'>否</td>";
		    		}
	    			
	    			buffer += "<td align='center'><a href='javascript:chooseTeacher(\""+data[i][0]+"\",\""+num+"\",\""+data[i][2]+"\",\""+data[i][3]+"\")'>选择</a>&nbsp;";
	    			buffer += "<a href='javascript:showInstance(\""+data[i][0]+"\",\"\",\"/views/content/course/manage/course/apply/view_teacher_info.html\",600,700)'>查看</a>";
	    			buffer += "</td>";
	    			buffer += "</tr>";
	    		}
	    		buffer += "</table>";
	    		div.append(buffer);
	    		$("#teacherContent").append(div);
        	}
        }
    });
	if(flag) {
		$("#ChooseClsTeacher").css("display","block");
		var bWidth=parseInt(document.documentElement.scrollWidth);
		var bHeight=parseInt(document.documentElement.scrollHeight);
		var back=document.createElement("div");
		back.id="back";
		var styleStr="top:0px;left:0px;position:absolute;background:#666;width:"+bWidth+"px;height:"+bHeight+"px;";
		styleStr+=(isIe)?"filter:alpha(opacity=0);":"opacity:0;";
		back.style.cssText=styleStr;
		document.body.appendChild(back);
		showBackground(back,50);
	}
}
function chooseTeacher(teacherUuid, num, tacherName, teacherType) {
	
	showOrHideSurfacedBox("ChooseClsTeacher");
	$("#teacherUuid_"+num).val(teacherUuid);
	$("#xzls_" + num).html(tacherName + "（"+teacherType+"）");
}
function selectRoom(roomUuid, roomDescp, num) {
	showOrHideSurfacedBox("ChooseClsRm");
	$("#xzjs_" + num).html(roomDescp);
	$("input[name='instance(TimePositionTeacherInfo["+num+"]).arrangeRmUuid']").val(roomUuid);
}
function selectTime(timeDiv, num) {
	if($("input[week='week_"+num+"']:checked").length == 0) {
		alert("请选择每周在哪天上课！");
		return;
	}
	else if($("input[name='instance(ArrangeClassTime["+num+"]).clsBeginDate']").val() == ""){
		alert("请选择该课程的开始日期！");
		return;
	}
	else if(($("input[name='instance(ArrangeClassTime["+num+"]).clsEndDateTP']:checked").val() == null) || (($("input[name='instance(ArrangeClassTime["+num+"]).clsEndDate']").val() == "")&&($("input[name='instance(ArrangeClassTime["+num+"]).clsEndTimes']").val() == ""))) {
		alert("请选择该课程的结束日期！");
		return;
	}
	else if(($("input[name='instance(ArrangeClassTime["+num+"]).clsStartTimeH']").val() == "")||($("input[name='instance(ArrangeClassTime["+num+"]).clsStartTimeM']").val() == "")||($("input[name='instance(ArrangeClassTime["+num+"]).clsStartTimeH']").val() > 23)||($("input[name='instance(ArrangeClassTime["+num+"]).clsStartTimeM']").val() > 59)) {
		alert("请正确填写上课时间！");
		return;
	}
	else if(($("input[name='instance(ArrangeClassTime["+num+"]).clsFinishTimeH']").val() == "")||($("input[name='instance(ArrangeClassTime["+num+"]).clsFinishTimeM']").val() == "")||($("input[name='instance(ArrangeClassTime["+num+"]).clsFinishTimeH']").val() > 23)||($("input[name='instance(ArrangeClassTime["+num+"]).clsFinishTimeM']").val() > 59)) {
		alert("请正确填写下课时间！");
		return;
	}
	else {
		showOrHideSurfacedBox(timeDiv);
		var attendClsTP = ""
		var attendClsFreq = "";
		var attendClsFreqP = "";
		var clsBeginDate = "";
		var clsEndDate="";
		var clsEndTimes="";
		var clsStartTimeH = "";
		var clsStartTimeM = "";
		var clsFinishTimeH = "";
		var clsFinishTimeM = "";
		attendClsTP = $("input[name='instance(ArrangeClassTime["+num+"]).attendClsTP']:checked").val();
		attendClsFreq = $("input[name='instance(ArrangeClassTime["+num+"]).attendClsFreqTP']:checked").val();
		if(attendClsFreq == "attendClsFreqBWK") {
			attendClsFreqP = $("input[name='instance(ArrangeClassTime["+num+"]).attendClsFreqBWK']").val();
		}
		else {
			attendClsFreqP = $("input[name='instance(ArrangeClassTime["+num+"]).attendClsFreqBMon']").val();
		}
		clsBeginDate = $("input[name='instance(ArrangeClassTime["+num+"]).clsBeginDate']").val();
		clsEndDate = $("input[name='instance(ArrangeClassTime["+num+"]).clsEndDateTP']:checked").val();
		if(clsEndDate == "clsEndDate") {
			clsEndTimes = $("input[name='instance(ArrangeClassTime["+num+"]).clsEndDate']").val();
		}
		else {
			clsEndTimes = $("input[name='instance(ArrangeClassTime["+num+"]).clsEndTimes']").val();
			var tempTime = new Date(clsBeginDate);
			tempTime.setDate(tempTime.getDate() + (clsEndTimes * 7));
			var year = tempTime.getFullYear();
		    var month = tempTime.getMonth() + 1;
		    var day = tempTime.getDate();
			clsEndTimes = year + "-" + (month < 10 ? "0" + month : month) + "-" + (day < 10 ? "0" + day : day);
		}
		var summary = "		从" + clsBeginDate + "到"+clsEndTimes+"，每";
		if(attendClsFreq == "attendClsFreqBWK") {
			if(attendClsFreqP == "0" || attendClsFreqP == "") {
				summary += "周";
			}
			else {
				summary += "隔"+attendClsFreqP+"周";
			}
			
		}else {
			if(attendClsFreqP == "0" || attendClsFreqP == "") {
				summary += "月";
			}
			else {
				summary += "隔"+attendClsFreqP+"月";
			}
		}
		if($("#MonCls_"+num+"").get(0).checked) {
			summary += "周一、";
		}
		if($("#TueCls_"+num).get(0).checked) {
			summary += "周二、";
		}
		if($("#WebCls_"+num).get(0).checked) {
			summary += "周三、";
		}
		if($("#ThrCls_"+num).get(0).checked) {
			summary += "周四、";
		}
		if($("#FriCls_"+num).get(0).checked) {
			summary += "周五、";
		}
		if($("#SatCls_"+num).get(0).checked) {
			summary += "周六、";
		}
		if($("#SunCls_"+num).get(0).checked) {
			summary += "周日、";
		}
		if(summary[summary.length-1] == "、") {
			summary = summary.substring(0, summary.length-1);
		}
		clsStartTimeH = $("input[name='instance(ArrangeClassTime["+num+"]).clsStartTimeH']").val();
		clsStartTimeM = $("input[name='instance(ArrangeClassTime["+num+"]).clsStartTimeM']").val();
		clsFinishTimeH = $("input[name='instance(ArrangeClassTime["+num+"]).clsFinishTimeH']").val();
		clsFinishTimeM = $("input[name='instance(ArrangeClassTime["+num+"]).clsFinishTimeM']").val();
		if((clsStartTimeH < 10 ) && (clsStartTimeH.length < 2)) {
			summary += "0"+clsStartTimeH+":";
		}
		else {
			summary += clsStartTimeH+":";
		}
		if((clsStartTimeM < 10) && (clsStartTimeM.length < 2)) {
			summary += "0"+clsStartTimeM+"-";
		}
		else {
			summary += clsStartTimeM+"-";
		}
		if((clsFinishTimeH < 10) && (clsStartTimeH.length < 2)) {
			summary += "0"+clsFinishTimeH+":";
		}
		else {
			summary += clsFinishTimeH+":";
		}
		if((clsFinishTimeM < 10) && (clsFinishTimeM.length < 2)) {
			summary += "0"+clsFinishTimeM+"上课";
		}
		else {
			summary += clsFinishTimeM+"上课";
		}
		$("#xzsj_" + num).html(summary);
		$("input[name='instance(ArrangeClassTime["+num+"]).description']").val(summary);

		$("#xzls_" + num).html("选择教师");
		$("#teacherUuid_" + num).val("");
	}

}
function chooseAttendClsFreqTP(type, num) {
	if(type == "week") {
		$("input[name='instance(ArrangeClassTime["+num+"]).attendClsFreqBMon']").attr("value","");
		$("input[name='instance(ArrangeClassTime["+num+"]).attendClsFreqBMon']").attr({"disabled":true});
		$("input[name='instance(ArrangeClassTime["+num+"]).attendClsFreqBWK']").attr("value","0");
		$("input[name='instance(ArrangeClassTime["+num+"]).attendClsFreqBWK']").attr({"disabled":false});
	}
	else {
		$("input[name='instance(ArrangeClassTime["+num+"]).attendClsFreqBWK']").attr("value","");
		$("input[name='instance(ArrangeClassTime["+num+"]).attendClsFreqBWK']").attr({"disabled":true});
		$("input[name='instance(ArrangeClassTime["+num+"]).attendClsFreqBMon']").attr("value","0");
		$("input[name='instance(ArrangeClassTime["+num+"]).attendClsFreqBMon']").attr({"disabled":false});
	}
}
function chooseClsEndDateTP(type, num) {
	if(type == "times") {
		$("input[name='instance(ArrangeClassTime["+num+"]).clsEndDate']").attr("value","");
		$("input[name='instance(ArrangeClassTime["+num+"]).clsEndDate']").attr({"disabled":true});
		$("input[name='instance(ArrangeClassTime["+num+"]).clsEndTimes']").attr({"disabled":false});
	}
	else {
		$("input[name='instance(ArrangeClassTime["+num+"]).clsEndTimes']").attr("value","");
		$("input[name='instance(ArrangeClassTime["+num+"]).clsEndTimes']").attr({"disabled":true});
		$("input[name='instance(ArrangeClassTime["+num+"]).clsEndDate']").attr({"disabled":false});
	}
}
function updateRelation(data){
	if(data["course"] == null) {
		return;
	}
	$("input[name='courseUuid']").val(data["course"].uuid);
	$("input[name='courseNo']").val(data["course"].courseNo);
	$("input[name='name']").val(data["course"].uuid);
	$("input[name='courseName']").val(data["course"].courseName);

	$("#clsCourseNo").html(data["course"].courseNo);
	$("#clsCourseName").html(data["course"].courseName);
	if(data["course"].courseType != null) {
		$("#clsCourseType").html(data["course"].courseType.description);
	}
	if(data["course"].expectedHour != null) {
		$("#clsExpectedHour").html(data["course"].expectedHour + " ");
	}
	$("#clsExpectedCost").html(data["course"].expectedCost + " ");
	$("#clsFitableStudent").html(data["course"].fitableStudent);
	$("#clsCourseDescription").html(data["course"].courseDescription);
	$("#clsTeachingTarget").html(data["course"].teachingTarget);
	$("#clsTeachingContent").html(data["course"].teachingContent);
	$("#clsTeachingFeature").html(data["course"].teachingFeature);
	$("#clsRelatedMaterials").html(data["course"].relatedMaterials);
	$("#clsNotes").html(data["course"].notes);

	$("#clsCourseNoLS").html(data["course"].courseNo);
	$("#clsCourseNameLS").html(data["course"].courseName);
	if(data["course"].courseType != null) {
		$("#clsCourseTypeLS").html(data["course"].courseType.description);
	}
	$("#clsExpectedHourLS").html(data["course"].expectedHour + " ");
	$("#clsExpectedCostLS").html(data["course"].expectedCost + " ");
	$("#clsFitableStudentLS").html(data["course"].fitableStudent);
	$("#clsCourseDescriptionLS").html(data["course"].courseDescription);
	$("#clsTeachingTargetLS").html(data["course"].teachingTarget);
	$("#clsTeachingContentLS").html(data["course"].teachingContent);
	$("#clsTeachingFeatureLS").html(data["course"].teachingFeature);
	$("#clsRelatedMaterialsLS").html(data["course"].relatedMaterials);
	$("#clsNotesLS").html(data["course"].notes);

	$("#courseNoSS").html(data["course"].courseNo);
	$("#courseNameSS").html(data["course"].courseName);
	$("#courseNameB").html(data["course"].courseName);

	if(typeof(data["course"]) != "undefined"){
		$("input[name='instance(ArrangeClass).courseUuid']").val(data["course"].uuid);
	}

	if(data["course"].uuid != "") {
		$("#divB").css("display","inline");
		$("#divC").css("display","inline");
		$("#divD").css("display","inline");
	}
}
function clearRelationData(relationId){
		//$("#divB").css("display","none");
		//$("#divC").css("display","none");
		$("#divD").css("display","none");

		$("input[name='courseNo']").val("");
		$("input[name='courseUuid']").val("");
		$("input[name='name']").val("");
		$("input[name='courseName']").val("");

		$("#clsCourseNo").html("");
		$("#clsCourseName").html("");
		$("#clsCourseType").html("");
		$("#clsExpectedHour").html("");
		$("#clsExpectedCost").html("");
		$("#clsFitableStudent").html("");
		$("#clsCourseDescription").html("");
		$("#clsTeachingTarget").html("");
		$("#clsTeachingContent").html("");
		$("#clsTeachingFeature").html("");
		$("#clsRelatedMaterials").html("");
		$("#clsNotes").html("");

		$("#clsCourseNoLS").html("");
		$("#clsCourseNameLS").html("");
		$("#clsCourseTypeLS").html("");
		$("#clsExpectedHourLS").html("");
		$("#clsExpectedCostLS").html("");
		$("#clsFitableStudentLS").html("");
		$("#clsCourseDescriptionLS").html("");
		$("#clsTeachingTargetLS").html("");
		$("#clsTeachingContentLS").html("");
		$("#clsTeachingFeatureLS").html("");
		$("#clsRelatedMaterialsLS").html("");
		$("#clsNotesLS").html("");

		$("#courseNoSS").html();
		$("#courseNameSS").html();
		$("#courseNameB").html();

		$("input[name='instance(ArrangeClass).courseUuid']").val("");
}
function createInstance(elementId){
	if(confirm("确认创建？")){
		var param=Submit.excute(elementId);
		$.post(cp+"/ajaxs/content/course/manage/course/apply/create_arrange_cls.html",param,function(){
			location.href = cp+"/pages/content/course/manage/course/apply/query_course_apply.html";
		})
	}
}
function opcal(){
    J.calendar.Show();
}
function showBackground(obj,endInt) {
	if(isIe) {
		obj.filters.alpha.opacity+=1;
		if(obj.filters.alpha.opacity<endInt) {
			setTimeout(function(){showBackground(obj,endInt)},5);
		}
	}
	else {
		var al=parseFloat(obj.style.opacity);al+=0.01;
		obj.style.opacity=al;
		if(al<(endInt/100)) {
			setTimeout(function(){showBackground(obj,endInt)},5);
		}
	}
}
var TimeAndPositionAndTeacher = '<tr iTOType="info">'+ 
'<td colspan="3" cellpadding="0" cellspacing="0" style="width:640px;border-style: solid;border-color: #D4DDE6;border-width: 1px 1px 1px 1px;padding: 0px 0px 0px 0px;margin: 0px 0px 0px 0px;text-align: left;vertical-align: center;height:20px"><input type="hidden" name="instance(TimePositionTeacherInfo[NUMBER]).uuid" value="VALUE0">'+ 
'<input type="hidden" name="instance(TimePositionTeacherInfo[NUMBER]).operationStatus" value="OPERATIONSTATUS" iTOType="operationStatus">'+
'<input type="hidden" name="instance(TimePositionTeacherInfo[NUMBER]).timeStamp" value="NUMBER">'+
'<input type="hidden" name="instance(TimePositionTeacherInfo[NUMBER]).arrangeRmUuid" >'+
'<input type="hidden" name="instance(ArrangeClassTime[NUMBER]).description" >'+
'<div id="arrangeClsTimeTable_NUMBER" style="display:none;" class="surfacedBox">'+
'<table  border="0" align="center" cellpadding="0" cellspacing="0" style="border-width: 0px">'+
'<tr><td width="16px" height="16px" style="background:url(\'<%=request.getContextPath()%>/images/panelEdges/corner_lt.gif\')"></td>'+
'<td style="background:url(\'<%=request.getContextPath()%>/images/panelEdges/line_t.gif\')"></td>'+
'<td width="16px" height="16px" style="background:url(\'<%=request.getContextPath()%>/images/panelEdges/corner_rt.gif\')"></td></tr>'+
'<tr><td style="background:url(\'<%=request.getContextPath()%>/images/panelEdges/line_l.gif\')"></td>'+
'<td style="background:url(\'<%=request.getContextPath()%>/images/panelEdges/content.gif\')">'+
'<table id="TimeTable_NUMBER"><tr><td style="text-align:center;font-family:黑体;font-size:16px" colspan="8">选择上课时间</td></tr>'+
'<tr><td style="text-align:center;font-family:黑体;font-size:16px" colspan="8"></td></tr>'+
'<tr><td colspan="8"><input type="hidden" name="instance(ArrangeClassTime[NUMBER]).timeStamp" value="NUMBER"></td></tr>'+
'<tr><td style="text-align:center;font-family:黑体;font-size:15px">上课频率</td>'+
'<td style="text-align:center;font-family:黑体;font-size:15px" colspan="3">'+
'<input type="radio" name="instance(ArrangeClassTime[NUMBER]).attendClsFreqTP" value="attendClsFreqBWK" onclick="javascript:chooseAttendClsFreqTP(\'week\',\'NUMBER\')" checked >&nbsp;每&nbsp;'+
'<input name="instance(ArrangeClassTime[NUMBER]).attendClsFreqBWK" size="4" value="0" >&nbsp;周</td><td colspan="4"></td></tr>'+
'<tr><td></td><td style="text-align:center;font-family:黑体;font-size:15px" colspan="3">'+
'<input type="radio" name="instance(ArrangeClassTime[NUMBER]).attendClsFreqTP" value="attendClsFreqBMN" onclick="javascript:chooseAttendClsFreqTP(\'month\',\'NUMBER\')">&nbsp;每&nbsp;'+
'<input name="instance(ArrangeClassTime[NUMBER]).attendClsFreqBMon" size="4" disabled>&nbsp;月</td><td colspan="4"></td></tr>'+
'<tr style="border-bottom:#EEEEEE solid 1px;width:50%;text-align:center;line-height:1px"><td colspan="8"></td></tr>'+
'<tr><td style="font-family:黑体;font-size:15px">选择星期</td>'+
'<td style="font-family:黑体;font-size:15px">&nbsp;<input id="MonCls_NUMBER" week="week_NUMBER" name="instance(ArrangeClassTime[NUMBER]).attendClsOnMon" type="checkbox" />周一&nbsp;</td>'+
'<td style="font-family:黑体;font-size:15px"><input id="TueCls_NUMBER" week="week_NUMBER" name="instance(ArrangeClassTime[NUMBER]).attendClsOnTues" type="checkbox" />周二&nbsp;</td>'+
'<td style="font-family:黑体;font-size:15px"><input id="WebCls_NUMBER" week="week_NUMBER" name="instance(ArrangeClassTime[NUMBER]).attendClsOnWeb" type="checkbox" />周三&nbsp;</td>'+
'<td style="font-family:黑体;font-size:15px"><input id="ThrCls_NUMBER" week="week_NUMBER" name="instance(ArrangeClassTime[NUMBER]).attendClsOnThurs" type="checkbox" />周四&nbsp;</td>'+
'<td style="font-family:黑体;font-size:15px"><input id="FriCls_NUMBER" week="week_NUMBER" name="instance(ArrangeClassTime[NUMBER]).attendClsOnFri" type="checkbox" />周五&nbsp;</td>'+
'<td style="font-family:黑体;font-size:15px"><input id="SatCls_NUMBER" week="week_NUMBER" name="instance(ArrangeClassTime[NUMBER]).attendClsOnSat" type="checkbox" />周六&nbsp;</td>'+
'<td style="font-family:黑体;font-size:15px"><input id="SunCls_NUMBER" week="week_NUMBER" name="instance(ArrangeClassTime[NUMBER]).attendClsOnSun" type="checkbox" />周日&nbsp;</td></tr>'+
'<tr style="border-bottom:#EEEEEE solid 1px;width:50%;text-align:center;line-height:1px"><td colspan="8"></td></tr>'+
'<tr><td style="font-family:黑体;font-size:15px">开始日期</td><td></td>'+
'<td style="font-family:黑体;font-size:15px" colspan="2" align="right"><input id="clsBeginDate_NUMBER" name="instance(ArrangeClassTime[NUMBER]).clsBeginDate" class="runcode" onclick="opcal();" /></td>'+
'<td colspan="4"></td></tr>'+
'<tr><td style="font-family:黑体;font-size:15px">结束日期</td><td>&nbsp;<input type="radio" name="instance(ArrangeClassTime[NUMBER]).clsEndDateTP" value="clsEndDate" onclick="javascript:chooseClsEndDateTP(\'date\',\'NUMBER\')" checked></td>'+
'<td colspan="2" align="right"><input id="clsEndDate_NUMBER" name="instance(ArrangeClassTime[NUMBER]).clsEndDate" class="runcode" onclick="opcal();" /></td><td colspan="4"></td></tr>'+
'<tr><td></td><td>&nbsp;<input type="radio" name="instance(ArrangeClassTime[NUMBER]).clsEndDateTP" value="clsEndTimes" onclick="javascript:chooseClsEndDateTP(\'times\',\'NUMBER\')" ></td>'+
'<td style="font-family:黑体;font-size:15px" colspan="3">在重复<input type="text" name="instance(ArrangeClassTime[NUMBER]).clsEndTimes" id="clsEndTimes_NUMBER" style="width:25px" disabled>次后结束</td><td colspan="3"></td></tr>'+
'<tr style="border-bottom:#EEEEEE solid 1px;width:50%;text-align:center;line-height:1px"><td colspan="8"></td></tr>'+
'<tr><td style="font-family:黑体;font-size:15px">开始时间</td>'+
'<td style="font-family:黑体;font-size:15px" colspan="2">&nbsp;<input id="clsStartTimeH" name="instance(ArrangeClassTime[NUMBER]).clsStartTimeH" type="text" style="width:60px" />&nbsp;时</td>'+
'<td style="font-family:黑体;font-size:15px" colspan="2"><input id="clsStartTimeM" name="instance(ArrangeClassTime[NUMBER]).clsStartTimeM" type="text" style="width:60px" />&nbsp;分</td>'+
'<td style="font-family:黑体;font-size:15px">(24时)</td><td colspan="2"></td></tr>'+
'<tr><td style="font-family:黑体;font-size:15px">结束时间</td>'+
'<td style="font-family:黑体;font-size:15px" colspan="2">&nbsp;<input id="clsFinishTimeH" name="instance(ArrangeClassTime[NUMBER]).clsFinishTimeH" type="text" style="width:60px" />&nbsp;时</td>'+
'<td style="font-family:黑体;font-size:15px" colspan="2"><input id="clsFinishTimeM" name="instance(ArrangeClassTime[NUMBER]).clsFinishTimeM" type="text" style="width:60px" />&nbsp;分</td>'+
'<td style="font-family:黑体;font-size:15px">(24时)</td><td colspan="2"></td></tr>'+
'<tr><td colspan="8"></td></tr>'+
'<tr><td colspan="8" align="center">'+
'<a href="javascript:selectTime(\'arrangeClsTimeTable_NUMBER\',\'NUMBER\')"><img src="<%=request.getContextPath() %>/images/button/b_confirm_2.gif" /></a>'+
'<a href="javascript:showOrHideSurfacedBox(\'arrangeClsTimeTable_NUMBER\')"><img src="<%=request.getContextPath() %>/images/button/b_cancel.gif"/></a></td></tr></table></td>'+
'<td style="background:url(\'<%=request.getContextPath()%>/images/panelEdges/line_r.gif\')"></td></tr><tr></tr>'+
'<tr><td width="16px" height="16px" style="background:url(\'<%=request.getContextPath()%>/images/panelEdges/corner_lb.gif\')"></td>'+
'<td style="background:url(\'<%=request.getContextPath()%>/images/panelEdges/line_b.gif\')"></td>'+
'<td width="16px" height="16px" style="background:url(\'<%=request.getContextPath()%>/images/panelEdges/corner_rb.gif\')">'+
'</td></tr></table></div>'+
'<table cellpadding="0" cellspacing="0"><tr><td style="width:450px;border-style: solid;border-color: #D4DDE6;border-width: 0px 1px 0px 0px;padding: 0px 0px 0px 0px;text-align: center;vertical-align: center;height:20px"><a href="javascript:showOrHideSurfacedBox(\'arrangeClsTimeTable_NUMBER\',\'NUMBER\')"><div id="xzsj_NUMBER" style="text-align:center">选择时间</div></a></td>'+
'<td style="width:200px;border-style: solid;border-color: #D4DDE6;border-width: 0px 0px 0px 0px;padding: 3px 0px 0px 0px;margin-left:-300px;text-align: center;vertical-align: center;height:20px"><a href="javascript:getClassroom(\'NUMBER\')"><div id="xzjs_NUMBER" style="text-align:center">选择教室</div></a></td>'+
'<td style="width:140px;border-style: solid;border-color: #D4DDE6;border-width: 0px 0px 0px 1px;padding: 3px 0px 0px 0px;margin: 0px 0px 0px 0px;text-align: left;vertical-align: center;height:20px">'+
'<a href="javascript:getTeacher(\'NUMBER\')"><div id="xzls_NUMBER" style="text-align:center">选择教师</div></a><input type="hidden" id="teacherUuid_NUMBER" name="instance(TimePositionTeacherInfo[NUMBER]).arrangeClsTeacherUuid" /></td></tr></table></td>'+
'<td style="width:80px;border-style: solid;border-color: #D4DDE6;border-width: 0px 0px 1px 1px;text-align: center;vertical-align: center"><input type="button" class="btn_info" value="删除" onclick="removeInfoStar(this,\'OUTERDIVID\')"/></td></tr>';


</script>
<div style="font-family:黑体;font-size:20px;">&nbsp;排 课 申 请</div>
<br><br>
<form id="formA">
<div id="firstStep">
<img src="<%=request.getContextPath()%>/images/date/arrange_class_first_step.gif" />
<br><br>
<div style="font-family:黑体;font-size:16px">&nbsp;请选择所需排课课程</div>
<br>
<div id="divA">
<input type="hidden" name="instance(ArrangeClass).courseUuid" >
<table width="560" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td style="width:120px;color:rgb(117,126,157);font-size:15px;font-weight:bold">&nbsp;课程</td>
		<td width="70px"><font style="font-family:黑体;font-size:14px">课程编号</font></td>
		<td width="150px">
			<input name="courseUuid" nextSiblingName="courseNo" class="DropMenu"
			actionPath="<%=request.getContextPath() %>/ajaxs/drop/menu/query_course_drop_menu.html"
			field="courseNo" parameterLength="1" execute="true" nextSiblingSize="12" relationId="curCourseUuid"
			executeUrl="<%=request.getContextPath() %>/ajaxs/drop/menu/query_course_info.html" />
		</td>
		<td width="70px"><font style="font-family:黑体;font-size:14px">课程名</font></td>
		<td width="150px">
			<input name="name" nextSiblingName="courseName" class="DropMenu"
			actionPath="<%=request.getContextPath() %>/ajaxs/drop/menu/query_course_drop_menu.html"
			field="courseName" parameterLength="1" execute="true" nextSiblingSize="12" relationId="curCourseName"
			executeUrl="<%=request.getContextPath() %>/ajaxs/drop/menu/query_course_info.html" />
		</td>
	</tr>
</table>
<br>
<div id="divD" style="color:red;font-size:15px;font-weight:bold;display:none">
	你已选择课程<span id="courseNameB" style="color:red;font-size:15px;font-weight:bold"></span>
</div>
<br><br>
</div>
<div id="divB">
<table width="720" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th style="text-align:center" colspan="6">课程信息</th>
	</tr>
	<tr>
		<th width="110">课程编号</th>
		<td width="130"><span id="clsCourseNo"></span></td>
		<th width="110">课程名</th>
		<td width="130"><span id="clsCourseName"></span></td>
		<th width="110">课程类别</th>
		<td width="130"><span id="clsCourseType"></span></td>
	</tr>
	<tr>
		<th>预计总课时</th>
		<td><span id="clsExpectedHour"></span>课时</td>
		<th>预计总费用</th>
		<td colspan="3"><span id="clsExpectedCost"></span>元</td>
	</tr>
	<tr>
		<th>适合学员</th>
		<td colspan="5" style="word-break:break-all;vertical-align:top;padding-top:5px"><pre><span id="clsFitableStudent"></span></pre></td>
	</tr>
	<tr>
		<th>课程简介</th>
		<td colspan="5" style="word-break:break-all;vertical-align:top;padding-top:5px"><pre><span id="clsCourseDescription"></span></pre></td>
	</tr>
	<tr>
		<th>教学目标</th>
		<td colspan="5" style="word-break:break-all;vertical-align:top;padding-top:5px"><pre><span id="clsTeachingTarget"></span></pre></td>
	</tr>
	<tr>
		<th>授课内容</th>
		<td colspan="5" style="word-break:break-all;vertical-align:top;padding-top:5px"><pre><span id="clsTeachingContent"></span></pre></td>
	</tr>
	<tr>
		<th>课程特色</th>
		<td colspan="5" style="word-break:break-all;vertical-align:top;padding-top:5px"><pre><span id="clsTeachingFeature"></span></pre></td>
	</tr>
	<tr>
		<th>教材说明</th>
		<td colspan="5" style="word-break:break-all;vertical-align:top;padding-top:5px"><pre><span id="clsRelatedMaterials"></span></pre></td>
	</tr>
	<tr>
		<th>其他</th>
		<td colspan="5" style="word-break:break-all;vertical-align:top;padding-top:5px"><pre><span id="clsNotes"></span></pre></td>
	</tr>
</table>
<br>
<table width="720" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th colspan="6"><font color="red">补充资料</font></th>
	</tr>
	<tr>
		<th width="110px">班级名</th>
		<td width="130px"><input name="instance(ArrangeClass).clsNo" id="arrangeClsNoFS" type="text" style="width:100px" validate="true"></td>
		<th width="110px">班型</th>
		<td width="130px"><label  name="instance(ArrangeClass).clsTypeUuid" id="arrangeClsTypeFS" class="BaseTree" javaClassName="ClassManagement" validate="true"></label></td>
		<th width="110px">校区</th>
		<td width="130px"><label  name="instance(ArrangeClass).campusUuid" id="campusUuid" class="BaseTree" javaClassName="Campus" validate="true"></label></td>
	</tr>
	<tr>
		<th>备注</th>
		<td colspan="5"><textarea name="instance(ArrangeClass).notes" id="arrangeClsNotesFS" style="height:81px;width:598px;margin-right:-300px"></textarea></td>
	</tr>
</table>
<br>
</div>
<div id="divC">
<div>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="#" class="btn btn-info" onclick="nextToSecStep('firstStep')">下一步</a>
</div>
</div>
</div>
<div id="secondStep" style="display:none">
	<img src="<%=request.getContextPath()%>/images/date/arrange_class_second_step.gif" />
	<br><br>
	<div style="font-family:黑体;font-size:16px">&nbsp;请填写课程相关信息</div>
	<br>
	<table width="700px" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td style="width:60px;color:rgb(117,126,157);font-size:15px;font-weight:bold">&nbsp;课程</td>
			<td style="width:120px;font-family:黑体;font-size:15px;text-align:center"><span id="courseNoSS"></span></td>
			<td style="width:120px;font-family:黑体;font-size:15px;text-align:center"><span id="courseNameSS"></span></td>
			<td style="width:80px;color:rgb(117,126,157);font-size:15px;font-weight:bold;text-align:center">班级名</td>
			<td style="width:120px;font-family:黑体;font-size:15px;text-align:center"><span id="arrangeClsNoSS"></span></td>
			<td style="width:80px;color:rgb(117,126,157);font-size:15px;font-weight:bold;text-align:center">校区</td>
			<td style="width:120px;font-family:黑体;font-size:15px;text-align:center"><span id="arrangeClsCampusSS"></span></td>
		</tr>
	</table>
	<br>
	<table width="840px" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
		<tr>
			<th width="180px">实际总课时</th>
			<td width="180px"><input type="text" name="instance(ArrangeClass).actualHour" id="clsActualHourSS" style="width:95px" validate="true">&nbsp;<font color="#996633">*</font>&nbsp;课时</td>
			<th width="180px">实际总费用</th>
			<td width="180px"><input type="text" name="instance(ArrangeClass).actualCost" id="clsActualCostSS" style="width:95px" validate="true">&nbsp;&nbsp;<font color="#996633">*</font>&nbsp;元</td>
			<th width="180px">班级最大人数上限</th>
			<td width="180px"><input type="text" name="instance(ArrangeClass).maxNoP" id="maxNoPSS" style="width:95px" validate="true">&nbsp;&nbsp;<font color="#996633">*</font>&nbsp;人</td>
		</tr>
	</table>
	<br>
	<table width="840px" border="0" cellpadding="0" cellspacing="0" style="border-collapse:collapse;border-style:solid;border-color:#D4DDE6;border-width:1px 1px 0px 0px;background-color:#fcfcfc;color:#000000;margin:0px 0px 0px 0px;padding:2px 3px">
		<tr>
			<th style="width:760px;background-color: #DFE9f5;border-style: solid;	border-color: #D4DDE6;border-width: 0px 0px 1px 1px;padding: 3px 0px 1px 5px;margin: 0px 0px 0px 0px;text-align: center;color: #374471;height:20px" colspan="3" >选择时间和地点及授课教师</th>
			<th style="width:80px;background-color: #DFE9f5;border-style: solid;	border-color: #D4DDE6;border-width: 0px 0px 1px 1px;padding: 0px 0px 0px 0px;margin: 0px 0px 0px 0px;text-align: center;color: #374471;height:20px"><input type="button" value="增加" onclick="createInfoStar('timePositionTeacher',TimeAndPositionAndTeacher,'0',['','',''])" /></th>
		</tr>
	<tbody id="timePositionTeacher"></tbody>
</table>
<br>
<div>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="#" class="btn btn-info" onclick="lastToFirstStep()">上一步</a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="#" class="btn btn-info" onclick="nextToThirdStep('secondStep')">下一步</a>
</div>
<div id="ChooseClsRm" style="display:none" class="surfacedBox">
	<table  border="0" align="center" cellpadding="0" cellspacing="0" style="border-width: 0px">
		<tr>
			<td width="16px" height="16px" style="background:url('<%=request.getContextPath()%>/images/panelEdges/corner_lt.gif')"></td>
			<td style="background:url('<%=request.getContextPath()%>/images/panelEdges/line_t.gif')"></td>
			<td width="16px" height="16px" style="background:url('<%=request.getContextPath()%>/images/panelEdges/corner_rt.gif')"></td>
		</tr>
		<tr>
			<td style="background:url('<%=request.getContextPath()%>/images/panelEdges/line_l.gif')"></td>
			<td style="background:url('<%=request.getContextPath()%>/images/panelEdges/content.gif')">
				<div style="text-align:center;font-family:黑体;font-size:16px">选择教室</div><br>
				<div style="width:645px;min-height:100px;max-height:360px;overflow:auto;" id="roomContent"></div><br>
				<div align="center"><a href="javascript:showOrHideSurfacedBox('ChooseClsRm')"><img src="<%=request.getContextPath() %>/images/button/b_close.gif"/></a></div>
			</td>
		<td style="background:url('<%=request.getContextPath()%>/images/panelEdges/line_r.gif')"></td>
		</tr>
		<tr></tr>
		<tr>
			<td width="16px" height="16px" style="background:url('<%=request.getContextPath()%>/images/panelEdges/corner_lb.gif')"></td>
			<td style="background:url('<%=request.getContextPath()%>/images/panelEdges/line_b.gif')"></td>
			<td width="16px" height="16px" style="background:url('<%=request.getContextPath()%>/images/panelEdges/corner_rb.gif')"></td>
		</tr>
	</table>
</div>
	<div id="ChooseClsTeacher" style="display:none" class="surfacedBoxT">
		<table  border="0" align="center" cellpadding="0" cellspacing="0" style="border-width: 0px">
			<tr>
				<td width="16px" height="16px" style="background:url('<%=request.getContextPath()%>/images/panelEdges/corner_lt.gif')"></td>
				<td style="background:url('<%=request.getContextPath()%>/images/panelEdges/line_t.gif')"></td>
				<td width="16px" height="16px" style="background:url('<%=request.getContextPath()%>/images/panelEdges/corner_rt.gif')"></td>
			</tr>
			<tr>
				<td style="background:url('<%=request.getContextPath()%>/images/panelEdges/line_l.gif')"></td>
				<td style="background:url('<%=request.getContextPath()%>/images/panelEdges/content.gif')">
					<div style="text-align:center;font-family:黑体;font-size:16px">选择教师</div><br>
					<div id="teacherContent" class="bigResultCon" style="width:580px;max-height:280px;overflow:auto;text-align:center"></div><br>
					<div align="center"><a href="javascript:showOrHideSurfacedBox('ChooseClsTeacher')"><img src="<%=request.getContextPath() %>/images/button/b_close.gif"/></a></div>
				</td>
			<td style="background:url('<%=request.getContextPath()%>/images/panelEdges/line_r.gif')"></td>
			</tr>
			<tr></tr>
			<tr>
				<td width="16px" height="16px" style="background:url('<%=request.getContextPath()%>/images/panelEdges/corner_lb.gif')"></td>
				<td style="background:url('<%=request.getContextPath()%>/images/panelEdges/line_b.gif')"></td>
				<td width="16px" height="16px" style="background:url('<%=request.getContextPath()%>/images/panelEdges/corner_rb.gif')"></td>
			</tr>
		</table>
	</div>
</div>
<div id="thirdStep" style="display:none">`
	<img src="<%=request.getContextPath()%>/images/date/arrange_class_third_step.gif" />
	<br><br>
	<div style="font-family:黑体;font-size:16px">&nbsp;请查看选择的课程信息</div>
	<br>
	<table width="840" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
		<tr>
			<th colspan="6">基本信息</th>
		</tr>
		<tr>
			<th width="130px">课程编号</th>
			<td width="150px"><span id="clsCourseNoLS"></span></td>
			<th width="130px">课程名</th>
			<td width="150px"><span id="clsCourseNameLS"></span></td>
			<th width="130px">课程类别</th>
			<td width="150px"><span id="clsCourseTypeLS"></span></td>
		</tr>
		<tr>
			<th>预计总课时</th>
			<td><span id="clsExpectedHourLS"></span>课时</td>
			<th>预计总费用</th>
			<td colspan="3"><span id="clsExpectedCostLS"></span>元</td>
		</tr>
		<tr>
			<th>适合学员</th>
			<td colspan="5" style="word-break:break-all;vertical-align:top;padding-top:5px"><span id="clsFitableStudentLS"></span></td>
		</tr>
		<tr>
			<th>课程简介</th>
			<td colspan="5" style="word-break:break-all;vertical-align:top;padding-top:5px"><pre><span id="clsCourseDescriptionLS"></span></pre></td>
		</tr>
		<tr>
			<th>教学目标</th>
			<td colspan="5" style="word-break:break-all;vertical-align:top;padding-top:5px"><pre><span id="clsTeachingTargetLS"></span></pre></td>
		</tr>
		<tr>
			<th>授课内容</th>
			<td colspan="5" style="word-break:break-all;vertical-align:top;padding-top:5px"><pre><span id="clsTeachingContentLS"></span></pre></td>
		</tr>
		<tr>
			<th>课程特色</th>
			<td colspan="5" style="word-break:break-all;vertical-align:top;padding-top:5px"><pre><span id="clsTeachingFeatureLS"></span></pre></td>
		</tr>
		<tr>
			<th>教材说明</th>
			<td colspan="5" style="word-break:break-all;vertical-align:top;padding-top:5px"><pre><span id="clsRelatedMaterialsLS"></span></pre></td>
		</tr>
		<tr>
			<th>其他</th>
			<td colspan="5" style="word-break:break-all;vertical-align:top;padding-top:5px"><pre><span id="clsNotesLS"></span></pre></td>
		</tr>
		<tr>
			<th width="130px">班级名</th>
			<td width="150px"><span id="arrangeClsNoLS"></span></td>
			<th width="130px">班型</th>
			<td width="150px"><span id="arrangeClsTypeLS"></span></td>
			<th width="130px">校区</th>
			<td width="150px"><span id="arrangeClsCampusLS"></span></td>
		</tr>
		<tr>
			<th>备注</th>
			<td colspan="5"><span id="arrangeClsNotesLS"></span></td>
		</tr>
	</table>
	<br>
	<table width="840px" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
		<tr>
			<th colspan="6">上课信息</th>
		</tr>
		<tr>
			<th width="180px">实际总课时</th>
			<td width="180px"><span id="clsActualHourLS"></span>&nbsp;课时</td>
			<th width="180px">实际总费用</th>
			<td width="180px"><span id="clsActualCostLS"></span>&nbsp;元</td>
			<th width="180px">班级最大人数上限</th>
			<td width="180px"><span id="maxNoPLS"></span>&nbsp;人</td>
		</tr>
	</table>
	<br>
	<div id="timePositionTeacherLS" style="width:840px" ></div>
	<br>
	<div>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="#" class="btn btn-info" onclick="lastToSecondStep()">上一步</a>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="javascript:createInstance('formA')" class="btn btn-primary">提交</a>
	</div>
</div>
</form>
</body>
</html>
