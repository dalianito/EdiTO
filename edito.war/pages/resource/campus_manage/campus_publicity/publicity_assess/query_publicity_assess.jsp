<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ page import="com.ito.edito.util.Constants" %>
<html>
<head>
	<title>活动评估</title>
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
	var applicationStateUuid = $("#applicationStateUuid").val();
	var beginDate = $("#beginDate").val();
	var endDate = $("#endDate").val();
	var data = {name:name,
				departmentUuid:departmentUuid,
				applicationStateUuid:applicationStateUuid,
				beginDate:beginDate,
				endDate:endDate,
				flag:1,
				offset:1,
				recnum:24};
	$.ajax({
		type: "POST",
		url: cp+"/ajaxs/resource/campus/manage/campus/publicity/publicity/apply/query_publicity_apply.html",
		data:data,
		cache: false,
		dataType: "json",
		success: function(msg){
			if(msg!=null){
				$("#result").pagination({
					totalRecord:msg[1],
					dataStore:msg[0],
					proxyUrl:cp+"/ajaxs/resource/campus/manage/campus/publicity/publicity/apply/query_publicityApply.html",
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
	buffer +="<div class='resultTableDiv' style='width:"+currentResultTableDivWidth+"px;overflow:auto'>";
	buffer +="<table width='650' border='0' cellpadding='0' cellspacing='0' class='InfoListPanel_color'>";
	buffer += "<tr><th width='20'></th><th width='70'>申请人</th><th width='140'>申请时间</th><th width='80'>组织机构</th><th width='80'>校区</th><th width='140'>活动时间</th><th width='120'>操作</th></tr>";
	for(var i=0;i<dataStore.length;i++){
		if(i%2==0){
			buffer +="<tr class='tr1' title='活动简述："+dataStore[i][6]+"'>";
		}
		else{
			buffer +="<tr class='tr2' title='活动简述："+dataStore[i][6]+"'>";
		}
		buffer += "<td align='center'>"+dataStore[i][0]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][1]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][2]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][4]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][5]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][7]+"</td>";
		buffer += "<td align='center'>";
		if(dataStore[i][12]!= ""){
			buffer += "<a title='评估已完成，不能继续评估！'><font color='#888888'>评估</font></a>&nbsp;";
		}
		else{
			buffer += "<a href='javascript:editInstance(\""+dataStore[i][10]+"\",\"/https/resource/campus/manage/campus/publicity/publicity/assess/forward_edit_publicity_assess.html\")'>评估</a>&nbsp;";
		}		
		buffer += "<a href='javascript:showInstance(\""+dataStore[i][10]+"\",\"\",\"/views/resource/campus/manage/campus/publicity/publicity/apply/forward_view_apply.html\",600,700)'>查看</a>&nbsp;";
		buffer += "</td>";
		buffer += "</tr>";
		}
	buffer += "</table></div>";
	return buffer;
}
function removeInstance(uuid){
	if(confirm("确认删除？")){
		$.post(cp+"/ajaxs/resource/campus/manage/campus/publicity/publicity/apply/remove_apply.html",{uuid:uuid},function(){
			execute();
		})
	}
}
</script>
<div style="font-family:黑体;font-size:20px;">&nbsp;活 动 评 估</div>
<br><br><br>
<table align="left" width="650" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="100">申请人</th>
		<td width="200">
			<input id="name" name="name" size="11"/>
		</td>
		<th width="100" >组织机构</th>
		<td width="250" >
			<label id="departmentUuid" class="BaseTree" javaClassName="Department" ></label>
		</td>
	</tr>
	<tr>
		<th width="100" >校区</th>
		<td width="200" >
			<font color="red"><s:property value="#session.LOGIN_EMPLOYEE.campus.description" /></font>
		</td>
		<th width="100" >申请时间</th>
		<td width="250">
			<label type="text" id="beginDate" class="DateTimeSingle" format="all"></label>&nbsp;-&nbsp;<label type="text" id="endDate" class="DateTimeSingle" format="all"></label>
		</td>
	</tr>
</table>
<br><br><br><br><br>
<a href="#" onclick="execute()">
<img src="<%=request.getContextPath()%>/images/button/b_search.gif" /></a>
&nbsp;&nbsp;&nbsp;&nbsp;
<br><br>
<div id="result" class="bigResultCon" style="width:720px;margin-left:-10px"></div>
</body>
</html>
