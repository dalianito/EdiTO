<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
	<title>新建教室</title>
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
<div style="font-family:黑体;font-size:20px;">&nbsp;创建新的教室</div>
<br><br><br>
<form id="formA" name="formA" method="post" enctype="multipart/form-data">
<table width="580" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="130">教室名：</th>
		<td width="160"><input type="text" name="instance(Room).classroomName" style="width:90px" validate="true" />&nbsp;<font color="#996633">*</font></td>
		<th width="130">容纳人数：</th>
		<td width="160"><input type="text" name="instance(Room).numberOf" style="width:90px" validate="true" />&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<th width="130">校区：</th>
		<td colspan="3"><label type="text" name="instance(Room).campusUuid" class="BaseTree" javaClassName="Campus" validate="true" /></label>&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<th width="130">备注：</th>
		<td colspan="3">
			<textarea name="instance(Room).remarks" style="width:400px;height:100px" ></textarea>
		</td>
	</tr>
</table>
</form>
<br>
<a href="javascript:createInstance('formA')">
<img src="<%=request.getContextPath()%>/images/button/b_confirm_2.gif" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="<%=request.getContextPath()%>/pages/content/resources/manage/class/manage/query_class_manage.html" >
<img src="<%=request.getContextPath()%>/images/button/b_cancel.gif" /></a>
<br>
</body>
</html>
