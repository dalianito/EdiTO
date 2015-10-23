<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8">
<head>
	<title>查看物资调配</title>
	<link href="<%=request.getContextPath()%>/style/style_resource.css" rel="stylesheet" type="text/css">
</head>

<body class="BodyView">
<br>
<p align="center"><img src="<%=request.getContextPath()%>/images/title/title_material_allocate.gif"></p>
<s:iterator value="#request.materialAllocate">
<table width="380" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">
	<tr>
		<th width="100">物资：</th>
		<td width="280"><s:property value='material.type.description' />&nbsp;</td>
	</tr>
	<tr>
		<th>数量：</th>
		<td><s:property value="amount" />&nbsp;</td>
	</tr>
	<tr>
		<th>经办人：</th>
		<td><s:property value="keeper.person.name" />&nbsp;</td>
	</tr>
	<tr>
		<th>需求部门：</th>
		<td><s:property value="demandSector.description" />&nbsp;</td>
	</tr>
	<tr>
		<th>需求校区：</th>
		<td><s:property value="demandCampus.description" />&nbsp;</td>
	</tr>
	<tr>
		<th>调配部门：</th>
		<td><s:property value="deployedSector.description" />&nbsp;</td>
	</tr>
	<tr>
		<th>调配校区：</th>
		<td><s:property value="deployedCampus.description" />&nbsp;</td>
	</tr>
	<tr>
		<th>记录日期：</th>
		<td><s:date name="recordTime" format="yyyy-MM-dd HH:mm" />&nbsp;</td>
	</tr>
	<tr>
		<th>备注：</th>
		<td><s:property value="remarks" />&nbsp;</td>
	</tr>
</table>
</s:iterator>
<br>
<p align="center"><img src="<%=request.getContextPath()%>/images/button/b_close.gif"
	onClick="window.close()" style="cursor:hand"></p>
<br>
</body>
</html>
