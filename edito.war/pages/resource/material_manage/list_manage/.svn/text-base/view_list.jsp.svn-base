<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8">
<head>
	<title>查看供方名录</title>
	<link href="<%=request.getContextPath()%>/style/style_resource.css" rel="stylesheet" type="text/css">
</head>

<body class="BodyView">
<br>
<p align="center"><img src="<%=request.getContextPath()%>/images/title/title_list.gif"></p>
<s:iterator value="#request.supplier">
<table width="380" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">
	<tr>
		<th width="100">名称：</th>
		<td width="280"><s:property value='description' />&nbsp;</td>
	</tr>
	<tr>
		<th>供应物资：</th>
		<td><s:iterator value="materials" ><s:property value="material.type.description" />(<s:property value="material.materialNo" />),</s:iterator>&nbsp;</td>
	</tr>
	<tr>
		<th>联系人：</th>
		<td><s:property value="contact" />&nbsp;</td>
	</tr>
	<tr>
		<th>联系电话：</th>
		<td><s:property value="telephone" />&nbsp;</td>
	</tr>
	<tr>
		<th>地址：</th>
		<td><s:property value="address" />&nbsp;</td>
	</tr>
	<tr>
		<th>简介：</th>
		<td><s:property value="summary" />&nbsp;</td>
	</tr>
	<tr>
		<th>记录人：</th>
		<td><s:property value="recorder.person.name" />&nbsp;</td>
	</tr>
	<tr>
		<th>记录时间：</th>
		<td><s:date name="recordTime" format="yyyy-MM-dd HH:mm" />&nbsp;</td>
	</tr>
</table>
</s:iterator>
<br>
<p align="center"><img src="<%=request.getContextPath()%>/images/button/b_close.gif"
	onClick="window.close()" style="cursor:hand"></p>
<br>
</body>
</html>
