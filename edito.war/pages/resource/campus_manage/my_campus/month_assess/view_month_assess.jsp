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
<p align="center"><img src="<%=request.getContextPath()%>/images/title/title_month_assess.gif"></p>
<s:iterator value="#request.selfAssess">
<table width="720" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">
	<tr>
		<th width="120">申请人：</th>
		<td width="240"><s:property value="selfAssessEmployee.person.name" /></td>
		<th width="120">组织机构：</th>
		<td width="240"><s:property value='department.description' />&nbsp;</td>
	</tr>
	<tr>
		<th width="120">校区：</th>
		<td width="240"><s:property value='campus.description' />&nbsp;</td>
		<th width="120">岗位：</th>
		<td width="240"><s:property value='job.description' />&nbsp;</td>
	</tr>
	<tr>
		<th width="120">自评表类型：</th>
		<td width="240"><s:property value='selfAssessType.description' /></td>
		<th width="120">自评时间：</th>
		<td><s:date name="selfAssessTime" format="yyyy-MM-dd" /></td>
	</tr>
<s:if test="%{#request.selfAssess.selfAssessTypeUuid == '10000000020130001001000000000010'}">
<tr>
	<th width="120">试用期起止时间：</th>
	<td colspan="3"><s:date name="fromDt" format="yyyy-MM-dd" />&nbsp;-&nbsp;<s:date name="toDt" format="yyyy-MM-dd" />&nbsp;</td>
</tr>
</s:if>
	<tr>
		<th width="120">主要工作内容：</th>
		<td style="width:600;word-break:break-all;height:104px;vertical-align:top;padding-top:5px" colspan="3"><pre><s:property value='workContant' />&nbsp;</pre></td>
	</tr>
	<tr>
		<th width="120">如何看待学校现<br>行的规章制度：</th>
		<td style="width:600;word-break:break-all;height:104px;vertical-align:top;padding-top:5px" colspan="3"><pre><s:property value='thinkings' />&nbsp;</pre></td>
	</tr>
	<tr>
		<th width="120">成长与收获：</th>
		<td style="width:600;word-break:break-all;height:104px;vertical-align:top;padding-top:5px" colspan="3"><pre><s:property value="harvest" />&nbsp;</pre></td>
	</tr>
	<tr>
		<th width="120">内观与反思：</th>
		<td style="width:600;word-break:break-all;height:104px;vertical-align:top;padding-top:5px" colspan="3"><pre><s:property value="reflect" />&nbsp;</pre></td>
	</tr>
</table>
<br>
<table width="720" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">
	<tr>
		<th width="120px" rowspan="10">考评项目：</th>
		<td width="120px" rowspan="4">工作态度：</td>
		<td width="160px">出勤情况：&nbsp;&nbsp;&nbsp;&nbsp;(10分)</td>
		<td width="320px"><s:property value="examine.attendanceMark" />分&nbsp;&nbsp;&nbsp;&nbsp;请假<s:property value="examine.leaveCount" />次/迟到<s:property value="examine.lateCount" />次/旷工<s:property value="examine.absenceCount" />次</td>
	</tr>
	<tr>
		<td>行为规范：&nbsp;&nbsp;&nbsp;&nbsp;(10分)</td>
		<td><s:property value="examine.behaviorMark" />分</td>
	</tr>
	<tr>
		<td>工作责任感：&nbsp;&nbsp;(10分)</td>
		<td><s:property value="examine.responsibilityMark" />分</td>
	</tr>
	<tr>
		<td>工作勤懒：&nbsp;&nbsp;&nbsp;&nbsp;(10分)</td>
		<td><s:property value="examine.diligenceMark" />分</td>
	</tr>
	<tr>
		<td rowspan="4">工作技能：</td>
		<td>工作技能：&nbsp;&nbsp;&nbsp;&nbsp;(10分)</td>
		<td><s:property value="examine.skillMark" />分</td>
	</tr>
	<tr>
		<td>沟通协调：&nbsp;&nbsp;&nbsp;&nbsp;(10分)</td>
		<td><s:property value="examine.coordinationMark" />分</td>
	</tr>
	<tr>
		<td>策划能力：&nbsp;&nbsp;&nbsp;&nbsp;(10分)</td>
		<td><s:property value="examine.planMark" />分</td>
	</tr>
	<tr>
		<td>执行能力：&nbsp;&nbsp;&nbsp;&nbsp;(10分)</td>
		<td><s:property value="examine.executeMark" />分</td>
	</tr>
	<tr>
		<td rowspan="2">工作业绩：</td>
		<td>工作业绩/质量:(10分)</td>
		<td><s:property value="examine.qualityMark" />分</td>
	</tr>
	<tr>
		<td>工作效率：&nbsp;&nbsp;&nbsp;&nbsp;(10分)</td>
		<td><s:property value="examine.efficiencyMark" />分</td>
	</tr>
	<tr>
		<th>合计得分：</th>
		<td colspan="3"><s:property value="examine.totalScore" />&nbsp;分</td>
	</tr>
	<tr>
		<th width="120px">综合评估：</th>
		<td colspan="3" style="width:590;word-break:break-all;height:104px;vertical-align:top;padding-top:5px" ><s:property value="examine.comprehensiveEvaluation" />&nbsp;</td>
	</tr>
	<tr>
		<th width="120px">审批结果：</th>
		<td colspan="3"><s:property value="examine.assessRes.description" />&nbsp;</td>
	</tr>
	<tr>
		<th>主管领导签字：</th>
		<td colspan="3"><s:property value="examine.assessmentPerson.person.name" />&nbsp;</td>
	</tr>
	<tr>
		<th>审批时间：</th>
		<td colspan="3"><s:date name="examine.assessmentTime" format="yyyy-MM-dd" />&nbsp;</td>
	</tr>
</table>
</s:iterator>
<br>
<p align="center"><img src="<%=request.getContextPath()%>/images/button/b_close.gif"
	onClick="window.close()" style="cursor:hand"></p>
<br>
</body>
</html>
