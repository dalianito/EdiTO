<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8">
<head>
	<title>查看教室资源管理</title>
	<script>var cp = "<%=request.getContextPath()%>";</script>
	<script src="<%=request.getContextPath()%>/js/jquery-1.4.2.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.ui.core.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.ui.widget.js"></script>
	<script src="<%=request.getContextPath()%>/js/hashtable.js"></script>
	<script src="<%=request.getContextPath()%>/js/json2.js"></script>
	<script src="<%=request.getContextPath()%>/js/iscript.js"></script>
	<script src="<%=request.getContextPath()%>/js/basetree.js"></script>
	<script src="<%=request.getContextPath()%>/js/submit.js"></script>
	<script src="<%=request.getContextPath()%>/js/validation.js"></script>
	<link href="<%=request.getContextPath()%>/style/style_content.css" rel="stylesheet" type="text/css">
</head>

<body class="BodyView">
<script type="text/javascript">
function showEdit(){
	$("#viewDiv").css("display", "none");
	$("#editDiv").css("display", "block");
}
function showView(){
	$("#viewDiv").css("display", "block");
	$("#editDiv").css("display", "none");
}
Validation.init("content/course_manage/class_room/create_class_room.xml");
function createInstance(elementId){
	if(Validation.excuteValidate(elementId)){
		if(confirm("确认操作？")){
			var param = Submit.excute(elementId);
			$.post(cp+"/ajaxs/content/resources/manage/class/manage/create_class_manage.html",param,function(data){
				location.reload();
			});
		}
	}
}
</script>
<br>
<p align="center"><img src="<%=request.getContextPath()%>/images/title/title_classroom.gif"></p>
<div id="viewDiv">
<s:iterator value="#request.room">
<form id="form" name="form" method="post">
<input type="hidden" name="uuid" value="<s:property value='uuid' />" />
</form>
<table width="580" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">
	<tr>
		<th width="120" >教室名：</th>
		<td width="160" style="line-height:20px;"style="line-height:20px;" ><s:property value='classroomName' />&nbsp;</td>
		<th width="120">容纳人数：</th>
		<td width="160" style="line-height:20px;" ><s:property value='numberOf' />人&nbsp;</td>
	</tr>
	<tr>
		<th width="120">校区：</th>
		<td colspan="3" style="line-height:20px;"><s:property value='campus.description' />&nbsp;</td>
	</tr>
	<tr>
		<th width="120" >备注：</th>
		<td colspan="3" style="line-height:20px;width:430px; height: 100px" valign="top" ><s:property value='remarks' />&nbsp;</td>
	</tr>
</table>
</s:iterator>
<br>
<img src="<%=request.getContextPath()%>/images/button/b_edit.gif" onClick="showEdit()" style="cursor:hand" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<img src="<%=request.getContextPath()%>/images/button/b_close.gif" onClick="window.close()" style="cursor:hand">
</div>
<div id="editDiv" style="display:none">
<s:iterator value="#request.room">
<form id="formA">
<input type="hidden" name="instance(Room).uuid" value="<s:property value='uuid' />" />
<input type="hidden" name="instance(Room).timeStamp" value="<s:property value='timeStamp' />" />
<table width="580" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="120">教室名：</th>
		<td width="160"><input type="text" name="instance(Room).classroomName" style="width:130px" validate="true"  value="<s:property value='classroomName' />"/>&nbsp;<font color="#996633">*</font></td>
		<th width="120">容纳人数：</th>
		<td width="160"><input type="text" name="instance(Room).numberOf" style="width:130px" validate="true"  value="<s:property value='numberOf' />"/>&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<th width="120">校区：</th>
		<td colspan="3"><label type="text" name="instance(Room).campusUuid" class="BaseTree" javaClassName="Campus" validate="true" value="<s:property value='campusUuid' />"/></label>&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<th width="120">备注：</th>
		<td colspan="3">
			<textarea name="instance(Room).remarks" style="width:430px;height:100px" ><s:property value='remarks' /></textarea>
		</td>
	</tr>
</table>
</form>
</s:iterator>
<br>
<a href="javascript:createInstance('formA')" >
<img src="<%=request.getContextPath()%>/images/button/b_confirm_2.gif" style="cursor:hand" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<img src="<%=request.getContextPath()%>/images/button/b_cancel.gif" onClick="showView()" style="cursor:hand">
</div>
<br>
</body>
</html>
