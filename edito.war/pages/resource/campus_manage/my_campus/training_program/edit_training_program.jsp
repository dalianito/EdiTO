<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
	<title>培训规划</title>
</head>
<body>
<script>
Validation.init("resource/campus_manage/my_campus/training_program/create_training_program.xml");
var mark = true;
function createInstance(elementId){
	if(mark){
		if(Validation.excuteValidate(elementId)){
			if(confirm("确认操作？")){
				mark = false;
				var param = Submit.excute(elementId);
				$.post(cp+"/ajaxs/resource/campus/manage/my/campus/training/program/create_training_summary.html",param,function(data){
					location.href = cp + "/pages/resource/campus/manage/my/campus/training/program/query_training_program.html";
				});
			}
		}
	}
	else {
		alert("操作进行中，请勿重复点击！");
	}
}
</script>
<div style="font-family:黑体;font-size:20px;">&nbsp;培 训 规 划</div>
<br><br><br>
<s:iterator value="#request.trainingPlan">
<form id="formA">
<table width="580" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="100">培训主题：</th>
		<td><s:property value='title' /></td>
	</tr>
	<tr>
		<th width="100">讲师：</th>
		<td><s:property value='lecturer.person.name' /></td>
	</tr>
	<tr>
		<th width="100">考核日期：</th>
		<td><s:date name="trainingTime" format="yyyy-MM-dd" /></td>
	</tr>
	<tr>
		<th width="100">组织机构：</th>
		<td><s:property value='department.description' /></td>
	</tr>
	<s:iterator value="#request.applyInfo" >
		<input type="hidden" name="instance(ApplyInfo).uuid" value="<s:property value='uuid' />" />
		<input type="hidden" name="instance(ApplyInfo).timeStamp" value="<s:property value='timeStamp' />" />
		<input type="hidden" name="instance(ApplyInfo).bizDataUuid" value="<s:property value='bizDataUuid' />" />
		<input type="hidden" name="instance(ApplyInfo).applicantUuid" value="<s:property value='applicantUuid' />" />
		<input type="hidden" name="instance(ApplyInfo).stateUuid" value="<s:property value='stateUuid' />" />
		<input type="hidden" name="instance(ApplyInfo).joinStateUuid" value="<s:property value='joinStateUuid' />" />
		<tr>
			<th width="100">课程设置：</th>
			<td><textarea name="instance(ApplyInfo).curriculum" style="width:440px;height:100px" validate="true" ></textarea>&nbsp;<font color="#996633">*</font></td>
		</tr>
		<tr>
			<th width="100">教学效果：</th>
			<td><textarea name="instance(ApplyInfo).effect" style="width:440px;height:100px" validate="true" ></textarea>&nbsp;<font color="#996633">*</font></td>
		</tr>
		<tr>
			<th width="100">实际情况：</th>
			<td><textarea name="instance(ApplyInfo).situation" style="width:440px;height:100px" validate="true" ></textarea>&nbsp;<font color="#996633">*</font></td>
		</tr>
		<tr>
			<th width="100">建议：</th>
			<td><textarea name="instance(ApplyInfo).suggest" style="width:440px;height:100px" validate="true" ></textarea>&nbsp;<font color="#996633">*</font></td>
		</tr>
	</s:iterator>
</table>
</form>
</s:iterator>
<br>
<a href="javascript:createInstance('formA')" >
<img src="<%=request.getContextPath()%>/images/button/b_confirm_2.gif" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="<%=request.getContextPath()%>/pages/resource/campus/manage/my/campus/training/program/query_training_program.html" >
<img src="<%=request.getContextPath()%>/images/button/b_cancel.gif" /></a>
<br>
</body>
</html>
