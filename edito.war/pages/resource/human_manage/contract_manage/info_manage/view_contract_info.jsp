<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8">
<head>
	<title>查看合同</title>
	<link href="<%=request.getContextPath()%>/style/style_resource.css" rel="stylesheet" type="text/css">
</head>

<style type="text/css" media="print">
	.printNo {
		display:none;
	}
	.printYes {
		display:inline;
	}
</style>

<body class="BodyView">

<script>
function printpreview(){
	wb.execwb(7,1);
}
</script>

<OBJECT classid="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2" height="0" id="wb" name="wb" width="0"></OBJECT>
<s:iterator value="#request.contract">
<div class="printNo">
<p align="center"><img src="<%=request.getContextPath()%>/images/title/title_contract.gif"></p>
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
</div>
<table width="740" border="0" cellpadding="0" cellspacing="0">
	<tr class="printYes">
		<td><s:property value="content" escape="false" /></td>
	</tr>
</table>
</s:iterator>
<br>
<p align="center" class="printNo">
	<img src="<%=request.getContextPath()%>/images/button/b_print.gif" onClick="javascript:printpreview()" style="cursor:hand">&nbsp;&nbsp;&nbsp;&nbsp;
	<img src="<%=request.getContextPath()%>/images/button/b_close.gif" onClick="window.close()" style="cursor:hand">
</p>
<br>
</body>
</html>
