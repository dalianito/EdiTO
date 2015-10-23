<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
	<title>编辑转正申请</title>
</head>
<body>
<script>
Validation.init("resource/campus_manage/my_campus/regular_apply/create_regular_apply.xml");
var mark = true;
function createInstance(elementId){
	if(mark){
		if(Validation.excuteValidate(elementId)){
			if(confirm("确认操作？")){
				mark = false;
				var param = Submit.excute(elementId);
				$.post(cp+"/ajaxs/resource/campus/manage/my/campus/quits/apply/create_apply.html",param,function(data){
					location.href = cp + "/pages/resource/campus/manage/my/campus/regular/apply/query_regular_apply.html";
				});
			}
		}
	}
	else {
		alert("操作进行中，请勿重复点击！");
	}
}
</script>
<div style="font-family:黑体;font-size:20px;">&nbsp;转 正 申 请</div>
<br><br><br>
<s:iterator value="#request.regularApplication">
<form id="formA">
<input type="hidden" name="instance(Apply).uuid" value="<s:property value='apply.uuid' />" />
<input type="hidden" name="instance(Apply).timeStamp" value="<s:property value='apply.timeStamp' />" />
<input type="hidden" name="instance(Apply).typeUuid" value="<s:property value='apply.typeUuid' />" />
<input type="hidden" name="instance(Apply).stateUuid" value="<s:property value='apply.stateUuid' />" />
<input type="hidden" name="instance(RegularApplication).uuid" value="<s:property value='uuid' />" />
<input type="hidden" name="instance(RegularApplication).timeStamp" value="<s:property value='timeStamp' />" />
<input type="hidden" name="instance(RegularApplication).ifUsing" value="<s:property value='ifUsing' />" />
<input type="hidden" name="instance(RegularApplication).approvalUuid" value="<s:property value='approvalUuid' />" />
<table width="660" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="150">申请人：</th>
		<td width="180">
			<s:property value="#session.LOGIN_USER.person.name" />
		</td>
		<th width="150">组织机构：</th>
		<td width="180"><s:property value="department.description" />&nbsp;</td>
	</tr>
	<tr>
		<th width="150">校区：</th>
		<td width="180"><s:property value="campus.description" />&nbsp;</td>
		<th width="150">岗位：</th>
		<td width="180"><s:property value="job.description" />&nbsp;</td>
	</tr>
	<tr>
		<th width="150">试用期起止时间：</th>
		<td colspan="3"><label type="text" name="instance(RegularApplication).fromDt" class="DateTimeSingle" format="all" validate="true" value="<s:date name="fromDt" format="yyyy-MM-dd" />"></label>&nbsp;-&nbsp;<label type="text" name="instance(RegularApplication).toDt" class="DateTimeSingle" format="all" validate="true" value="<s:date name='toDt' format="yyyy-MM-dd" />"></label>&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<th width="150">试用期述职<br>(工作内容和成果)：</th>
		<td colspan="3"><textarea name="instance(RegularApplication).debrief" style="width:490px;height:80px" validate="true"><s:property value="debrief" /></textarea>&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<th width="150">转正后工作<br>开展计划：</th>
		<td colspan="3"><textarea name="instance(RegularApplication).workPlan" style="width:490px;height:80px" validate="true"><s:property value="workPlan" /></textarea>&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<th width="150">其他建议：</th>
		<td colspan="3"><textarea name="instance(RegularApplication).suggestion" style="width:490px;height:80px"><s:property value="suggestion" /></textarea></td>
	</tr>
</table>
</form>
</s:iterator>
<br>
<a href="javascript:createInstance('formA')" >
<img src="<%=request.getContextPath()%>/images/button/b_confirm_2.gif" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="<%=request.getContextPath()%>/pages/resource/campus/manage/my/campus/regular/apply/query_regular_apply.html" >
<img src="<%=request.getContextPath()%>/images/button/b_cancel.gif" /></a>
<br>
</body>
</html>
