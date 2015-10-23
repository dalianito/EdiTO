<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.ito.edito.util.Constants" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
	<title>新建员工离职申请</title>
</head>
<body>
<script>
Validation.init("resource/human_manage/apply_manage/quit_apply/create_quit_apply.xml");
var mark = true;
function createInstance(elementId){
	if(mark){
		if(Validation.excuteValidate(elementId)){
			if(confirm("确认操作？")){
				mark = false;
				var param = Submit.excute(elementId);
				$.post(cp+"/ajaxs/resource/human/manage/apply/manage/quit/apply/create_apply.html",param,function(data){
					location.href = cp + "/pages/resource/human/manage/apply/manage/quit/apply/query_quit_apply.html";
				});
			}
		}
	}
	else {
		alert("操作进行中，请勿重复点击！");
	}
}
function updateRelation(data){
	$("label[name='instance(Quit).departmentUuid']").val(data["employee"].departmentUuid);
}
function clearRelationData(relationId){
	$("label[name='instance(Quit).departmentUuid']").val("");
}
</script>
<div style="font-family:黑体;font-size:20px;">&nbsp;员 工 离 职 申 请</div>
<br><br><br>
<form id="formA">
<input type="hidden" name="instance(Apply).stateUuid" value="<%=Constants.EXAMINATION_STATE_DOING %>"/>
<input type="hidden" name="instance(Apply).typeUuid" value="<%=Constants.APPLY_TYPE_UUID_QUIT %>"/>
<table width="580" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="130">员工姓名：</th>
		<td width="160"><input name="instance(Quit).employeeUuid"
			nextSiblingName="employeeName"
			class="DropMenu"
			actionPath="<%=request.getContextPath() %>/ajaxs/drop/menu/query_employee_drop_menu.html"
			execute="true"
			executeUrl="<%=request.getContextPath() %>/ajaxs/drop/menu/query_employee_info.html"
			relationId="curPerson" validate="true" >&nbsp;<font color="#996633">*</font></td>
		<th width="130">组织机构：</th>
		<td width="160"><label name="instance(Quit).departmentUuid" class="BaseTree" javaClassName="Department" validate="true" ></label>&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<th width="130">离职类别：</th>
		<td width="160"><label name="instance(Quit).departureTypeUuid" class="BaseTree" javaClassName="DepartureType" validate="true" ></label>&nbsp;<font color="#996633">*</font></td>
		<th width="130">离职时间：</th>
		<td width="160"><label name="instance(Quit).departureTime" class="DateTimeSingle" format="all" validate="true"></label>&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<th width="130">离职原因：</th>
		<td colspan="3"><textarea name="instance(Quit).reason" style="width:410px;height:80px" validate="true" ></textarea>&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<th width="130">申请人：</th>
		<td width="450" colspan="3">
			<s:property value="#session.LOGIN_USER.person.name" />
		</td>
	</tr>
</table>
<br>
<a href="javascript:createInstance('formA')">
<img src="<%=request.getContextPath()%>/images/button/b_confirm_2.gif" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="<%=request.getContextPath()%>/pages/resource/human/manage/apply/manage/quit/apply/query_quit_apply.html" >
<img src="<%=request.getContextPath()%>/images/button/b_cancel.gif" /></a>
<br>
</form>
</body>
</html>
