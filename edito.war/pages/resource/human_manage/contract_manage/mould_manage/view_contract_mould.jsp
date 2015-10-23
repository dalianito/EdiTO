<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8">
<head>
	<title>查看合同模板</title>
	<link href="<%=request.getContextPath()%>/style/style_resource.css" rel="stylesheet" type="text/css">
</head>

<body class="BodyView">
<br>
<s:iterator value="#request.contractMould">
<p align="center"><img src="<%=request.getContextPath()%>/images/title/title_contractMould.gif"></p>
<table width="740" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">
	<tr>
		<th width="100">模板名称：</th>
		<td width="640" colspan="3"><s:property value='description' />&nbsp;</td>
	</tr>
	<tr>
		<th width="100">创建人：</th>
		<td width="270"><s:property value="creator.person.name" />&nbsp;</td>
		<th width="100">创建时间：</th>
		<td width="270"><s:date name="createTime" format="yyyy-MM-dd HH:mm" />&nbsp;</td>
	</tr>
</table>
<br>
<table width="740" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">
	<tr>
		<th>模板内容：</th>
	</tr>
	<tr>
		<td><s:property value="content" escape="false" />&nbsp;</td>
	</tr>
</table>
</s:iterator>
<br>
<p align="center"><img src="<%=request.getContextPath()%>/images/button/b_close.gif"
	onClick="window.close()" style="cursor:hand"></p>
<br>
</body>
</html>
