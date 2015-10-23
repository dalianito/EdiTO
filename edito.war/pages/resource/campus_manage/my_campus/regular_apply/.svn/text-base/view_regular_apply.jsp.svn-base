<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8">
<head>
	<title>查看转正申请</title>
	<link href="<%=request.getContextPath()%>/style/style_resource.css" rel="stylesheet" type="text/css">
</head>

<body class="BodyView">
<br>
<p align="center"><img src="<%=request.getContextPath()%>/images/title/title_regularApplication.gif"></p>
<s:iterator value="#request.regularApplication">
<table width="660" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">
	<tr>
		<th width="150">申请人：</th>
		<td width="180"><s:property value="apply.applicant.person.name" /></td>
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
		<th width="150">试用期起止时间：</th>
		<td width="180"><s:date name='fromDt' format="yyyy-MM-dd" />&nbsp;-&nbsp;<s:date name='toDt' format="yyyy-MM-dd" /></td>
		<th width="150">申请时间：</th>
		<td width="180"><s:date name='apply.applicationTime' format="yyyy-MM-dd HH:MM" />&nbsp;</td>
	</tr>
	<tr>
		<th width="150">试用期述职<br>(工作内容和成果)：</th>
		<td style="width:510;word-break:break-all;height:104px;vertical-align:top;padding-top:5px" colspan="3"><pre><s:property value='debrief' />&nbsp;</pre></td>
	</tr>
	<tr>
		<th width="150">转正后工作<br>开展计划：</th>
		<td style="width:510;word-break:break-all;height:104px;vertical-align:top;padding-top:5px" colspan="3"><pre><s:property value='workPlan' />&nbsp;</pre></td>
	</tr>
	<tr>
		<th width="150">其他建议：</th>
		<td style="width:510;word-break:break-all;height:104px;vertical-align:top;padding-top:5px" colspan="3"><pre><s:property value="suggestion" />&nbsp;</pre></td>
	</tr>
	<tr>
		<th width="150">申请人签字：</th>
		<td width="510" colspan="3"><s:property value="apply.applicant.person.name" />&nbsp;</td>
	</tr>
</table>

<s:if test="%{#request.approvalAuthority == '10000000040010001001000000701001'  || #request.approvalAuthority == '10000000040010001001000000702000' || #request.approvalAuthority == '10000000040010001001000000703000'}">
	<br>
	<table width="660" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">
		<tr>
			<th width="120px" rowspan="10">考评项目：</th>
			<td width="120px" rowspan="4">工作态度：</td>
			<td width="160px">出勤情况：&nbsp;&nbsp;&nbsp;&nbsp;(10分)</td>
			<td width="320px"><s:property value="approval.attendanceMark" />分&nbsp;&nbsp;&nbsp;&nbsp;请假<s:property value="approval.leaveCount" />次/迟到<s:property value="approval.lateCount" />次/旷工<s:property value="approval.absenceCount" />次</td>
		</tr>
		<tr>
			<td>行为规范：&nbsp;&nbsp;&nbsp;&nbsp;(10分)</td>
			<td><s:property value="approval.behaviorMark" />分</td>
		</tr>
		<tr>
			<td>工作责任感：&nbsp;&nbsp;(10分)</td>
			<td><s:property value="approval.responsibilityMark" />分</td>
		</tr>
		<tr>
			<td>工作勤懒：&nbsp;&nbsp;&nbsp;&nbsp;(10分)</td>
			<td><s:property value="approval.diligenceMark" />分</td>
		</tr>
		<tr>
			<td width="120px" rowspan="4">工作技能：</td>
			<td>工作技能：&nbsp;&nbsp;&nbsp;&nbsp;(10分)</td>
			<td><s:property value="approval.skillMark" />分</td>
		</tr>
		<tr>
			<td>沟通协调：&nbsp;&nbsp;&nbsp;&nbsp;(10分)</td>
			<td><s:property value="approval.coordinationMark" />分</td>
		</tr>
		<tr>
			<td>策划能力：&nbsp;&nbsp;&nbsp;&nbsp;(10分)</td>
			<td><s:property value="approval.planMark" />分</td>
		</tr>
		<tr>
			<td>执行能力：&nbsp;&nbsp;&nbsp;&nbsp;(10分)</td>
			<td><s:property value="approval.executeMark" />分</td>
		</tr>
		<tr>
			<td width="120px" rowspan="2">工作业绩：</td>
			<td>工作业绩/质量:(10分)</td>
			<td><s:property value="approval.qualityMark" />分</td>
		</tr>
		<tr>
			<td>工作效率：&nbsp;&nbsp;&nbsp;&nbsp;(10分)</td>
			<td><s:property value="approval.efficiencyMark" />分</td>
		</tr>
		<tr>
			<th>合计得分：</th>
			<td colspan="3"><s:property value="approval.totalScore" />分</td>
		</tr>
		<tr>
			<th>综合评估：</th>
			<td colspan="3" style="word-break:break-all;height:104px;vertical-align:top;padding-top:5px"><pre><s:property value="apply.notesOne" />&nbsp;</pre></td>
		</tr>
		<s:if  test="#request.regularApplication.apply.checkStateOneUuid == '10000000010070001001000000000040'">
			<tr>
				<th>审批结果：</th>
				<td colspan="3"><s:property value="apply.checkStateOne.description" />&nbsp;<s:property value="approval.prolongMonth" />月</td>
			</tr>
		</s:if>
		<s:else>
			<tr>
				<th>审批结果：</th>
				<td colspan="3"><s:property value="apply.checkStateOne.description" />&nbsp;</td>
			</tr>
		</s:else>
		<tr>
			<th>主管领导签字：</th>
			<td colspan="3"><s:property value="apply.checkerOne.person.name" />&nbsp;</td>
		</tr>
	</table>
</s:if>
<s:if test="%{#request.approvalAuthority == '10000000040010001001000000701002'  || #request.approvalAuthority == '10000000040010001001000000702000' || #request.approvalAuthority == '10000000040010001001000000703000'}">
	<br>
	<table width="660" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">
		<tr>
			<th width="150">教研表现：</th>
			<td style="word-break:break-all;height:104px;vertical-align:top;padding-top:5px"><pre><s:property value="approval.teachPerformance" />&nbsp;</pre></td>
		</tr>
		<tr>
			<th>综合评估：</th>
			<td style="word-break:break-all;height:104px;vertical-align:top;padding-top:5px"><pre><s:property value="apply.notesTwo" />&nbsp;</pre></td>
		</tr>
		<tr>
			<th>审批结果：</th>
			<td><s:property value="apply.checkStateTwo.description" />&nbsp;</td>
		</tr>
		<tr>
			<th>学科负责人签字：</th>
			<td><s:property value="apply.checkerTwo.person.name" />&nbsp;</td>
		</tr>
	</table>
</s:if>
<s:if test="%{#request.approvalAuthority == '10000000040010001001000000701003'  || #request.approvalAuthority == '10000000040010001001000000702000' || #request.approvalAuthority == '10000000040010001001000000703000'}">
	<br>
	<table width="660" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">
		<tr>
			<th width="150">所授课程、时间：</th>
			<td style="word-break:break-all;height:104px;vertical-align:top;padding-top:5px"><pre><s:property value="approval.teachEXInfo" />&nbsp;</pre></td>
		</tr>
		<tr>
			<th>综合评估：</th>
			<td style="word-break:break-all;height:104px;vertical-align:top;padding-top:5px"><pre><s:property value="apply.notesThree" />&nbsp;</pre></td>
		</tr>
		<tr>
			<th>审批结果：</th>
			<td ><s:property value="apply.checkStateThree.description" />&nbsp;</td>
		</tr>
		<tr>
			<th>评估人签字：</th>
			<td><s:property value="apply.checkerThree.person.name" />&nbsp;</td>
		</tr>
	</table>
</s:if>
<s:if test="%{#request.approvalAuthority == '10000000040010001001000000702000' || #request.approvalAuthority == '10000000040010001001000000703000'}">
	<br>
	<table width="660" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">
		<tr>
			<th width="150">人力资源意见：</th>
			<td style="word-break:break-all;height:104px;vertical-align:top;padding-top:5px"><pre><s:property value="apply.notesFour" />&nbsp;</pre></td>
		</tr>
		<tr>
			<th>审批结果：</th>
			<td><s:property value="apply.checkStateFour.description" />&nbsp;</td>
		</tr>
		<tr>
			<th>人力资源确认签字：</th>
			<td><s:property value="apply.checkerFour.person.name" />&nbsp;</td>
		</tr>
	</table>
	<br>
	<table width="660" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">
		<tr>
			<th width="150">行政校长意见：</th>
			<td style="word-break:break-all;height:104px;vertical-align:top;padding-top:5px"><pre><s:property value="apply.notesFive" />&nbsp;</pre></td>
		</tr>
		<tr>
			<th>审批结果：</th>
			<td ><s:property value="apply.checkStateFive.description" />&nbsp;</td>
		</tr>
		<tr>
			<th>行政校长确认签字：</th>
			<td><s:property value="apply.checkerFive.person.name" />&nbsp;</td>
		</tr>
	</table>
</s:if>
</s:iterator>
<br>
<p align="center"><img src="<%=request.getContextPath()%>/images/button/b_close.gif"
	onClick="window.close()" style="cursor:hand"></p>
<br>
</body>
</html>
