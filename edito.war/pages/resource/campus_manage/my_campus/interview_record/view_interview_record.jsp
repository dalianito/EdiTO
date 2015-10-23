<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8">
<head>
<title>查看面谈记录</title>
<link href="<%=request.getContextPath()%>/style/style_resource.css"
	rel="stylesheet" type="text/css">
</head>

<body class="BodyView">
<br>
<p align="center"><img src="<%=request.getContextPath()%>/images/title/title_interviewRecord.gif"></p>
<s:iterator value="#request.interviewRecord">
	<table width="720" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">
		<tr>
			<th width="80">面谈人：</th>
			<td width="100"><s:property value="interviewer.person.name" />
			</td>
			<th width="80">校区：</th>
			<td width="100"><s:property
				value='interviewerCampus.description' /></td>
			<th width="80">组织机构：</th>
			<td width="100"><s:property
				value='interviewerDepartment.description' /></td>
			<th width="80">岗位：</th>
			<td width="100"><s:property value='interviewerJob.description' />
			</td>
		</tr>
		<tr>
			<th width="80">被面谈人：</th>
			<td width="100"><s:property value='interviewee.person.name' />
			</td>
			<th width="80">校区：</th>
			<td width="100"><s:property
				value='intervieweeCampus.description' /></td>
			<th width="80">组织机构：</th>
			<td width="100"><s:property
				value='intervieweeDepartment.description' /></td>
			<th width="80">岗位：</th>
			<td width="100"><s:property value='intervieweeJob.description' />
			</td>
		</tr>
		<tr>
			<th width="80">面谈日期：</th>
			<td width="640" colspan="7"><s:date name="interviewDate" format="yyyy-MM-dd" />&nbsp;</td>
		</tr>
		<tr>
			<th width="80">面谈目的：</th>
			<td width="640" style="height: 100px" colspan="7" valign="top"><s:property
				value='interviewPurpose' /></td>
		</tr>
		<tr>
			<th width="80">面谈主要<br>内容：</th>
			<td width="640" style="height: 100px" colspan="7" valign="top"><s:property
				value='interviewContent' /></td>
		</tr>
		<tr>
			<th width="80">面谈结果<br>与总结：</th>
			<td width="640" style="height: 100px" colspan="7" valign="top"><s:property
				value='interviewSummary' /></td>
		</tr>
	</table>
	<br>
</s:iterator>
<p align="center"><img
	src="<%=request.getContextPath()%>/images/button/b_close.gif"
	onClick="window.close()" style="cursor: hand"></p>
<br>
</body>
</html>
