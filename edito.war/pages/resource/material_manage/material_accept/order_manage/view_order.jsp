<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8">
<head>
	<title>查看采购单</title>
	<link href="<%=request.getContextPath()%>/style/style_resource.css" rel="stylesheet" type="text/css">
</head>

<body class="BodyView">
<br>
<p align="center"><img src="<%=request.getContextPath()%>/images/title/title_order.gif"></p>
<s:iterator value="#request.orderGenerate">
<table width="600" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">
	<tr>
		<th colspan="4">生成人基本信息</th>
	</tr>
	<tr>
		<th width="150">生成人：</th>
		<td width="150"><s:property value="generator.person.name" />&nbsp;</td>
		<th width="150">生成时间：</th>
		<td width="150"><s:date name="generateTime" format="yyyy-MM-dd HH:mm"/>&nbsp;</td>
	</tr>
</table>
</s:iterator>
<br>
<table width="600" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">
	<tr>
		<th width="600" colspan="8">申请办公用品信息</th>
	</tr>
	<tr>
		<th width="40">序号</th>
		<th width="90">物品名称</th>
		<th width="90">物品编号</th>
		<th width="100">规格型号</th>
		<th width="40">单位</th>
		<th width="80">申请数量</th>
		<th width="80">通过数量</th>
		<th width="80">审批状态</th>
	</tr>
	<s:iterator value="#request.officeApplicationInfosTemp" status="rowList">
		<tr>
			<td width="40" align="center"><s:property value="#rowList.count" />&nbsp;</td>
			<td width="110" align="center"><s:property value="material.type.description" />&nbsp;</td>
			<td width="110" align="center"><s:property value="material.materialNo" />&nbsp;</td>
			<td width="110" align="center"><s:property value="material.specification" />&nbsp;</td>
			<td width="50" align="center"><s:property value="material.unit" />&nbsp;</td>
			<td width="80" align="center"><s:property value="materialAmount" />&nbsp;</td>
			<td width="80" align="center"><s:property value="approvalAmount" />&nbsp;</td>
			<td width="80" align="center"><s:property value="state.description" />&nbsp;</td>
		</tr>
	</s:iterator>
</table>

<p align="center"><img src="<%=request.getContextPath()%>/images/button/b_close.gif" onClick="window.close()" style="cursor:hand"></p>
<br>
</body>
</html>
