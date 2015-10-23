<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
	<title>编辑教室</title>
</head>
<body>
<script>
Validation.init("resource/campus_manage/campus_resource/classroom_manage/create_classroom.xml");
var mark = true;
function createInstance(elementId){
	if(mark){
		if(Validation.excuteValidate(elementId)){
			if(confirm("确认操作？")){
				mark = false;
				var param = Submit.excute(elementId);
				$.post(cp+"/ajaxs/resource/campus/manage/campus/resource/classroom/manage/create_classroom.html",param,function(data){
					location.href = cp + "/pages/resource/campus/manage/campus/resource/classroom/manage/query_classroom_manage.html";
				});
			}
		}
	}
	else {
		alert("操作进行中，请勿重复点击！");
	}
}</script>
<div style="font-family:黑体;font-size:20px;">&nbsp;教 室 管 理</div>
<br><br><br>
<s:iterator value="#request.classroom">
<form id="formA">
<input type="hidden" name="instance(Classroom).uuid" value="<s:property value='uuid' />" />
<input type="hidden" name="instance(Classroom).timeStamp" value="<s:property value='timeStamp' />" />
<table width="580" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="130">门牌号：</th>
		<td width="160"><input type="text" name="instance(Classroom).doorplate" style="width:90px" validate="true"  value="<s:property value='doorplate' />"/>&nbsp;<font color="#996633">*</font></td>
		<th width="130">人数上限：</th>
		<td width="160"><input type="text" name="instance(Classroom).numberOf" style="width:90px" validate="true"  value="<s:property value='address' />"/>&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<th width="130">教室类型：</th>
		<td colspan="3"><label type="text" name="instance(Classroom).classroomTypeUuid" class="BaseTree" javaClassName="ClassroomType" validate="true" value="<s:property value='classroomTypeUuid' />"/></label>&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<th width="130">位置：</th>
		<td colspan="3"><input type="text" name="instance(Classroom).address" style="width:400px" validate="true"  value="<s:property value='address' />"/>&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<th width="130">备注：</th>
		<td colspan="3">
			<textarea name="instance(Classroom).remarks" style="width:400px;height:40px" ><s:property value='remarks' /></textarea>
		</td>
	</tr>
</table>
</form>
</s:iterator>
<br>
<a href="javascript:createInstance('formA')" >
<img src="<%=request.getContextPath()%>/images/button/b_confirm_2.gif" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="<%=request.getContextPath()%>/pages/resource/campus/manage/campus/resource/classroom/manage/query_classroom_manage.html" >
<img src="<%=request.getContextPath()%>/images/button/b_cancel.gif" /></a>
<br>
</body>
</html>
