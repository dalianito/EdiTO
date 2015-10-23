<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8">
<head>
	<title>查看采购申请</title>
	<link href="<%=request.getContextPath()%>/style/style_resource.css" rel="stylesheet" type="text/css">
</head>

<body class="BodyView">
<br>
<p align="center"><img src="<%=request.getContextPath()%>/images/title/title_officeApply.gif"></p>
<s:iterator value="#request.officeApplication">
<table width="600" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">
	<tr>
		<th colspan="4">申请人基本信息</th>
	</tr>
	<tr>
		<th width="150">申请人：</th>
		<td width="150"><s:property value="apply.applicant.person.name" />&nbsp;</td>
		<th width="150">申请单位：</th>
		<td width="150"><s:property value="department.description" />&nbsp;</td>
	</tr>
	<tr>
		<th width="150">校区：</th>
		<td width="150"><s:property value="campus.description" />&nbsp;</td>
		<th width="150">申请时间：</th>
		<td width="150"><s:date name="apply.applicationTime" format="yyyy-MM-dd HH:mm" />&nbsp;</td>
	</tr>
</table>
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
	<s:iterator value="officeMaterials" status="rowList">
		<tr>
			<td width="40" style="text-align:center"><s:property value="#rowList.count" />&nbsp;</td>
			<td width="110" style="text-align:center"><s:property value="material.type.description" />&nbsp;</td>
			<td width="110" style="text-align:center"><s:property value="material.materialNo" />&nbsp;</td>
			<td width="110" style="text-align:center"><s:property value="material.specification" />&nbsp;</td>
			<td width="50" style="text-align:center"><s:property value="material.unit" />&nbsp;</td>
			<td width="80" style="text-align:center"><s:property value="materialAmount" />&nbsp;</td>
			<td width="80" style="text-align:center"><s:property value="approvalAmount" />&nbsp;</td>
			<td width="80" style="text-align:center"><s:property value="state.description" />&nbsp;</td>
		</tr>
	</s:iterator>
</table>
<br>
<table width="600" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">
	<tr>
		<th colspan="4">审批信息</th>
	</tr>
	<tr>
		<th width="150">申请单位负责人：</th>
		<td width="450" colspan="3"><s:property value="apply.checkerOne.person.name" />&nbsp;</td>
	</tr>
	<tr>
		<th width="150">相关意见：</th>
		<td width="450" colspan="3"><s:property value="apply.notesOne" />&nbsp;</td>
	</tr>
	<tr>
		<th width="150">审批结果：</th>
		<td width="150"><s:property value="apply.checkStateOne.description" />&nbsp;</td>
		<th width="150">审批时间：</th>
		<td width="150"><s:date name="apply.checkTimeOne" format="yyyy-MM-dd HH:mm" />&nbsp;</td>
	</tr>
	<tr>
		<th width="150">总校物资管理负责人：</th>
		<td width="450" colspan="3"><s:property value="apply.checkerTwo.person.name" />&nbsp;</td>
	</tr>
	<tr>
		<th width="150">相关意见：</th>
		<td width="450" colspan="3"><s:property value="apply.notesTwo" />&nbsp;</td>
	</tr>
	<tr>
		<th width="150">审批结果：</th>
		<td width="150"><s:property value="apply.checkStateTwo.description" />&nbsp;</td>
		<th width="150">审批时间：</th>
		<td width="150"><s:date name="apply.checkTimeTwo" format="yyyy-MM-dd HH:mm" />&nbsp;</td>
	</tr>
	<tr>
		<th width="150">总校主管负责人：</th>
		<td width="450" colspan="3"><s:property value="apply.checkerThree.person.name" />&nbsp;</td>
	</tr>
	<tr>
		<th width="150">相关意见：</th>
		<td width="450" colspan="3"><s:property value="apply.notesThree" />&nbsp;</td>
	</tr>
	<tr>
		<th width="150">审批结果：</th>
		<td width="150"><s:property value="apply.checkStateThree.description" />&nbsp;</td>
		<th width="150">审批时间：</th>
		<td width="150"><s:date name="apply.checkTimeThree" format="yyyy-MM-dd HH:mm" />&nbsp;</td>
	</tr>
</table>
</s:iterator>
<p align="center"><img src="<%=request.getContextPath()%>/images/button/b_close.gif" onClick="window.close()" style="cursor:hand"></p>
<br>
</body>
</html>

