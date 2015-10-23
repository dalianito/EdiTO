<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
	<title>编辑校区信息</title>
</head>
<body>
<script>
Validation.init("resource/system_manage/campus_info/create_campus_info.xml");

var mark = true;
function createInstance(elementId){
	if(mark){
		if(Validation.excuteValidate(elementId)){
			if(confirm("确认操作？")){
				var param=Submit.excute(elementId);
				$.post(cp+"/ajaxs/resource/system/manage/campus/info/create_campus.html",param,function(data){
					location.href = cp+"/pages/resource/system/manage/campus/info/query_campus_info.html";
				})
			}
		}
	}
	else {
		alert("操作进行中，请勿重复点击！");
	}
}
</script>
<div style="font-family:黑体;font-size:20px;">&nbsp;校 区 信 息 管 理</div>
<br><br><br>
<s:iterator value="#request.campus">
<form id="formA">
<input type="hidden" name="instance(Campus).uuid" value="<s:property value='uuid' />" />
<input type="hidden" name="instance(Campus).timeStamp" value="<s:property value='timeStamp' />" />
<input type="hidden" name="instance(Campus).ifHasChild" value="<s:property value='ifHasChild' />" />
<table width="580" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="100">名称：</th>
		<td width="480"><input type="text" name="instance(Campus).description" style="width:100px" validate="true" value="<s:property value='description' />" />&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<th width="100">地址：</th>
		<td width="480"><input type="text" name="instance(Campus).address" style="width:440px" validate="true" value="<s:property value='address' />" />&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<th width="100">联系人：</th>
		<td width="480"><input type="text" name="instance(Campus).contact" style="width:100px" value="<s:property value='contact' />" /></td>
	</tr>
	<tr>
		<th width="100">联系电话：</th>
		<td width="480"><input type="text" name="instance(Campus).telephone" style="width:100px" validate="true" value="<s:property value='telephone' />" />&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<th width="100">简介：</th>
		<td width="480"><textarea name="instance(Campus).instruction" style="width:460px;height:100px" /><s:property value="instruction" /></textarea></td>
	</tr>
	<tr>
		<th width="100">校长：</th>
		<td width="480"><input name="instance(Campus).headmasterUuid" nextSiblingName="employeeName" class="DropMenu"
			actionPath="<%=request.getContextPath() %>/ajaxs/drop/menu/query_employee_drop_menu.html"
			execute="true" value="<s:property value='headmasterUuid' />" nextSiblingValue="<s:property value='#request.headMasterName' />" /></td>
	</tr>
	<tr>
		<th width="100">序号：</th>
		<td width="480"><input type="text" name="instance(Campus).sequence" style="width:100px" validate="true" value="<s:property value='sequence' />" />&nbsp;<font color="#996633">*</font></td>
	</tr>
</table>
</form>
</s:iterator>
<br>
<a href="javascript:createInstance('formA')" >
<img src="<%=request.getContextPath()%>/images/button/b_confirm_2.gif" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="<%=request.getContextPath()%>/pages/resource/system/manage/campus/info/query_campus_info.html" >
<img src="<%=request.getContextPath()%>/images/button/b_cancel.gif" /></a>
<br>
</body>
</html>
