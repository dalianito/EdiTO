<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
	<title>编辑教室</title>
</head>
<body>
<script>
Validation.init("content/course_manage/class_room/create_class_room.xml");
var mark = true;
function createInstance(elementId){
	if(mark){
		if(Validation.excuteValidate(elementId)){
			if(confirm("确认操作？")){
				mark = false;
				var param = Submit.excute(elementId);
				$.post(cp+"/ajaxs/content/resources/manage/class/manage/create_class_manage.html",param,function(data){
					location.href = cp + "/pages/content/resources/manage/class/manage/query_class_manage.html";
				});
			}
		}
	}
	else {
		alert("操作进行中，请勿重复点击！");
	}
}
</script>
<div style="font-family:黑体;font-size:20px;">&nbsp;教 室 资 源 管 理</div>
<br><br><br>
<s:iterator value="#request.room">
<form id="formA">
<input type="hidden" name="instance(Room).uuid" value="<s:property value='uuid' />" />
<input type="hidden" name="instance(Room).timeStamp" value="<s:property value='timeStamp' />" />
<table width="580" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="130">教室名：</th>
		<td width="160"><input type="text" name="instance(Room).classroomName" style="width:130px" validate="true"  value="<s:property value='classroomName' />"/>&nbsp;<font color="#996633">*</font></td>
		<th width="130">容纳人数：</th>
		<td width="160"><input type="text" name="instance(Room).numberOf" style="width:130px" validate="true"  value="<s:property value='numberOf' />"/>&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<th width="130">校区：</th>
		<td colspan="3"><label type="text" name="instance(Room).campusUuid" class="BaseTree" javaClassName="Campus" validate="true" value="<s:property value='campusUuid' />"/></label>&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<th width="130">备注：</th>
		<td colspan="3">
			<textarea name="instance(Room).remarks" style="width:430px;height:100px" ><s:property value='remarks' /></textarea>
		</td>
	</tr>
</table>
</form>
</s:iterator>
<br>
<a href="javascript:createInstance('formA')" >
<img src="<%=request.getContextPath()%>/images/button/b_confirm_2.gif" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="<%=request.getContextPath()%>/pages/content/resources/manage/class/manage/query_class_manage.html" >
<img src="<%=request.getContextPath()%>/images/button/b_cancel.gif" /></a>
<br>
</body>
</html>
