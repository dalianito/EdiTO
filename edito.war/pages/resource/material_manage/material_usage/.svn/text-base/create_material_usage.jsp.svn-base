<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
	<title>新建物资使用</title>
</head>
<body>
<script>
Validation.init("resource/material_manage/material_usage/create_usage.xml");
var mark = true;
function createInstance(elementId){
	if(mark){
		if(Validation.excuteValidate(elementId)){
			var count = $("#count").html();
			var ctn = $("#ctn").val();
			if(+ctn>+count){
				alert("库存不足，请重新填写！");
				return;
			}	
			alert("物资使用创建不能修改请慎重填写！");
			if(confirm("确认操作？")){
				mark = false;
				var param = Submit.excute(elementId);
				$.post(cp+"/ajaxs/resource/material/manage/material/usage/create_material_usage.html",param,function(){
					location.href = cp + "/pages/resource/material/manage/material/usage/query_material_usage.html";
				});
			}
		}
	}
	else {
		alert("操作进行中，请勿重复点击！");
	}
}
function updateRelation(data){
	$("#unit").html(data["material"].unit);
	$("#count").html(data["materialStorage"].amount);
}
function clearRelationData(relationId){
	$("#unit").html("");
	$("#count").html("");
}

</script>
<div style="font-family:黑体;font-size:20px;">&nbsp;物 资 使 用</div>
<br><br><br>
<form id="formA" name="formA" method="post">
<table width="500" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="100">经办人：</th>
		<td width="400">
			<s:property value="#session.LOGIN_EMPLOYEE.person.name" />
		</td>
	</tr>
	<tr>
		<th width="100">校区：</th>
		<td width="400">
			<s:property value="#session.LOGIN_EMPLOYEE.campus.description" />
		</td>
	</tr>
	<tr>
		<th width="100">物资：</th>
		<td width="400"><input name="instance(MaterialExport).materialUuid"
			nextSiblingName="materialName"
			class="DropMenu"
			actionPath="<%=request.getContextPath() %>/ajaxs/drop/menu/query_material_drop_menu.html"
			execute="true"
			executeUrl="<%=request.getContextPath() %>/ajaxs/drop/menu/query_material_info.html"
		    relationId="<s:property value="#session.LOGIN_EMPLOYEE.campus.uuid"/> " validate="true" >&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<th width="100">库存数量：</th>
		<td width="400"><div id="count"></div></td>
	</tr>
	<tr>
		<th width="100">数量：</th>
		<td width="400"><input id="ctn" type="text" name="instance(MaterialExport).amount" style="width:50px" validate="true" "/>&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<th width="100">单位：</th>
		<td width="400"><div id="unit"></div></td>
	</tr>
	<tr>
		<th width="130">组织机构：</th>
		<td width="160"><label name="instance(MaterialExport).departmentUuid" class="BaseTree" javaClassName="Department" validate="true" ></label>&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<th width="100">备注：</th>
		<td width="400"><textarea name="instance(MaterialExport).remarks" style="width:380px;height:100px" validate="true" ></textarea></td>
	</tr>
</table>
</form>
<br>
<a href="javascript:createInstance('formA')">
<img src="<%=request.getContextPath()%>/images/button/b_confirm_2.gif" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="<%=request.getContextPath()%>/pages/resource/material/manage/material/usage/query_material_usage.html" >
<img src="<%=request.getContextPath()%>/images/button/b_cancel.gif" /></a>
<br>
</body>
</html>
