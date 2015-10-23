<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8">
<head>
	<title>查看物资库存</title>
	<link href="<%=request.getContextPath()%>/style/style_resource.css" rel="stylesheet" type="text/css">
</head>

<body class="BodyView">
<br>
<p align="center"><img src="<%=request.getContextPath()%>/images/title/title_material_storage.gif"></p>
<s:iterator value="#request.materialStorage">
<table width="380" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">
	<tr>
		<th width="100">物资：</th>
		<td width="280"><s:property value='material.type.description' />&nbsp;</td>
	</tr>
	<tr>
		<th>校区：</th>
		<td><s:property value="campus.description" />&nbsp;</td>
	</tr>
	<tr>
		<th>总数：</th>
		<td><s:property value="total" />&nbsp;</td>
	</tr>
	<tr>
		<th>数量：</th>
		<td><s:property value="amount" />&nbsp;</td>
	</tr>
</table>
</s:iterator>
<br>
<p align="center"><img src="<%=request.getContextPath()%>/images/button/b_close.gif"
	onClick="window.close()" style="cursor:hand"></p>
<br>
</body>
</html>
