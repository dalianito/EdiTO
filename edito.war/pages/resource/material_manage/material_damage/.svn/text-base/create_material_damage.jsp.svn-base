<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
	<title>新建物资报废</title>
</head>
<body>
<script>
Validation.init("resource/material_manage/material_damage/create_damage.xml");
var mark = true;
function createInstance(elementId){
	if(mark){
		if(Validation.excuteValidate(elementId)){
			var total = $("#total").html();
			var ctn = $("#ctn").val();
			if(+ctn>+total){
				alert("报废数量超过总数，请认真填写！");
				return;
			}	
			alert("物资报废创建不能修改请慎重填写！");
			if(confirm("确认操作？")){
				mark = false;
				var param = Submit.excute(elementId);
				$.post(cp+"/ajaxs/resource/material/manage/material/damage/create_material_damage.html",param,function(){
					location.href = cp + "/pages/resource/material/manage/material/damage/query_material_damage.html";
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
	$("#total").html(data["materialStorage"].total);
}
function clearRelationData(relationId){
	$("#unit").html("");
	$("#total").html("");
}
</script>
<div style="font-family:黑体;font-size:20px;">&nbsp;物 资 报 废</div>
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
		<td width="400"><input name="instance(MaterialScrap).materialUuid"
			nextSiblingName="materialName"
			class="DropMenu"
			actionPath="<%=request.getContextPath() %>/ajaxs/drop/menu/query_material_drop_menu.html"
			execute="true"
			executeUrl="<%=request.getContextPath() %>/ajaxs/drop/menu/query_material_info.html"
		    relationId="<s:property value="#session.LOGIN_EMPLOYEE.campus.uuid"/> " validate="true" >&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<th width="100">总数量：</th>
		<td width="400"><div id="total"></div></td>
	</tr>
	<tr>
		<th width="100">数量：</th>
		<td width="400"><input id="ctn" type="text" name="instance(MaterialScrap).amount" style="width:50px" validate="true" />&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<th width="100">单位：</th>
		<td width="400"><div id="unit"></div></td>
	</tr>
	<tr>
		<th width="130">组织机构：</th>
		<td width="160"><label name="instance(MaterialScrap).departmentUuid" class="BaseTree" javaClassName="Department" validate="true" ></label>&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<th width="100">备注：</th>
		<td width="400"><textarea name="instance(MaterialScrap).remarks" style="width:380px;height:100px" validate="true" ></textarea></td>
	</tr>
</table>
</form>
<br>
<a href="javascript:createInstance('formA')">
<img src="<%=request.getContextPath()%>/images/button/b_confirm_2.gif" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="<%=request.getContextPath()%>/pages/resource/material/manage/material/damage/query_material_damage.html" >
<img src="<%=request.getContextPath()%>/images/button/b_cancel.gif" /></a>
<br>
</body>
</html>
