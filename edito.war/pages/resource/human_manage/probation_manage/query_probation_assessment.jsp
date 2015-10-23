<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
	<title>员工转正管理</title>
</head>
<body>
<form id="form" name="form" method="post">
<input type="hidden" name="uuid" />
<input type="hidden" name="resultCode" />
</form>
<script>
$(document).ready(function(){
	currentResultTableDivWidth = 720;
	execute();
});
function execute(){
	var personNo = $("#personNo").val();
	var name = $("#name").val();
	var departmentUuid = $("#departmentUuid").val();
	var campusUuid = $("#campusUuid").val();
	var jobUuid = $("#jobUuid").val();
	var approvalStateUuid = $("#approvalStateUuid").val();
	var startTime = $("#startTime").val();
	var endTime = $("#endTime").val();
	
	var sortField = $("#sortField option:selected").val();
	var data = {type:"regular",
				personNo:personNo,
				name:name,
				departmentUuid:departmentUuid,
				campusUuid:campusUuid,
				jobUuid:jobUuid,
				approvalStateUuid:approvalStateUuid,
				startTime:startTime,
				endTime:endTime,
				sortField:sortField,
				offset:1,
				recnum:24};
	$.ajax({
		type: "POST",
		url: cp+"/ajaxs/resource/approval/manage/query_approval_detail.html",
		data:data,
		cache: false,
		dataType: "json",
		success: function(msg){
			if(msg!=null){
				$("#result").pagination({
					totalRecord:msg[1],
					dataStore:msg[0],
					proxyUrl:cp+"/ajaxs/resource/approval/manage/query_approval_detail.html",
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
	buffer += "<table width='720' border='0' cellpadding='0' cellspacing='0' class='InfoListPanel_color'>";
	buffer += "<tr><th width='20'></th><th width='60'>员工号</th><th width='70'>姓名</th><th width='100'>组织机构</th><th width='100'>校区</th><th width='70'>岗位</th><th width='90'>申请时间</th><th width='70'>审批状态</th><th>操作</th></tr>";
	for(var i=1;i<dataStore.length;i++){
		if(i%2==0){
			buffer += "<tr class='tr2'>";
		}
		else {
			buffer += "<tr class='tr1'>";
		}
		buffer += "<td align='center'>"+dataStore[i][0]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][15]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][1]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][16]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][18]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][17]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][22]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][20]+"</td>";
		buffer += "<td align='center'><a href='javascript:showInstance(\""+dataStore[i][14]+"\",\"\",\"/views/resource/campus/manage/my/campus/regular/apply/forward_view_regular.html\",600,700)'>查看</a>&nbsp;";
		if(dataStore[i][21] == "正式员工") {
			buffer += "<a title='已转正，不能重复转正！'><font color='#888888'>转正</font></a>&nbsp;";
			buffer += "<a title='已转正，不能解约！'><font color='#888888'>解约</font></a>";
		}
		else if(dataStore[i][20] == "已审批"){
			buffer += "<a href='javascript:positiveInstance(\""+dataStore[i][19]+"\")'>转正</a>&nbsp;";
			buffer += "<a href='javascript:terminationInstance(\""+dataStore[i][19]+"\")'>解约</a>";
		}
		else if(dataStore[i][20]=="未审批"){
			buffer += "<a title='未审批，不能转正！'><font color='#888888'>转正</font></a>&nbsp;";
			buffer += "<a title='未审批，不能解约！'><font color='#888888'>解约</font></a>";
		}
		else if(dataStore[i][20]=="审批中"){
			buffer += "<a title='审批中，不能转正！'><font color='#888888'>转正</font></a>&nbsp;";
			buffer += "<a title='审批中，不能解约！'><font color='#888888'>解约</font></a>";
		}			
		buffer += "</td>";
		buffer += "</tr>";
	}
	buffer += "</table></div>";
	return buffer;
}
function positiveInstance(uuid){
	if(confirm("确认转正？")){
		$.post(cp+"/ajaxs/resource/human/manage/probation/manage/probation/assessment/edit_formal_employee.html",{uuid:uuid},function(){
			execute();
		})
	}
}
function terminationInstance(uuid){
	if(confirm("确认解约？")){
		$.post(cp+"/ajaxs/resource/human/manage/probation/manage/probation/assessment/edit_termination_employee.html",{uuid:uuid},function(){
			execute();
		})
	}
}
</script>
<div style="font-family:黑体;font-size:20px;">&nbsp;员 工 转 正 管 理</div>
<br><br><br>
<table align="left" width="720" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="80">员工号</th>
		<td width="100">
			<input id="personNo" size="11" />
		</td>
		<th width="80">姓名</th>
		<td width="100">
			<input id="name" size="11" />
		</td>
		<th width="80">组织机构</th>
		<td width="100">
			<label id="departmentUuid" class="BaseTree" javaClassName="Department" ></label>
		</td>
		<th width="80">校区</th>
		<td width="100">
			<label id="campusUuid" class="BaseTree" javaClassName="Campus" ></label>
		</td>
	</tr>
	<tr>
		<th width="80">岗位</th>
		<td width="100">
			<label id="jobUuid" class="BaseTree" javaClassName="Job" ></label>
		</td>
		<th width="80">审批状态</th>
		<td width="100">
			<label id="approvalStateUuid" class="BaseTree" javaClassName="ApprovalState" ></label>
		</td>
		<th width="80">申请时间</th>
		<td colspan="3">
			<label type="text" id="startTime" class="DateTimeSingle" format="all"></label>&nbsp;-&nbsp;<label type="text" id="endTime" class="DateTimeSingle" format="all"></label>
		</td>
	</tr>
</table>
<br><br><br><br><br>
<a href="#" onclick="execute()">
<img src="<%=request.getContextPath()%>/images/button/b_search.gif" /></a>
&nbsp;&nbsp;&nbsp;&nbsp;
<div id="result" class="bigResultCon" style="width:720px;margin-left:-10px"></div>
</body>
</html>
