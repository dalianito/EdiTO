<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.ito.edito.util.Constants" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
	<title>创建月度自评</title>
</head>
<body>
<script>
function createInstance(elementId){
	if(confirm("确认操作？")){
		var param = Submit.excute(elementId);
		$.post(cp+"/ajaxs/resource/campus/manage/my/campus/self/assess/create_employee_assess.html",param,function(data){
			location.href = cp + "/pages/resource/campus/manage/my/campus/self/assess/query_employee_assess.html";
		});
	}
}
</script>
<div style="font-family:黑体;font-size:20px;">&nbsp;月 度 自 评</div>
<br><br><br>
<form id="formA">
<s:if test="%{#session.LOGIN_EMPLOYEE.workingStateUuid == '10000000010140001001000000000020'}">
	<div><font style="font-weight:bold;font-size:12px" color="FF0033">（试用期自评）</font></div>
	<input type="hidden" name="instance(SelfAssess).selfAssessTypeUuid" value="<%=Constants.SELFASSESS_TYPE_PROBATION %>"/>
</s:if>
<s:else>
	<input type="hidden" name="instance(SelfAssess).selfAssessTypeUuid" value="<%=Constants.SELFASSESS_TYPE_FORMAL %>"/>
</s:else>
<input type="hidden" name="instance(SelfAssess).assessStateUuid" value="<%=Constants.ASSESS_STATE_NO %>"/>
<table width="580" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="160">申请人：</th>
		<td width="130">
			<s:property value="#session.LOGIN_USER.person.name" />
			<input type="hidden" name="instance(SelfAssess).selfAssessEmployeeUuid" value="<s:property value='#session.LOGIN_EMPLOYEE.uuid' />" />
		</td>
		<th width="160">组织机构：</th>
		<td width="130">
			<s:property value="#session.LOGIN_EMPLOYEE.department.description" />
			<input type="hidden" name="instance(SelfAssess).departmentUuid" value="<s:property value='#session.LOGIN_EMPLOYEE.departmentUuid' />" />
		</td>
	</tr>
	<tr>
		<th width="160">校区：</th>
		<td width="130">
			<s:property value="#session.LOGIN_EMPLOYEE.campus.description" />
			<input type="hidden" name="instance(SelfAssess).campusUuid" value="<s:property value='#session.LOGIN_EMPLOYEE.campusUuid' />" />
		</td>
		<th width="160">岗位：</th>
		<td width="130">
			<s:property value="#session.LOGIN_EMPLOYEE.job.description" />
			<input type="hidden" name="instance(SelfAssess).jobUuid" value="<s:property value='#session.LOGIN_EMPLOYEE.jobUuid' />" />
		</td>
	</tr>
<s:if test="%{#session.LOGIN_EMPLOYEE.workingStateUuid == '10000000010140001001000000000020'}">
	<tr>
		<th width="160">试用期起止时间：</th>
		<td colspan="3">
			<label type="text" id="beginDate" name="instance(SelfAssess).fromDt" class="DateTimeSingle" format="all" validate="true"></label>&nbsp;-&nbsp;<label type="text" id="endDate" name="instance(SelfAssess).toDt" class="DateTimeSingle" format="all" validate="true"></label>&nbsp;
		</td>
	</tr>
</s:if>
	<tr>
		<th width="160">主要工作内容：</th>
		<td colspan="3"><textarea id="debrief" name="instance(SelfAssess).workContant" style="width:420px;height:80px" validate="true"></textarea>&nbsp;</td>
	</tr>
	<tr>
		<th width="160">如何看待学校现<br>行的规章制度：</th>
		<td colspan="3"><textarea id="workPlan" name="instance(SelfAssess).thinkings" style="width:420px;height:80px" validate="true"></textarea>&nbsp;</td>
	</tr>
	<tr>
		<th width="160">成长与收获：</th>
		<td colspan="3"><textarea id="suggestion" name="instance(SelfAssess).harvest" style="width:420px;height:80px"></textarea></td>
	</tr>
	<tr>
		<th width="160">内观与反思：</th>
		<td colspan="3"><textarea id="suggestion" name="instance(SelfAssess).reflect" style="width:420px;height:80px"></textarea></td>
	</tr>
</table></form>
<br>
<a href="javascript:createInstance('formA')" >
<img src="<%=request.getContextPath()%>/images/button/b_confirm_2.gif" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="<%=request.getContextPath()%>/pages/resource/campus/manage/my/campus/self/assess/query_employee_assess.html" >
<img src="<%=request.getContextPath()%>/images/button/b_cancel.gif" /></a>
<br>
</body>
</html>
