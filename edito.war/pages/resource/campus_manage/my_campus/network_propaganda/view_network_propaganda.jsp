<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8">
<head>
	<title>查看历史宣传</title>
	<link href="<%=request.getContextPath()%>/style/style_resource.css" rel="stylesheet" type="text/css">
</head>

<body class="BodyView">
<script>
function openLink(url){
	window.open(url);
}
</script>
<br>
<p align="center"><img src="<%=request.getContextPath()%>/images/title/title_internetPublicity.gif"></p>
<s:iterator value="#request.internetPublicity">
<table width="500" border="0" cellpadding="3" cellspacing="0" class="InfoShowPanel">
	<tr>
		<th width="120">记录人：</th>
		<td>
			<s:property value='record.person.name' />
		</td>
	</tr>
	<tr>
		<th width="120">记录时间：</th>
		<td>
			<s:date name="recordTime" format="yyyy-MM-dd" />
		</td>
	</tr>
	<s:iterator value="posterInfos" status="rowList">
		<tr>
			<th align="center"><s:property value="#rowList.count" />&nbsp;</th>
			<td style="width:380px;word-break:break-all;"><a href="javascript:openLink('<s:property value="site" />')"><s:property value="site" /></a>&nbsp;</td>
		</tr>
	</s:iterator>
	<tr>
		<th width="120">备注：</th>
		<td style="width:380px;word-break:break-all;height:104px;vertical-align:top;padding-top:5px">
			<s:property value="notes" />&nbsp;<br>
		</td>	
	</tr>
	<tr>
		<th width="120">审阅状态：</th>
		<td>
			<s:property value="reviewFlag.description" />&nbsp;<br>
		</td>
	</tr>
	<tr>
		<th width="120">评语：</th>
		<td style="width:380px;word-break:break-all;height:104px;vertical-align:top;padding-top:5px">
			<s:property value="reviewComment" />&nbsp;<br>
		</td>
	</tr>
	<tr>
		<th width="120">审阅人：</th>
		<td>
			<s:property value="reviewEmployee.person.name" />&nbsp;<br>
		</td>
	</tr>
	<tr>
		<th width="120">审阅时间：</th>
		<td>
			<s:date name="reviewTime" format="yyyy-MM-dd HH:MM"/>&nbsp;<br>
		</td>
	</tr>
</table>
</s:iterator>
<br>
<p align="center"><img src="<%=request.getContextPath()%>/images/button/b_close.gif"
	onClick="window.close()" style="cursor:hand"></p>
<br>
</body>
</html>
