<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
	<title>员工请假管理</title>
</head>

<body>
<form id="form" name="form" method="post">
<input type="hidden" name="uuid" />
<input type="hidden" name="resultCode" />
</form>
<script>
$(document).ready(function(){
	currentResultTableDivWidth = 740;
	execute();
});
function execute(){
	var beginDate = $("#beginDate").val();
	var endDate = $("#endDate").val();
	var name = $("#name").val();
	var departmentUuid = $("#departmentUuid").val();
	var leaveUuid = $("#leaveUuid").val();
	var stateUuid = $("#stateUuid").val();
	var data = {beginDate:beginDate,
				endDate:endDate,
				name:name,
				departmentUuid:departmentUuid,
				leaveUuid:leaveUuid,
				stateUuid:stateUuid,
				offset:1,
				recnum:24};
	$.ajax({
		type: "POST",
		url: cp+"/ajaxs/resource/human/manage/leave/manage/query_leave_manage.html",
		data:data,
		cache: false,
		dataType: "json",
		success: function(msg){
			if(msg!=null){
				$("#result").pagination({
					totalRecord:msg[1],
					dataStore:msg[0],
					proxyUrl:cp+"/ajaxs/resource/human/manage/leave/manage/query_leave_manage.html",
					data:data,
					currentPage:1,
					perPage:24,
					toolbarType:"pgBlueToolbar",
					barPosition:"top&bottom",
					pageType:"show"
				});
			}
		},
		error: function(){
			alert("请求失败或超时，请稍后再试！");
			return;
		}
	})
}
function addData(dataStore){
	var buffer="";
	buffer += "<div class='resultTableDiv' style='width:" + currentResultTableDivWidth + "px;overflow:auto'>";
	buffer += "<table width='960' border='0' cellpadding='0' cellspacing='0' class='InfoListPanel_color'>";
	buffer += "<tr><th width='20'></th><th width='70'>申请人</th><th width='100'>组织机构</th><th width='100'>岗位</th><th width='135'>申请时间</th><th width='70'>请假类别</th><th width='70'>主管领导</th><th width='70'>审核状态</th><th width='70'>分校校长</th><th width='70'>审核状态</th><th width='60'>校长</th><th width='70'>审核状态</th><th width='50'>操作</th></tr>";
	for(var i=0;i<dataStore.length;i++){
		if(i%2==0){
			buffer += "<tr class='tr1'>";
		}
		else {
			buffer += "<tr class='tr2'>";
		}
		buffer += "<td align='center'>"+dataStore[i][0]+"</td>";
		buffer += "<td align='center' style='word-break:break-all;word-wrap:word-break'>&nbsp;"+dataStore[i][1]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][2]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][13]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][14]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][4]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][7]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][8]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][9]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][10]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][11]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][12]+"</td>";
		buffer += "<td align='center'>";
		buffer += "<a href='javascript:showInstance(\""+dataStore[i][5]+"\",\"\",\"/views/resource/human/manage/relation/manage/forward_view_relation.html\",600,700)'>查看</a>";
		buffer += "</td>";
		buffer += "</tr>";
	}
	buffer += "</table></div>";
	return buffer;
}
</script>
<div style="font-family:黑体;font-size:20px;">&nbsp;员 工 请 假 管 理</div>
<br><br><br>
<table align="left" width="720" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="100">申请人</th>
		<td width="140">
			<input type="text" id="name" size="11" />
		</td>
		<th width="100">组织机构</th>
		<td width="140">
			<label id="departmentUuid" class="BaseTree" javaClassName="Department" ></label>
		</td>
		<th width="100">请假类别</th>
		<td width="140">
			<label id="leaveUuid" class="BaseTree" javaClassName="LeaveType" ></label>
		</td>
		
	</tr>
	<tr>
		<th width="100">审核状态</th>
		<td width="140">
			<label id="stateUuid" class="BaseTree" javaClassName="ExaminationState" ></label>
		</td>
		<th width="100">申请时间</th>
		<td width="380" colspan="3">
			<label type="text" id="beginDate" class="DateTimeSingle" format="all"></label>&nbsp;-&nbsp;<label type="text" id="endDate" class="DateTimeSingle" format="all"></label>
		</td>
	</tr>
</table>
<br><br><br><br><br>
<a href="#" onclick="execute()">
<img src="<%=request.getContextPath()%>/images/button/b_search.gif" /></a>
&nbsp;&nbsp;&nbsp;&nbsp;
<br><br>
<div id="result" class="bigResultCon" style="width:740px;margin-left:-10px"></div>
</body>
</html>
