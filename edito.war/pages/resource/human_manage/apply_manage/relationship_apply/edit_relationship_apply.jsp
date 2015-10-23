<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
	<title>编辑关系调动申请</title>
</head>
<body>
<script>
Validation.init("resource/human_manage/apply_manage/relationship_apply/create_relationship_apply.xml");
var mark = true;
function createInstance(elementId){
	if(mark){
		if(Validation.excuteValidate(elementId)){
			if(confirm("确认操作？")){
				mark = false;
				var param = Submit.excute(elementId);
				$.post(cp+"/ajaxs/resource/human/manage/apply/manage/relationship/apply/create_apply.html",param,function(data){
					location.href = cp + "/pages/resource/human/manage/apply/manage/relationship/apply/query_relationship_apply.html";
				});
			}
		}
	}
	else {
		alert("操作进行中，请勿重复点击！");
	}
}
function updateRelation(data){
	$("label[name='instance(Relationship).originalUuid']").val(data["employee"].departmentUuid);
}
function clearRelationData(relationId){
	$("label[name='instance(Relationship).originalUuid']").val("");
}
</script>
<div style="font-family:黑体;font-size:20px;">&nbsp;关 系 调 动 申 请</div>
<br><br><br>
<s:iterator value="#request.relationship">
<form id="formA">
<input type="hidden" name="instance(Apply).uuid" value="<s:property value='apply.uuid' />" />
<input type="hidden" name="instance(Apply).timeStamp" value="<s:property value='apply.timeStamp' />" />
<input type="hidden" name="instance(Apply).typeUuid" value="<s:property value='apply.typeUuid' />" />
<input type="hidden" name="instance(Apply).stateUuid" value="<s:property value='apply.stateUuid' />" />
<input type="hidden" name="instance(Relationship).uuid" value="<s:property value='uuid' />" />
<input type="hidden" name="instance(Relationship).timeStamp" value="<s:property value='timeStamp' />" />
<input type="hidden" name="instance(Relationship).ifUsing" value="<s:property value='ifUsing' />" />
<table width="580" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="130">员工姓名：</th>
		<td width="450" colspan="3"><input name="instance(Relationship).teacherUuid"
			nextSiblingName="teacherName"
			class="DropMenu"
			actionPath="<%=request.getContextPath() %>/ajaxs/drop/menu/query_employee_drop_menu.html"
			validate="true" nextSiblingValue="<s:property value='teacher.person.name' />" value="<s:property value='teacherUuid' />" >&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<th width="130">原组织机构：</th>
		<td width="160"><label name="instance(Relationship).originalUuid" style="width:50px" class="BaseTree" javaClassName="Department" validate="true" value="<s:property value='originalUuid' />" ></label>&nbsp;<font color="#996633">*</font></td>
		<th width="130">调往组织机构：</th>
		<td width="160"><label name="instance(Relationship).transferUuid" style="width:50px" class="BaseTree" javaClassName="Department" validate="true" value="<s:property value='transferUuid' />" ></label>&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<th width="130">离岗时间：</th>
		<td width="160"><label name="instance(Relationship).postTime" class="DateTimeSingle" format="all" validate="true" value="<s:date name='postTime' format='yyyy-MM-dd' />" ></label>&nbsp;<font color="#996633">*</font></td>
		<th width="130">到岗时间：</th>
		<td width="160"><label name="instance(Relationship).arrivalTime" class="DateTimeSingle" format="all" validate="true" value="<s:date name='arrivalTime' format='yyyy-MM-dd' />" ></label>&nbsp;<font color="#996633">*</font></td>
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
<a href="<%=request.getContextPath()%>/pages/resource/human/manage/apply/manage/relationship/apply/query_relationship_apply.html" >
<img src="<%=request.getContextPath()%>/images/button/b_cancel.gif" /></a>
<br>
</body>
</html>
