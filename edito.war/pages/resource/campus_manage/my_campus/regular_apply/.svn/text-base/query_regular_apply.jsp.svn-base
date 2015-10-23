<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.ito.edito.util.Constants" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
	<title>转正申请</title>
</head>

<body>
<form id="form" name="form" method="post">
<input type="hidden" name="uuid" />
<input type="hidden" name="resultCode" />
</form>
<script>
Validation.init("resource/campus_manage/my_campus/regular_apply/create_regular_apply.xml");
var num=0;
$(document).ready(function(){
	currentResultTableDivWidth = 750;
	execute();
});
function execute(){
	var beginDate = $("#beginDate").val();
	var endDate = $("#endDate").val();
	var data = {beginDate:beginDate,
				endDate:endDate,
				offset:1,
				recnum:24};
	$.ajax({
		type: "POST",
		url: cp+"/ajaxs/resource/campus/manage/my/campus/regular/apply/query_regular_apply.html",
		data:data,
		cache: false,
		dataType: "json",
		success: function(msg){
			if(msg!=null){
				$("#result").pagination({
					totalRecord:msg[1],
					dataStore:msg[0],
					proxyUrl:cp+"/ajaxs/resource/campus/manage/my/campus/regular/apply/query_regular_apply.html",
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
	screening();
}
function addData(dataStore){
	num = dataStore.length;
	hideDiv("createApply");
	var buffer="";
	buffer += "<div class='resultTableDiv' style='width:" + currentResultTableDivWidth + "px;overflow:auto'>";
	buffer += "<table width='750' border='0' cellpadding='0' cellspacing='0' class='InfoListPanel_color'>";
	buffer += "<tr><th width='30'></th><th width='120'>申请时间</th><th width='100'>组织机构</th><th width='100'>校区</th><th width='100'>岗位</th><th width='80'>审批状态</th><th width='120'>操作</th></tr>";
	for(var i=0;i<dataStore.length;i++){
		if(i%2==0){
			buffer += "<tr class='tr1'>";
		}
		else {
			buffer += "<tr class='tr2'>";
		}
		buffer += "<td align='center'>"+dataStore[i][0]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][1]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][2]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][3]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][4]+"</td>";
		buffer += "<td align='center'>"+dataStore[i][5]+"</td>";
		if(dataStore[i][5] == "未审批") {
			buffer += "<td align='center'><a href='javascript:showInstance(\""+dataStore[i][6]+"\",\"\",\"/views/resource/campus/manage/my/campus/regular/apply/forward_view_regular.html\",600,700)'>查看</a>&nbsp;";
			buffer += "<a href='javascript:editInstance(\""+dataStore[i][6]+"\",\"/https/resource/campus/manage/my/campus/regular/apply/forward_edit_regular.html\")'>编辑</a>&nbsp;";
			buffer += "<a href='javascript:removeInstance(\""+dataStore[i][6]+"\")'>删除</a>";
		}
		else {
			buffer += "<td align='center'><a href='javascript:showInstance(\""+dataStore[i][6]+"\",\"\",\"/views/resource/campus/manage/my/campus/regular/apply/forward_view_regular.html\",600,700)'>查看</a>&nbsp;";
			buffer += "<a title='领导正在审核，不能编辑！'><font color='#888888'>编辑</font></a>&nbsp;";
			buffer += "<a title='领导正在审核，不能删除！'><font color='#888888'>删除</font></a>";
		}	
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
function screening(){
	if("<s:property value="#session.LOGIN_EMPLOYEE.workingStateUuid" />" != "10000000010140001001000000000020") {
		$("#createApp").css("display","none");
	}
	else {
		$("#createApp").css("display","inline");
	}

}
function showDiv(id){
	$("#"+id).css("display","block");
}
function hideDiv(id){
	$("#"+id).css("display","none");
}
function createInstance(elementId){
		if(Validation.excuteValidate(elementId)){
			if(confirm("确认操作？")){
				var param = Submit.excute(elementId);
				$.post(cp+"/ajaxs/resource/campus/manage/my/campus/quits/apply/create_apply.html",param,function(data){
					location.href = cp + "/pages/resource/campus/manage/my/campus/regular/apply/query_regular_apply.html";
				});
			}
		}
}
</script>
<div style="font-family:黑体;font-size:20px;">&nbsp;转 正 申 请</div>
<br><br><br>
<table align="left" width="350" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="80">申请时间</th>
		<td width="270">
			<label type="text" id="beginDate" class="DateTimeSingle" format="all"></label>&nbsp;-&nbsp;<label type="text" id="endDate" class="DateTimeSingle" format="all"></label>
		</td>
	</tr>
</table>
<br><br><br>
<a href="#" onclick="execute()">
<img src="<%=request.getContextPath()%>/images/button/b_search.gif" /></a>
<br><br>
<div id="result" class="bigResultCon" style="width:750px;margin-left:0px"></div>
<br>
<div id="createApp" style="display:none"><a href="javascript:showDiv('createApply')">
<img src="<%=request.getContextPath()%>/images/button/create_apply.gif" /></a></div>
<br><br>
<div id="createApply" style="display:none">
<form id="formA">
<input type="hidden" name="instance(Apply).stateUuid" value="<%=Constants.EXAMINATION_STATE_DOING %>"/>
<input type="hidden" name="instance(Apply).typeUuid" value="<%=Constants.APPLY_TYPE_UUID_REGULAR %>"/>
<table width="580" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="160">申请人：</th>
		<td width="130">
			<s:property value="#session.LOGIN_USER.person.name" />
			<input type="hidden" name="instance(RegularApplication).Apply.applicantUuid" value="<s:property value='#session.LOGIN_EMPLOYEE.uuid' />" />
		</td>
		<th width="160">组织机构：</th>
		<td width="130">
			<s:property value="#session.LOGIN_EMPLOYEE.department.description" />
			<input type="hidden" name="instance(RegularApplication).departmentUuid" value="<s:property value='#session.LOGIN_EMPLOYEE.departmentUuid' />" />
		</td>
	</tr>
	<tr>
		<th width="160">校区：</th>
		<td width="130">
			<s:property value="#session.LOGIN_EMPLOYEE.campus.description" />
			<input type="hidden" name="instance(RegularApplication).campusUuid" value="<s:property value='#session.LOGIN_EMPLOYEE.campusUuid' />" />
		</td>
		<th width="160">岗位：</th>
		<td width="130">
			<s:property value="#session.LOGIN_EMPLOYEE.job.description" />
			<input type="hidden" name="instance(RegularApplication).jobUuid" value="<s:property value='#session.LOGIN_EMPLOYEE.jobUuid' />" />
		</td>
	</tr>
	<tr>
		<th width="160">试用期起止时间：</th>
		<td colspan="3">
			<label type="text" id="beginDate" name="instance(RegularApplication).fromDt" class="DateTimeSingle" format="all" validate="true"></label>&nbsp;-&nbsp;<label type="text" id="endDate" name="instance(RegularApplication).toDt" class="DateTimeSingle" format="all" validate="true"></label>&nbsp;<font color="#996633">*</font>
		</td>
	</tr>
	<tr>
		<th width="160">试用期述职<br>(工作内容和成果)：</th>
		<td colspan="3"><textarea id="debrief" name="instance(RegularApplication).debrief" style="width:400px;height:80px" validate="true"></textarea>&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<th width="160">转正后工作<br>开展计划：</th>
		<td colspan="3"><textarea id="workPlan" name="instance(RegularApplication).workPlan" style="width:400px;height:80px" validate="true"></textarea>&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<th width="160">其他建议：</th>
		<td colspan="3"><textarea id="suggestion" name="instance(RegularApplication).suggestion" style="width:400px;height:80px"></textarea></td>
	</tr>
</table></form>
<br>
<a href="javascript:createInstance('formA')" >
<img src="<%=request.getContextPath()%>/images/button/b_confirm_2.gif" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="javascript:hideDiv('createApply')">
<img src="<%=request.getContextPath()%>/images/button/b_cancel.gif" /></a></div>
</body>
</html>
