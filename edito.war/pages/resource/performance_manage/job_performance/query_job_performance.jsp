<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
	<title>岗位绩效设置</title>
</head>

<body>
<form id="form" name="form" method="post">
<input type="hidden" name="uuid" />
<input type="hidden" name="resultCode" />
</form>
<script>
$(document).ready(function(){
	execute();
});
function execute(){
	var description = $("#description").val();
	var campusUuid = $("#campusUuid").val();
	$.post(cp+"/ajaxs/resource/human/manage/job/manage/query_job_manage.html",{description:description,campusUuid:campusUuid},function(data){
		var buffer="";
		buffer += "<table width='300' border='0' cellpadding='0' cellspacing='0' class='InfoListPanel_color'>";
		buffer += "<tr><th width='20'></th><th width='140'>岗位</th><th width='140'>操作</th></tr>";
		for(var i=0;i<data.length;i++){
			if(i%2==0){
				buffer += "<tr class='tr1'>";
			}
			else {
				buffer += "<tr class='tr2'>";
			}
			buffer += "<td align='center'>"+data[i][0]+"</td>";
			buffer += "<td align='center'>"+data[i][1]+"</td>";
			buffer += "<td align='center'>";
			buffer += "<a href='javascript:editInstance(\""+data[i][2]+"\",\"/https/resource/performance/manage/job/performance/manage_job_type.html\")'>绩效类型</a>&nbsp;";
			buffer += "<a href='javascript:queryJobEmployee(\""+data[i][1]+"\", \""+data[i][2]+"\")'>岗位员工</a>";
			buffer += "</td>";
			buffer += "</tr>";
		}
		buffer += "</table>";
		$("#result").html(buffer);
	},"json");
}
function queryJobEmployee(name, uuid){
	$.post(cp + "/ajaxs/resource/human/manage/job/manage/query_job_employee.html",{"uuid":uuid},function(data){
		var num = data.length;
		var buffer = "<br><hr><br>";
		buffer += "<font color='red'><b>" + name + "</b>&nbsp;岗位现有员工&nbsp;<b>" + num + "</b>&nbsp;人</font>";
		buffer += "<table width='720' border='0' cellpadding='0' cellspacing='0' class='InfoListPanel_color'>";
		buffer += "<tr><th width='20'></th><th width='80'>员工号</th><th width='80'>姓名</th><th width='60'>性别</th><th width='60'>学历</th><th width='100'>组织机构</th><th width='100'>入职时间</th><th width='80'>员工状态</th><th width='80'>有无帐户</th><th width='60'>操作</th></tr>";
		if(num > 0){
			for(var i=0; i<num; i++){
				if(i%2==0){
					buffer += "<tr class='tr1'>";
				}
				else {
					buffer += "<tr class='tr2'>";
				}
				buffer += "<td align='center'>"+data[i][0]+"</td>";
				buffer += "<td align='center'>"+data[i][1]+"</td>";
				buffer += "<td align='center'>"+data[i][2]+"</td>";
				buffer += "<td align='center'>"+data[i][3]+"</td>";
				buffer += "<td align='center'>"+data[i][4]+"</td>";
				buffer += "<td align='center'>"+data[i][5]+"</td>";
				buffer += "<td align='center'>"+data[i][6]+"</td>";
				buffer += "<td align='center'>"+data[i][7]+"</td>";
				buffer += (data[i][8]=="true" ? "<td align='center'><font color='red'>有</font></td>" : "<td align='center'>无</td>");
				buffer += "<td align='center'><a href='javascript:showInstance(\""+data[i][9]+"\",\"\",\"/views/resource/human/manage/employee/manage/forward_view_employee.html\",520,620)'>查看</a></td>";
				buffer += "</tr>";
			}
		}
		else {
			buffer += "<tr><td colspan='10'>&nbsp;<font color='red'>该岗位暂未分配员工！</font></td></tr>";
		}
		buffer += "</table><br>";
		buffer += "<a href='javascript:hideTable()'><img src='"+cp+"/images/button/b_cancel.gif' /></a>";

		$("#jobEmployee").css("display", "block");
		$("#jobEmployee").html(buffer);
	},"json");
}
function hideTable(){
	$("#jobEmployee").css("display", "none");
}
</script>
<div style="font-family:黑体;font-size:20px;">&nbsp;岗 位 绩 效 设 置</div>
<br><br><br>
<table align="left" width="250" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="100">岗位</th>
		<td width="150">
			<input id="description" size="15" />
		</td>
	</tr>
</table>
<br><br><br>
<a href="#" onclick="execute()">
<img src="<%=request.getContextPath()%>/images/button/b_search.gif" /></a>
<br><br>
<div id="result" class="bigResultCon" style="width:720px"></div>
<div id="jobEmployee"></div>
</body>
</html>
