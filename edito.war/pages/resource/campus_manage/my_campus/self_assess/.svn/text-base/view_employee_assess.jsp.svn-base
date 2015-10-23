<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8">
<head>
	<title>查看月度自评</title>
	<link href="<%=request.getContextPath()%>/style/style_resource.css" rel="stylesheet" type="text/css">
</head>

<body class="BodyView">
<br>
<p align="center"><img src="<%=request.getContextPath()%>/images/title/title_self_assess.gif"></p>
<s:iterator value="#request.selfAssess">
<table width="660" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">
	<tr>
		<th width="150">申请人：</th>
		<td width="180"><s:property value="selfAssessEmployee.person.name" /></td>
		<th width="150">组织机构：</th>
		<td width="180"><s:property value='department.description' />&nbsp;</td>
	</tr>
	<tr>
		<th width="150">校区：</th>
		<td width="180"><s:property value='campus.description' />&nbsp;</td>
		<th width="150">岗位：</th>
		<td width="180"><s:property value='job.description' />&nbsp;</td>
	</tr>
	<tr>
		<th width="150">自评时间：</th>
		<td colspan='3' width="180"><s:date name='selfAssessTime' format="yyyy-MM-dd HH:MM" />&nbsp;</td>
	</tr>
	<tr>
		<th width="150">主要工作内容：</th>
		<td style="width:510;word-break:break-all;height:104px;vertical-align:top;padding-top:5px" colspan="3"><pre><s:property value='workContant' />&nbsp;</pre></td>
	</tr>
	<tr>
		<th width="150">如何看待学校现<br>行的规章制度：</th>
		<td style="width:510;word-break:break-all;height:104px;vertical-align:top;padding-top:5px" colspan="3"><pre><s:property value='thinkings' />&nbsp;</pre></td>
	</tr>
	<tr>
		<th width="150">成长与收获：</th>
		<td style="width:510;word-break:break-all;height:104px;vertical-align:top;padding-top:5px" colspan="3"><pre><s:property value="harvest" />&nbsp;</pre></td>
	</tr>
	<tr>
		<th width="150">内观与反思：</th>
		<td style="width:510;word-break:break-all;height:104px;vertical-align:top;padding-top:5px" colspan="3"><pre><s:property value="reflect" />&nbsp;</pre></td>
	</tr>
</table>
</s:iterator>
<br>
<p align="center"><img src="<%=request.getContextPath()%>/images/button/b_close.gif"
	onClick="window.close()" style="cursor:hand"></p>
<br>
</body>
</html>
