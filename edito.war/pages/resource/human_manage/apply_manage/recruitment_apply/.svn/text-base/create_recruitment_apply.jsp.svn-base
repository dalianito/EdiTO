<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.ito.edito.util.Constants" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
	<title>新建人员需求申请</title>
</head>
<body>
<script>
Validation.init("resource/human_manage/apply_manage/recruitment_apply/create_recruitment_apply.xml");
var mark = true;
function createInstance(elementId){
	if(mark){
		if(Validation.excuteValidate(elementId)){
			if(confirm("确认操作？")){
				mark = false;
				var param = Submit.excute(elementId);
				$.post(cp+"/ajaxs/resource/human/manage/apply/manage/recruitment/apply/create_apply.html",param,function(data){
					location.href = cp + "/pages/resource/human/manage/apply/manage/recruitment/apply/query_recruitment_apply.html";
				});
			}
		}
	}
	else {
		alert("操作进行中，请勿重复点击！");
	}
}
</script>
<div style="font-family:黑体;font-size:20px;">&nbsp;人 员 需 求 申 请</div>
<br><br><br>
<form id="formA">
<input type="hidden" name="instance(Apply).stateUuid" value="<%=Constants.EXAMINATION_STATE_DOING %>"/>
<input type="hidden" name="instance(Apply).typeUuid" value="<%=Constants.APPLY_TYPE_UUID_RECRUITMENT %>"/>
<table width="580" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="130">需求部门：</th>
		<td width="450" colspan="3"><label name="instance(Recruitment).departmentUuid" class="BaseTree" javaClassName="Department" validate="true"></label>&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<th width="130">现有人数：</th>
		<td width="160"><input name="instance(Recruitment).existingNo" style="width:50px" validate="true" >人&nbsp;</td>
		<th width="130">预算人数：</th>
		<td><input name="instance(Recruitment).budgetNo" style="width:50px" validate="true" >人&nbsp;</td>
	</tr>
	<tr>
		<th width="130">职位名称：</th>
		<td width="160"><input name="instance(Recruitment).position" style="width:50px" validate="true" >&nbsp;<font color="#996633">*</font></td>
		<th width="130">需求人数：</th>
		<td width="160"><input name="instance(Recruitment).demandNo" style="width:50px" validate="true" >人&nbsp;</td>
	</tr>
	<tr>
		<th width="130">级别：</th>
		<td width="450"colspan="3"><label name="instance(Recruitment).rankUuid" style="width:50px" class="BaseTree" javaClassName="LevelType" validate="true" ></label>&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<th width="130">直接上级：</th>
		<td width="160"><input name="instance(Recruitment).leaderUuid"
			class="DropMenu"
			actionPath="<%=request.getContextPath() %>/ajaxs/drop/menu/query_employee_drop_menu.html"
			validate="true" >&nbsp;</td>
		<th width="130">直接下级：</th>
		<td width="160"><input name="instance(Recruitment).subordinateUuid"
			class="DropMenu"
			actionPath="<%=request.getContextPath() %>/ajaxs/drop/menu/query_employee_drop_menu.html"
			validate="true" >&nbsp;</td>
	</tr>
	<tr>
		<th width="130">下属人数：</th>
		<td width="160"><input name="instance(Recruitment).subordinatesNo" style="width:50px" validate="true" >人&nbsp;</td>
		<th width="130">其他：</th>
		<td width="160"><label name="instance(Recruitment).otherUuid" style="width:50px" class="BaseTree" javaClassName="OtherType" validate="true" ></label>&nbsp;</td>
	</tr>
	<tr>
		<th width="130">试用期最低工资：</th>
		<td width="160"><input name="instance(Recruitment).probationLow" style="width:50px" validate="true" >元&nbsp;</td>
		<th width="130">试用期最高工资：</th>
		<td width="160"><input name="instance(Recruitment).probationHigh" style="width:50px" validate="true" >元&nbsp;</td>
	</tr>
	<tr>
		<th width="130">转正最低工资：</th>
		<td width="160"><input name="instance(Recruitment).positiveLow" style="width:50px" validate="true" >元 &nbsp;</td>
		<th width="130">转正最高工资：</th>
		<td><input name="instance(Recruitment).positiveHigh" style="width:50px" validate="true" >元&nbsp;</td>
	</tr>
	<tr>
		<th width="130">其他福利待遇：</th>
		<td width="450" colspan="3"><input name="instance(Recruitment).welfare" style="width:50px" validate="true" >&nbsp;</td>
	</tr>
	<tr>
		<th width="130">工作职责：</th>
		<td width="450" colspan="3"><textarea name="instance(Recruitment).duty" style="width:410px;height:50px" validate="true" ></textarea>&nbsp;</td>
	</tr>
	<tr>
		<th width="130">性别：</th>
		<td width="450" colspan="3"><label name="instance(Recruitment).genderUuid" class="BaseTree" javaClassName="Gender" validate="true" ></label>&nbsp;</td>
	</tr>
	<tr>
		<th width="130">最小年龄：</th>
		<td width="160"><input name="instance(Recruitment).ageLow" style="width:50px" validate="true" >岁&nbsp;</td>
		<th width="130">最大年龄：</th>
		<td width="160"><input name="instance(Recruitment).ageHigh" style="width:50px" validate="true" >岁&nbsp;</td>
	</tr>
	<tr>
		<th width="130">学历：</th>
		<td width="160"><label name="instance(Recruitment).educationUuid" class="BaseTree" javaClassName="Education" validate="true" ></label>&nbsp;</td>
		<th width="130">主修专业：</th>
		<td width="160"><input name="instance(Recruitment).major" style="width:100px" validate="true" >&nbsp;</td>
	</tr>
	<tr>
		<th width="130">专业技术：</th>
		<td colspan="3"><textarea name="instance(Recruitment).professional" style="width:410px;height:30px" validate="true" ></textarea>&nbsp;</td>
	</tr>
	<tr>
		<th width="130">管理能力：</th>
		<td width="450" colspan="3"><textarea name="instance(Recruitment).managementAbility" style="width:410px;height:30px" validate="true" ></textarea>&nbsp;</td>
	</tr>
	<tr>
		<th width="130">工作背景：</th>
		<td width="450" colspan="3"><textarea name="instance(Recruitment).background" style="width:410px;height:30px" validate="true" ></textarea>&nbsp;</td>
	</tr>
	<tr>
		<th width="130">其他技术：</th>
		<td width="450" colspan="3"><textarea name="instance(Recruitment).otherTechnology" style="width:410px;height:30px" validate="true" ></textarea>&nbsp;</td>
	</tr>
	<tr>
		<th width="130">希望几周内到岗：</th>
		<td width="160"><input name="instance(Recruitment).weeks" style="width:50px" validate="true" >周&nbsp;<font color="#996633">*</font></td>
		<th width="130">希望到岗日期：</th>
		<td width="160"><label name="instance(Recruitment).specificTime" class="DateTimeSingle" format="all" validate="true"></label>&nbsp;<font color="#996633">*</font></td>
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
<a href="<%=request.getContextPath()%>/pages/resource/human/manage/apply/manage/recruitment/apply/query_recruitment_apply.html" >
<img src="<%=request.getContextPath()%>/images/button/b_cancel.gif" /></a>
<br>
</form>
</body>
</html>
