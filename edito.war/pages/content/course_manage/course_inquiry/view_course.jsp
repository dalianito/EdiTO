<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8">
<head>
	<title>查看课程</title>
	<link href="<%=request.getContextPath()%>/style/style_content.css" rel="stylesheet" type="text/css">
	<STYLE type="text/css">
		pre {
			white-space: pre-wrap; 
			white-space: -moz-pre-wrap; 
			white-space: -pre-wrap; 
			white-space: -o-pre-wrap; 
			Word-wrap: break-word; 
			}
	</STYLE>
</head>
<body class="BodyView">
<br>
<p align="center"><img src="<%=request.getContextPath()%>/images/title/title_course.gif"></p>
<s:iterator value="#request.course">
<table width="600" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">
	<tr>
		<th width="120">课程编号</th>
		<td width="180"><s:property value="courseNo" /></td>
		<th width="120">课程名</th>
		<td width="180"><s:property value="courseName" /></td>
	</tr>
	<tr>
		<th width="120">课程类别</th>
		<td width="180"><s:property value="courseType.description" /></td>
		<th width="120">预计总费用</th>
		<td width="180"><s:property value="expectedCost" />&nbsp;元</td>
	</tr>
	<tr>
		<th width="120">预计总课时</th>
		<td width="180"><s:property value="expectedHour" />&nbsp;课时</td>
		<th width="120">学期</th>
		<td width="180"><s:property value="semesterTime" />&nbsp;</td>
	</tr>
	<tr>
		<th width="120">适合学员</th>
		<td colspan="3" style="height:64px;width:480px;word-break:break-all;vertical-align:top;padding-top:5px"><pre><s:property value="fitableStudent" />&nbsp;</pre></td>
	</tr>
	<tr>
		<th width="120">课程简介</th>
		<td colspan="3" style="height:64px;width:480px;word-break:break-all;vertical-align:top;padding-top:5px"><pre><s:property value="courseDescription" />&nbsp;</pre></td>
	</tr>
	<tr>
		<th width="120">教学目标</th>
		<td colspan="3" style="height:64px;width:480px;word-break:break-all;vertical-align:top;padding-top:5px"><pre><s:property value="teachingTarget" />&nbsp;</pre></td>
	</tr>
	<tr>
		<th width="120">授课内容</th>
		<td colspan="3" style="height:64px;width:480px;word-break:break-all;vertical-align:top;padding-top:5px"><pre><s:property value="teachingContent" />&nbsp;</pre></td>
	</tr>
	<tr>
		<th width="120">课程特色</th>
		<td colspan="3" style="height:64px;width:480px;word-break:break-all;vertical-align:top;padding-top:5px"><pre><s:property value="teachingFeature" />&nbsp;</pre></td>
	</tr>
	<tr>
		<th width="120">教材说明</th>
		<td colspan="3" style="height:64px;width:480px;word-break:break-all;vertical-align:top;padding-top:5px"><pre><s:property value="relatedMaterials" />&nbsp;</pre></td>
	</tr>
	<tr>
		<th width="120">其他</th>
		<td colspan="3" style="height:64px;width:480px;word-break:break-all;vertical-align:top;padding-top:5px"><pre><s:property value="notes" />&nbsp;</pre></td>
	</tr>
</table>
<br>
</s:iterator>
<p align="center"><img src="<%=request.getContextPath()%>/images/button/b_close.gif" onClick="window.close()" style="cursor:hand"></p>
<br>
</body>
</html>
