<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.ito.edito.util.Constants" %>
<html>
<head>
	<title>员工离职申请</title>
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
	var quitName = $("#name").val();
	var departmentUuid = $("#departmentUuid").val();
	var departureTypeUuid = $("#departureTypeUuid").val();
	var startTime = $("#beginDate").val();
	var endTime = $("#endDate").val();
	var data = {type:"quit",
				quitName:quitName,
				departmentUuid:departmentUuid,
				departureTypeUuid:departureTypeUuid,
				startTime:startTime,
				endTime:endTime,
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
	buffer += "<table width='1100' border='0' cellpadding='0' cellspacing='0' class='InfoListPanel_color'>";
	buffer += "<tr><th width='20'></th><th width='70'>员工姓名</th><th width='100'>组织机构</th><th width='80'>离职类别</th><th width='135'>申请时间</th><th width='70'>分校校长</th><th width='70'>审核状态</th><th width='115'>人力资源处处长</th><th width='70'>审核状态</th><th width='60'>副校长</th><th width='70'>审核状态</th><th width='60'>校长</th><th width='70'>审核状态</th><th width='110'>操作</th></tr>";
	for(var i=0;i<dataStore.length;i++){
		if(i%2==0){
			buffer += "<tr class='tr1'>";
		}
		else {
			buffer += "<tr class='tr2'>";
		}
		buffer += "<td align='center'>"+dataStore[i][0]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][11]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][14]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][15]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][2]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][3]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][16]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][5]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][17]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][7]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][18]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][9]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][19]+"</td>";
		buffer += "<td align='center'>";
		buffer += "<a href='javascript:showInstance(\""+dataStore[i][13]+"\",\"\",\"/views/resource/human/manage/apply/manage/quit/apply/forward_view_apply.html\",600,700)'>查看</a>&nbsp;";
		if(dataStore[i][20]=="<%=Constants.EXAMINATION_STATE_DOING %>"){
			if(dataStore[i][3]==""){
				buffer += "<a href='javascript:editInstance(\""+dataStore[i][13]+"\", \"/https/resource/human/manage/apply/manage/quit/apply/forward_edit_apply.html\")'>编辑</a>&nbsp;";
				buffer += "<a href='javascript:removeInstance(\""+dataStore[i][13]+"\")'>删除</a>&nbsp;";
			}	
			else{
				buffer += "<a title='领导已审核，不能编辑！'><font color='#888888'>编辑</font></a>&nbsp;";
				buffer += "<a title='领导已审核，不能删除！'><font color='#888888'>删除</font></a>&nbsp;";
			}
		}	
		else if(dataStore[i][20]=="<%=Constants.EXAMINATION_STATE_PASSED %>"){
			buffer += "<a title='审核已结束，不能编辑！'><font color='#888888'>编辑</font></a>&nbsp;";
			buffer += "<a title='审核已结束，不能删除！'><font color='#888888'>删除</font></a>&nbsp;";
		}
		else{
			buffer += "<a title='审核已结束，不能编辑！'><font color='#888888'>编辑</font></a>&nbsp;";
			buffer += "<a href='javascript:removeInstance(\""+dataStore[i][13]+"\")'>删除</a>&nbsp;";
		}	
		buffer += "</td>";
		buffer += "</tr>";
	}
	buffer += "</table></div>";
	return buffer;
}
function removeInstance(uuid){
	if(confirm("确认删除？")){
		$.post(cp+"/ajaxs/resource/human/manage/apply/manage/quit/apply/remove_apply.html",{uuid:uuid},function(){
			execute();
		})
	}
}
</script>
<div style="font-family:黑体;font-size:20px;">&nbsp;员 工 离 职 申 请</div>
<br><br><br>
<table align="left" width="720" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="100">员工姓名</th>
		<td width="140">
			<input type="text" id="name" style="width:100px" />
		</td>
		<th width="100">组织机构</th>
		<td width="140">
			<label type="text" id="departmentUuid" class="BaseTree" javaClassName="Department"></label>
		</td>
		<th width="100">离职类别</th>
		<td width="140">
			<label type="text" id="departureTypeUuid" class="BaseTree" javaClassName="DepartureType"></label>
		</td>
	</tr>
	<tr>
		<th width="100">申请时间</th>
		<td colspan="5">
			<label type="text" id="beginDate" class="DateTimeSingle" format="all"></label>&nbsp;-&nbsp;<label type="text" id="endDate" class="DateTimeSingle" format="all"></label>
		</td>
	</tr>
</table>
<br><br><br><br><br>
<a href="#" onclick="execute()">
<img src="<%=request.getContextPath()%>/images/button/b_search.gif" /></a>
&nbsp;&nbsp;&nbsp;&nbsp;
<a href="<%=request.getContextPath()%>/https/resource/human/manage/apply/manage/quit/apply/create_quit_apply.html" >
<img src="<%=request.getContextPath()%>/images/button/create_apply.gif" /></a>
<br><br>
<div id="result" class="bigResultCon" style="width:740px;margin-left:-10px"></div>
</body>
</html>
