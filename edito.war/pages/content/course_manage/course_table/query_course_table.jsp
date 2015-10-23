<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>课程表</title>
	<style>
		body {
			margin: 40px 10px;
			padding: 0;
			font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
			font-size: 14px;
		}
		#calendar {
			max-width: 900px;
			margin: 0 auto;
		}
	
	</style>
</head>

<body>
<form id="form" name="form" method="post">
	<input type="hidden" name="uuid" />
	<input type="hidden" name="resultCode" />
</form>
<script>
var nowDate = "";
$(document).ready(function(){
	currentResultTableDivWidth = 880;
	var today = new Date();
	var year = today.getYear() + 1900;
	var month = today.getMonth() + 1;
	var day = today.getDate();
	if(month > 9) {
		nowDate = year + "-" + month;
	}
	else {
		nowDate = year + "-0" + month;
	}
	if(day > 9) {
		nowDate += "-" + day;
	}
	else {
		nowDate += "-0" + day;
	}
	execute();
	
});
function execute(){
	$('#calendar').fullCalendar('destroy');
	var teacherName = $("#teacherName").val();
	var courseName = $("#courseName").val();
	var campusUuid = $("#campusUuid").val();
	$.post(cp+"/ajaxs/content/course/manage/course/table/query_course_table.html",{data:teacherName, campusUuid:campusUuid, courseName:courseName},function(data){
		$('#calendar').fullCalendar({
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,basicWeek,basicDay'
			},
			defaultDate: nowDate,
			editable: true,
			eventLimit: true,
			events: data
		});
	},"json")
}

</script>
	<table style="border-collapse:collapse;border-style: solid;border-color: #D4DDE6;border-width: 1px 1px 0px 0px;background-color: #fcfcfc;color: #000000;padding: 2px 3px;" align="center" width="900" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<th style="font-family:宋体, Verdana, Arial;font-size: 13px;background-color:rgb(58, 135, 173);border-style: solid;border-color: #D4DDE6;border-width: 0px 0px 1px 1px;padding: 3px 0px 1px 5px;margin: 0px 0px 0px 0px;text-align: center;color: #374471;height:20px; " width="100"><font color="white">课程名</font></th>
			<td style="font-family:宋体, Verdana, Arial;font-size: 13px;border-style: solid;border-color: #D4DDE6;border-width: 0px 0px 1px 1px;padding: 3px 0px 3px 5px;margin: 0px 0px 0px 0px;text-align: left;vertical-align: center;height:20px;" width="140"><input id="courseName" size="21" /></td>
			<th style="font-family:宋体, Verdana, Arial;font-size: 13px;background-color:rgb(58, 135, 173);border-style: solid;border-color: #D4DDE6;border-width: 0px 0px 1px 1px;padding: 3px 0px 1px 5px;margin: 0px 0px 0px 0px;text-align: center;color: #374471;height:20px; " width="100"><font color="white">教师姓名</font></th>
			<td style="font-family:宋体, Verdana, Arial;font-size: 13px;border-style: solid;border-color: #D4DDE6;border-width: 0px 0px 1px 1px;padding: 3px 0px 3px 5px;margin: 0px 0px 0px 0px;text-align: left;vertical-align: center;height:20px;" width="140"><input id="teacherName" size="21" /></td>
			<th style="font-family:宋体, Verdana, Arial;font-size: 13px;background-color:rgb(58, 135, 173);border-style: solid;border-color: #D4DDE6;border-width: 0px 0px 1px 1px;padding: 3px 0px 1px 5px;margin: 0px 0px 0px 0px;text-align: center;color: #374471;height:20px; " width="100"><font color="white">校区</font></th>
			<td style="font-family:宋体, Verdana, Arial;font-size: 13px;border-style: solid;border-color: #D4DDE6;border-width: 0px 0px 1px 1px;padding: 3px 0px 3px 5px;margin: 0px 0px 0px 0px;text-align: left;vertical-align: center;height:20px;" width="140"><label id="campusUuid" class="BaseTree" javaClassName="Campus"></label></td>
		</tr>
	</table>
<br><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="#" onclick="execute()"> <img src="<%=request.getContextPath()%>/images/button/b_search.gif" /></a>
&nbsp;&nbsp;&nbsp;&nbsp;
<br><br><br>
<div id="calendar"></div>
</body>
</html>