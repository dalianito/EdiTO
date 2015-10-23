<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8">
<head>
	<title>查看应聘员工</title>
	<link href="<%=request.getContextPath()%>/style/style_resource.css" rel="stylesheet" type="text/css">
</head>

<body class="BodyView">
<br>
<p align="center"><img src="<%=request.getContextPath()%>/images/title/title_candidates.gif"></p>
<s:iterator value="#request.candidates">
<table width="600" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">
	<tr>
		<th width="150">姓名：</th>
		<td width="150"><s:property value="person.name" />&nbsp;</td>
		<th width="150">性别：</th>
		<td width="150"><s:property value="person.gender.description" />&nbsp;</td>
	</tr>
	<tr>
		<th>出生日期：</th>
		<td><s:date name="person.birthDate" format="yyyy-MM-dd" />&nbsp;</td>
		<th>籍贯：</th>
		<td><s:property value="person.nativePlace" />&nbsp;</td>
	</tr>
	<tr>
		<th>民族：</th>
		<td><s:property value="person.nationality.description" />&nbsp;</td>
		<th>身份证号：</th>
		<td><s:property value="person.idNo" />&nbsp;</td>
	</tr>
	<tr>
		<th>居住地址：</th>
		<td><s:property value="person.address" />&nbsp;</td>
		<th>工作年限：</th>
		<td><s:property value="years" />&nbsp;</td>
	</tr>
	<tr>
		<th>学历：</th>
		<td><s:property value="person.education.description" />&nbsp;</td>
		<th>政治面貌：</th>
		<td><s:property value="person.political.description" />&nbsp;</td>
	</tr>
	<tr>
		<th>应聘岗位：</th>
		<td><s:property value="post" />&nbsp;</td>
		<th>期望薪酬：</th>
		<td><s:property value="pay" />&nbsp;</td>
	</tr>
	<tr>
		<th>兴趣爱好：</th>
		<td><s:property value="hobby" />&nbsp;</td>
		<th>手机：</th>
		<td><s:property value="person.cellPhone" />&nbsp;</td>
	</tr>
	<tr>
		<th>电子邮件：</th>
		<td><s:property value="person.email" />&nbsp;</td>
		<th>资格证书：</th>
		<td><s:property value="certificate" />&nbsp;</td>
	</tr>
<s:if test="%{#request.candidates.recruitStateUuid == '10000000010180001001000000000020'  || #request.candidates.recruitStateUuid == '10000000010180001001000000000030' || #request.candidates.recruitStateUuid == '10000000010180001001000000000040'}">
	<tr>
		<th>应聘状态：</th>
		<td><s:property value="recruitState.description" />&nbsp;</td>
		<th>邀约时间：</th>
		<td><s:date name="inviteDate" format="yyyy-MM-dd HH:mm" />&nbsp;</td>
	</tr>
</s:if>
<s:else>
	<tr>
		<th>应聘状态：</th>
		<td><s:property value="recruitState.description" />&nbsp;</td>
		<th>邀约时间：</th>
		<td><div id="inviteDateHide" style="color:red">无</div></td>
	</tr>
</s:else>
	<tr>
		<th>备注：</th>
		<td colspan="3"><s:property value="remarks" />&nbsp;</td>
	</tr>
</table>
<br>
<table width="600" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">
	<tr>
		<th width="600" colspan="6">工作经历</th>
	</tr>
	<tr>
		<th width="40">序号</th>
		<th width="130">公司名称</th>
		<th width="100">职务</th>
		<th width="70">联系人</th>
		<th width="80">联系电话</th>
		<th width="180">任职时间</th>
	</tr>
	<s:iterator value="#request.workExperienceInfos">
		<tr>
			<td width="40"><s:property value="sequence" />&nbsp;</td>
			<td width="130"><s:property value="name" />&nbsp;</td>
			<td width="100"><s:property value="position" />&nbsp;</td>
			<td width="70"><s:property value="reference" />&nbsp;</td>
			<td width="80"><s:property value="referencePhone" />&nbsp;</td>
			<td width="180"><s:date name="beginDate" format="yyyy-MM-dd" />&nbsp;-&nbsp;<s:date name="endDate" format="yyyy-MM-dd" /></td>
		</tr>
	</s:iterator>
</table>
<br>
<table width="600" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">
	<tr>
		<th width="600" colspan="6">教育背景</th>
	</tr>
	<tr>
		<th width="40">序号</th>
		<th width="130">毕业院校</th>
		<th width="100">所属专业</th>
		<th width="70">联系人</th>
		<th width="80">联系电话</th>
		<th width="180">任职时间</th>
	</tr>
	<s:iterator value="#request.educateInfos">
		<tr>
			<td width="40"><s:property value="sequence" />&nbsp;</td>
			<td width="130"><s:property value="graduateSchool" />&nbsp;</td>
			<td width="100"><s:property value="professional" />&nbsp;</td>
			<td width="70"><s:property value="reference" />&nbsp;</td>
			<td width="80"><s:property value="referencePhone" />&nbsp;</td>
			<td width="180"><s:date name="beginDate" format="yyyy-MM-dd" />&nbsp;-&nbsp;<s:date name="endDate" format="yyyy-MM-dd" /></td>
		</tr>
	</s:iterator>
</table>
<br>
</s:iterator>
<p align="center"><img src="<%=request.getContextPath()%>/images/button/b_close.gif" onClick="window.close()" style="cursor:hand"></p>
<br>
</body>
</html>
