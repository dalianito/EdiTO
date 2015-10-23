<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
	<title>编辑人员需求申请</title>
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
<s:iterator value="#request.recruitment">
<form id="formA">
<input type="hidden" name="instance(Apply).uuid" value="<s:property value='apply.uuid' />" />
<input type="hidden" name="instance(Apply).timeStamp" value="<s:property value='apply.timeStamp' />" />
<input type="hidden" name="instance(Apply).typeUuid" value="<s:property value='apply.typeUuid' />" />
<input type="hidden" name="instance(Apply).stateUuid" value="<s:property value='apply.stateUuid' />" />
<input type="hidden" name="instance(Recruitment).uuid" value="<s:property value='uuid' />" />
<input type="hidden" name="instance(Recruitment).timeStamp" value="<s:property value='timeStamp' />" />
<input type="hidden" name="instance(Recruitment).ifUsing" value="<s:property value='ifUsing' />" />
<table width="580" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="130">需求部门：</th>
		<td width="450" colspan="3"><label name="instance(Recruitment).departmentUuid" class="BaseTree" javaClassName="Department" validate="true" value="<s:property value='departmentUuid' />" ></label>&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<th width="130">现有人数：</th>
		<td width="160"><input name="instance(Recruitment).existingNo" style="width:50px" validate="true" value="<s:property value='existingNo' />" >人&nbsp;</td>
		<th width="130">预算人数：</th>
		<td width="160"><input name="instance(Recruitment).budgetNo" style="width:50px" validate="true" value="<s:property value='budgetNo' />" >人&nbsp;</td>
	</tr>
	<tr>
		<th width="130">职位名称：</th>
		<td width="160"><input name="instance(Recruitment).position" style="width:50px" validate="true" value="<s:property value='position' />" >&nbsp;<font color="#996633">*</font></td>
		<th width="130">需求人数：</th>
		<td width="160"><input name="instance(Recruitment).demandNo" style="width:50px" validate="true" value="<s:property value='demandNo' />" >人&nbsp;</td>
	</tr>
	<tr>
		<th width="130">级别：</th>
		<td width="450" colspan="3"><label name="instance(Recruitment).rankUuid" style="width:50px" class="BaseTree" javaClassName="LevelType" validate="true" value="<s:property value='rankUuid' />" ></label>&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<th width="130">直接上级：</th>
		<td width="160"><input name="instance(Recruitment).leaderUuid"
			class="DropMenu"
			actionPath="<%=request.getContextPath() %>/ajaxs/drop/menu/query_employee_drop_menu.html"
			validate="true" nextSiblingValue="<s:property value='leader.person.name' />" value="<s:property value='leaderUuid' />" >&nbsp;</td>
		<th width="130">直接下级：</th>
		<td width="160"><input name="instance(Recruitment).subordinateUuid"
			class="DropMenu"
			actionPath="<%=request.getContextPath() %>/ajaxs/drop/menu/query_employee_drop_menu.html"
			validate="true" nextSiblingValue="<s:property value='subordinate.person.name' />" value="<s:property value='subordinateUuid' />" >&nbsp;</td>
	</tr>
	<tr>
		<th width="130">下属人数：</th>
		<td width="160"><input name="instance(Recruitment).subordinatesNo" style="width:50px" validate="true" value="<s:property value='subordinatesNo' />" >人&nbsp;</td>
		<th width="130">其他：</th>
		<td width="160"><label name="instance(Recruitment).otherUuid" style="width:50px" class="BaseTree" javaClassName="OtherType" validate="true" value="<s:property value='otherUuid' />" ></label>&nbsp;</td>
	</tr>
	<tr>
		<th width="130">试用期最低工资：</th>
		<td width="160"><input name="instance(Recruitment).probationLow" style="width:50px" validate="true" value="<s:property value='probationLow' />" >元&nbsp;</td>
		<th width="130">试用期最高工资：</th>
		<td width="160"><input name="instance(Recruitment).probationHigh" style="width:50px" validate="true" value="<s:property value='probationHigh' />" >元&nbsp;</td>
	</tr>
	<tr>
		<th width="130">转正最低工资：</th>
		<td width="160"><input name="instance(Recruitment).positiveLow" style="width:50px" validate="true" value="<s:property value='positiveLow' />" >元&nbsp;</td>
		<th width="130">转正最高工资：</th>
		<td width="160"><input name="instance(Recruitment).positiveHigh" style="width:50px" validate="true" value="<s:property value='positiveHigh' />" >元&nbsp;</td>
	</tr>
	<tr>
		<th width="130">其他福利待遇：</th>
		<td width="450" colspan="3"><input name="instance(Recruitment).welfare" style="width:50px" validate="true" value="<s:property value='welfare' />" >&nbsp;</td>
	</tr>
	<tr>
		<th width="130">工作职责：</th>
		<td width="450" colspan="3"><textarea name="instance(Recruitment).duty" style="width:410px;height:50px" validate="true" ><s:property value='duty' /></textarea>&nbsp;</td>
	</tr>
	<tr>
		<th width="130">性别：</th>
		<td width="450" colspan="3"><label name="instance(Recruitment).genderUuid" class="BaseTree" javaClassName="Gender" validate="true" value="<s:property value='genderUuid' />" ></label>&nbsp;</td>
	</tr>
	<tr>
		<th width="130">最小年龄：</th>
		<td width="160"><input name="instance(Recruitment).ageLow" style="width:50px" validate="true" value="<s:property value='ageLow' />" >岁&nbsp;</td>
		<th width="130">最大年龄：</th>
		<td width="160"><input name="instance(Recruitment).ageHigh" style="width:50px" validate="true" value="<s:property value='ageHigh' />" >岁&nbsp;</td>
	</tr>
	<tr>
		<th width="130">学历：</th>
		<td width="160"><label name="instance(Recruitment).educationUuid" class="BaseTree" javaClassName="Education" validate="true" value="<s:property value='educationUuid' />" ></label>&nbsp;</td>
		<th width="130">主修专业：</th>
		<td width="160"><input name="instance(Recruitment).major" style="width:100px" validate="true" value="<s:property value='major' />" >&nbsp;</td>
	</tr>
	<tr>
		<th width="130">专业技术：</th>
		<td width="450" width="160" colspan="3"><textarea name="instance(Recruitment).professional" style="width:410px;height:30px" validate="true" ><s:property value='professional' /></textarea>&nbsp;</td>
	</tr>
	<tr>
		<th width="130">管理能力：</th>
		<td width="450" colspan="3"><textarea name="instance(Recruitment).managementAbility" style="width:410px;height:30px" validate="true" ><s:property value='managementAbility' /></textarea>&nbsp;</td>
	</tr>
	<tr>
		<th width="130">工作背景：</th>
		<td width="450" colspan="3"><textarea name="instance(Recruitment).background" style="width:410px;height:30px" validate="true" ><s:property value='background' /></textarea>&nbsp;</td>
	</tr>
	<tr>
		<th width="130">其他技术：</th>
		<td width="450" colspan="3"><textarea name="instance(Recruitment).otherTechnology" style="width:410px;height:30px" validate="true" ><s:property value='otherTechnology' /></textarea>&nbsp;</td>
	</tr>
	<tr>
		<th width="130">希望几周内到岗：</th>
		<td width="160"><input name="instance(Recruitment).weeks" style="width:50px" validate="true" value="<s:property value='weeks' />" >周&nbsp;<font color="#996633">*</font></td>
		<th width="130">希望到岗日期：</th>
		<td width="160"><label name="instance(Recruitment).specificTime" class="DateTimeSingle" format="all" validate="true" value="<s:date name='specificTime' format='yyyy-MM-dd' />" ></label>&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<th width="130">申请人：</th>
		<td width="450" colspan="3">
			<s:property value="#session.LOGIN_USER.person.name" />
		</td>
	</tr>
</table>
</form>
</s:iterator>
<br>
<a href="javascript:createInstance('formA')" >
<img src="<%=request.getContextPath()%>/images/button/b_confirm_2.gif" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="<%=request.getContextPath()%>/pages/resource/human/manage/apply/manage/recruitment/apply/query_recruitment_apply.html" >
<img src="<%=request.getContextPath()%>/images/button/b_cancel.gif" /></a>
<br>
</body>
</html>
