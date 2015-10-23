<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
	<title>审批管理</title>
</head>

<body>
<form id="form" name="form" method="post">
<input type="hidden" name="uuid" />
<input type="hidden" name="resultCode" />
</form>

<script>
$(document).ready(function(){
	currentResultTableDivWidth = 900;
	$(".leftMenu").css("display", "none");
	execute();
});
function execute(){
	var name = $("#name").val();
	var startTime = $("#startTime").val();
	var endTime = $("#endTime").val();
	var departmentUuid = $("#departmentUuid").val();
	var stateUuid = $("#stateUuid").val();
	var sortField = $("#sortField option:selected").val();
	var data = {type:"leave",
				name:name,
				startTime:startTime,
				endTime:endTime,
				departmentUuid:departmentUuid,
				stateUuid:stateUuid,
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
	var buffer = "";
	buffer += "<div class='resultTableDiv' style='width:"+currentResultTableDivWidth+"px;overflow:auto'>";
	buffer += "<table width='900' border='0' cellpadding='0' cellspacing='0' class='InfoListPanel_color'>";
	buffer += "<tr><th width='20'></th><th width='70'>申请人</th><th width='90'>申请时间</th><th width='70'>主管领导</th><th width='90'>审批时间</th><th width='70'>分校校长</th><th width='90'>审批时间</th><th width='70'>校长</th><th width='90'>审批时间</th><th width='90'>组织机构</th><th width='80'>审批状态</th><th width='70'>操作</th></tr>";
	if(dataStore.length > 0){
		for(var i=0; i<dataStore.length; i++){
			if(i%2==0){
				buffer +="<tr class='tr1'>"
			}
			else{
				buffer +="<tr class='tr2'>"
			}
			buffer += "<td>"+dataStore[i][0]+"</td>";
			buffer += "<td>"+dataStore[i][1]+"</td>";
			buffer += "<td>"+dataStore[i][2]+"</td>";
			buffer += "<td>"+dataStore[i][3]+"</td>";
			buffer += "<td>"+dataStore[i][4]+"</td>";
			buffer += "<td>"+dataStore[i][5]+"</td>";
			buffer += "<td>"+dataStore[i][6]+"</td>";
			buffer += "<td>"+dataStore[i][7]+"</td>";
			buffer += "<td>"+dataStore[i][8]+"</td>";
			buffer += "<td>"+dataStore[i][9]+"</td>";
			buffer += "<td>"+dataStore[i][10]+"</td>";
			buffer += "<td align='center'><a href='javascript:showInstance(\""+dataStore[i][11]+"\",\"\",\"/views/resource/campus/manage/my/campus/leave/apply/forward_view_apply.html\",600,700)'>查看</a></td>";
			buffer += "</tr>";
		}
	}
	else {
		buffer += "<tr><td colspan='12'>&nbsp;<font color='red'>无查询结果！</font></td></tr>";
	}
	buffer += "</table></div>";
	return buffer;
}
</script>
<div style="font-family:黑体;font-size:20px;">&nbsp;审 批 管 理</div>
<br>
<div style="font-size:16px;font-weight:bold;margin-top:20px;margin-bottom:10px">员工请假申请</div>
<table align="left" width="900" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="80">申请人</th>
		<td width="110">
			<input id="name" size="11" />
		</td>
		<th width="80">申请日期</th>
		<td width="260">
			<label type="text" id="startTime" class="DateTimeSingle" format="all"></label>&nbsp;-&nbsp;<label type="text" id="endTime" class="DateTimeSingle" format="all"></label>
		</td>
		<th width="80">组织机构</th>
		<td width="100">
			<label id="departmentUuid" class="BaseTree" javaClassName="Department" ></label>
		</td>
		<th width="80">审批状态</th>
		<td width="100">
			<label id="stateUuid" class="BaseTree" javaClassName="ExaminationState" ></label>
		</td>
	</tr>
</table>
<br><br><br>
<a href="#" onclick="execute()">
<img src="<%=request.getContextPath()%>/images/button/b_search.gif" /></a>
<div style="display:inline;float:right;margin-right:0px">
排序：<select id="sortField" onchange="execute()">
		<option value="A.applicationTime" selected="selected">申请时间</option>
		<option value="A.stateUuid">审核状态</option>
		<option value="L.departmentUuid">组织机构</option>
	</select>
</div>
<br><br>
<div id="result" class="bigResultCon" style="width:900px;margin-left:-10px"></div>
<br>
<a href="<%=request.getContextPath()%>/pages/resource/approval/manage/query_approval_manage.html">
<img src="<%=request.getContextPath()%>/images/button/b_back.gif" /></a>
</body>
</html>
