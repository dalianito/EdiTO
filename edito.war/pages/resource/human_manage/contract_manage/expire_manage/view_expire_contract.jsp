<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8">
<head>
	<title>查看合同</title>
	<link href="<%=request.getContextPath()%>/style/style_resource.css" rel="stylesheet" type="text/css">
</head>

<body class="BodyView">
<br>
<p align="center"><img src="<%=request.getContextPath()%>/images/title/title_contract.gif"></p>
<s:iterator value="#request.contract">
<table width="740" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">
	<tr>
		<th width="100">模板名称：</th>
		<td width="150"><s:property value="mould.description" />&nbsp;</td>
		<th width="100">合同编号：</th>
		<td width="150"><s:property value="contractNo" />&nbsp;</td>
		<th width="100">记录人：</th>
		<td width="140"><s:property value="recorder.person.name" />&nbsp;</td>
	</tr>
	<tr>
		<th width="100">签约者：</th>
		<td width="150"><s:property value="signer" />&nbsp;</td>
		<th width="100">签订时间：</th>
		<td width="150"><s:date name="signTime" format="yyyy-MM-dd" />&nbsp;</td>
		<th width="100">到期时间：</th>
		<td width="140"><s:date name="expireTime" format="yyyy-MM-dd" />&nbsp;</td>
	</tr>
</table>
<br>
<table width="740" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">
	<tr>
		<th>合同内容：</th>
	</tr>
	<tr>
		<td><s:property value="content" escape="false" /></td>
	</tr>
</table>
</s:iterator>
<br>
<p align="center">
	<img src="<%=request.getContextPath()%>/images/button/b_close.gif" onClick="window.close()" style="cursor:hand">
</p>
<br>
</body>
</html>
