<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
	<title>编辑物资信息</title>
</head>
<body>
<script>
Validation.init("resource/material_manage/material_generate/create_material.xml");

var mark = true;
function createInstance(elementId){
	if(mark){
		if(Validation.excuteValidate(elementId)){
			if(confirm("确认操作？")){
				mark = false;
				var param=Submit.excute(elementId);
				$.post(cp+"/ajaxs/resource/material/manage/material/generate/create_material.html",param,function(data){
					location.href = cp+"/pages/resource/material/manage/material/generate/query_material_generate.html";
				})
			}
		}
	}
	else {
		alert("操作进行中，请勿重复点击！");
	}
}
</script>
<div style="font-family:黑体;font-size:20px;">&nbsp;物 资 信 息 管 理</div>
<br><br><br>
<s:iterator value="#request.material">
<form id="formA" name="formA" method="post">
<input type="hidden" name="instance(Material).uuid" value="<s:property value='uuid' />" />
<input type="hidden" name="instance(Material).timeStamp" value="<s:property value='timeStamp' />" />
<table width="500" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="100">编号：</th>
		<td width="400"><input type="text" name="instance(Material).materialNo" style="width:150px" value="<s:property value='materialNo' />" validate="true" />&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<th width="100">规格型号：</th>
		<td width="400"><input type="text" name="instance(Material).specification" style="width:150px" value="<s:property value='specification' />" validate="true" />&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<th width="100">单位：</th>
		<td width="400"><input type="text" name="instance(Material).unit" style="width:150px" value="<s:property value='unit' />" validate="true" />&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<th width="100">类别：</th>
		<td width="400"><label name="instance(Material).typeUuid" class="BaseTree" javaClassName="MaterialType" value="<s:property value='typeUuid' />" validate="true" ></label>&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<th width="100">警戒线：</th>
		<td width="400"><input type="text" name="instance(Material).minValue" style="width:150px" value="<s:property value='minValue' />" validate="true" />&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<th width="100">备注：</th>
		<td width="400"><textarea name="instance(Material).notes" style="width:380px;height:100px"><s:property value='notes' /></textarea></td>
	</tr>
	<tr>
		<th width="100">记录人：</th>
		<td width="400">
			<s:property value="#session.LOGIN_USER.person.name" />
		</td>
	</tr>
</table>
</form>
</s:iterator>
<br>
<a href="javascript:createInstance('formA')" >
<img src="<%=request.getContextPath()%>/images/button/b_confirm_2.gif" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="<%=request.getContextPath()%>/pages/resource/material/manage/material/generate/query_material_generate.html" >
<img src="<%=request.getContextPath()%>/images/button/b_cancel.gif" /></a>
<br>
</body>
</html>
