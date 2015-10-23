<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.ito.edito.util.Constants" %>
<html>
<head>
	<title>请假申请</title>
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
	var applicationType = "<%=Constants.APPLY_TYPE_UUID_LEAVE %>";
	var myself = "myself";
	var leaveUuid = $("#leaveUuid").val();
	var beginDate = $("#beginDate").val();
	var endDate = $("#endDate").val();
	var data = {myself:myself,
				applicationType:applicationType,
				beginDate:beginDate,
				endDate:endDate,
				leaveUuid:leaveUuid,
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
	buffer += "<table width='800' border='0' cellpadding='0' cellspacing='0' class='InfoListPanel_color'>";
	buffer += "<tr><th width='20'></th><th width='70'>请假类别</th><th width='135'>申请时间</th><th width='70'>主管领导</th><th width='70'>审核状态</th><th width='115'>分校校长</th><th width='70'>审核状态</th><th width='60'>校长</th><th width='70'>审核状态</th><th width='120'>操作</th></tr>";
	for(var i=0;i<dataStore.length;i++){
		if(i%2==0){
			buffer += "<tr class='tr1'>";
		}
		else {
			buffer += "<tr class='tr2'>";
		}
		buffer += "<td align='center'>"+dataStore[i][0]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][4]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][14]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][7]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][8]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][9]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][10]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][11]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][12]+"</td>";
		buffer += "<td align='center'>";
		buffer += "<a href='javascript:showInstance(\""+dataStore[i][5]+"\",\"\",\"/views/resource/campus/manage/my/campus/leave/apply/forward_view_apply.html\",600,700)'>查看</a>&nbsp;";
		if(dataStore[i][6]=="<%=Constants.EXAMINATION_STATE_DOING %>"){
			if(dataStore[i][7]==""){
				buffer += "<a href='javascript:editInstance(\""+dataStore[i][5]+"\", \"/https/resource/campus/manage/my/campus/leave/apply/forward_edit_apply.html\")'>编辑</a>&nbsp;";
				buffer += "<a href='javascript:removeInstance(\""+dataStore[i][5]+"\")'>删除</a>";
			}	
			else{
				buffer += "<a title='领导已审核，不能编辑！'><font color='#888888'>编辑</font></a>&nbsp;";
				buffer += "<a title='领导已审核，不能删除！'><font color='#888888'>删除</font></a>";
			}
		}	
		else if(dataStore[i][6]=="<%=Constants.EXAMINATION_STATE_PASSED %>"){
			buffer += "<a title='审核已结束，不能编辑！'><font color='#888888'>编辑</font></a>&nbsp;";
			buffer += "<a title='审核已结束，不能删除！'><font color='#888888'>删除</font></a>";
		}
		else{
			buffer += "<a title='审核已结束，不能编辑！'><font color='#888888'>编辑</font></a>&nbsp;";
			buffer += "<a href='javascript:removeInstance(\""+dataStore[i][5]+"\")'>删除</a>";
		}	
		buffer += "</td>";
		buffer += "</tr>";
	}
	buffer += "</table></div>";
	return buffer;
}
function removeInstance(uuid){
	if(confirm("确认删除？")){
		$.post(cp+"/ajaxs/resource/campus/manage/my/campus/leave/apply/remove_apply.html",{uuid:uuid},function(){
			execute();
		})
	}
}
</script>
<div style="font-family:黑体;font-size:20px;">&nbsp;请 假 申 请</div>
<br><br><br>
<table align="left" width="540" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="80">请假类别</th>
		<td width="120">
			<label id="leaveUuid" class="BaseTree" javaClassName="LeaveType"></label>
		</td>
		<th width="80">申请时间</th>
		<td width="240">
			<label type="text" id="beginDate" class="DateTimeSingle" format="all"></label>&nbsp;-&nbsp;<label type="text" id="endDate" class="DateTimeSingle" format="all"></label>
		</td>
	</tr>
</table>
<br><br><br>
<a href="#" onclick="execute()">
<img src="<%=request.getContextPath()%>/images/button/b_search.gif" /></a>
&nbsp;&nbsp;&nbsp;&nbsp;
<a href="<%=request.getContextPath()%>/https/resource/campus/manage/my/campus/leave/apply/create_leave_apply.html" >
<img src="<%=request.getContextPath()%>/images/button/create_apply.gif" /></a>
<br><br>
<div id="result" class="bigResultCon" style="width:740px;margin-left:-10px"></div>
</body>
</html>
