<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.ito.edito.util.Constants" %>
<html>
<head>
	<title>人员需求申请</title>
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
	var name = $("#name").val();
	var departmentUuid = $("#departmentUuid").val();
	var startTime = $("#beginDate").val();
	var endTime = $("#endDate").val();
	var data = {type:"recruitment",
				name:name,
				departmentUuid:departmentUuid,
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
	buffer += "<table width='880' border='0' cellpadding='0' cellspacing='0' class='InfoListPanel_color'>";
	buffer += "<tr><th width='20'></th><th width='70'>申请人</th><th width='90'>需求部门</th><th width='135'>申请时间</th><th width='70'>部门处长</th><th width='70'>审核状态</th><th width='115'>人力资源处处长</th><th width='70'>审核状态</th><th width='60'>校长</th><th width='70'>审核状态</th><th width='110'>操作</th></tr>";
	for(var i=0;i<dataStore.length;i++){
		if(i%2==0){
			buffer += "<tr class='tr1'>";
		}
		else {
			buffer += "<tr class='tr2'>";
		}
		buffer += "<td align='center'>"+dataStore[i][0]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][1]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][9]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][2]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][3]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][12]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][5]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][13]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][7]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][14]+"</td>";
		buffer += "<td align='center'>";
		buffer += "<a href='javascript:showInstance(\""+dataStore[i][11]+"\",\"\",\"/views/resource/human/manage/apply/manage/recruitment/apply/forward_view_apply.html\",600,700)'>查看</a>&nbsp;";
		if(dataStore[i][15]=="<%=Constants.EXAMINATION_STATE_DOING %>"){
			if(dataStore[i][3]==""){
				buffer += "<a href='javascript:editInstance(\""+dataStore[i][11]+"\", \"/https/resource/human/manage/apply/manage/recruitment/apply/forward_edit_apply.html\")'>编辑</a>&nbsp;";
				buffer += "<a href='javascript:removeInstance(\""+dataStore[i][11]+"\")'>删除</a>&nbsp;";
			}	
			else{
				buffer += "<a title='领导已审核，不能编辑！'><font color='#888888'>编辑</font></a>&nbsp;";
				buffer += "<a title='领导已审核，不能删除！'><font color='#888888'>删除</font></a>";
			}
		}	
		else if(dataStore[i][15]=="<%=Constants.EXAMINATION_STATE_PASSED %>"){
			buffer += "<a title='审核已结束，不能编辑！'><font color='#888888'>编辑</font></a>&nbsp;";
			buffer += "<a title='审核已结束，不能删除！'><font color='#888888'>删除</font></a>";
		}
		else{
			buffer += "<a title='审核已结束，不能编辑！'><font color='#888888'>编辑</font></a>&nbsp;";
			buffer += "<a href='javascript:removeInstance(\""+dataStore[i][11]+"\")'>删除</a>";
		}	
		buffer += "</td>";
		buffer += "</tr>";
	}
	buffer += "</table></div>";
	return buffer;
}
function removeInstance(uuid){
	if(confirm("确认删除？")){
		$.post(cp+"/ajaxs/resource/human/manage/apply/manage/recruitment/apply/remove_apply.html",{uuid:uuid},function(){
			execute();
		})
	}
}
</script>
<div style="font-family:黑体;font-size:20px;">&nbsp;人 员 需 求 申 请</div>
<br><br><br>
<table align="left" width="720" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="80">申请人</th>
		<td width="115">
			<input type="text" id="name" style="width:90px" />
		</td>
		<th width="80">需求部门</th>
		<td width="115">
			<label type="text" id="departmentUuid" class="BaseTree" javaClassName="Department"></label>
		</td>
		<th width="80">申请时间</th>
		<td width="250">
			<label type="text" id="beginDate" class="DateTimeSingle" format="all"></label>&nbsp;-&nbsp;<label type="text" id="endDate" class="DateTimeSingle" format="all"></label>
		</td>
	</tr>
</table>
<br><br><br>
<a href="#" onclick="execute()">
<img src="<%=request.getContextPath()%>/images/button/b_search.gif" /></a>
&nbsp;&nbsp;&nbsp;&nbsp;
<a href="<%=request.getContextPath()%>/https/resource/human/manage/apply/manage/recruitment/apply/create_recruitment_apply.html" >
<img src="<%=request.getContextPath()%>/images/button/create_apply.gif" /></a>
<br><br>
<div id="result" class="bigResultCon" style="width:740px;margin-left:-10px"></div>
</body>
</html>
