<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.ito.edito.util.Constants" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
	<title>月度考核</title>
</head>
<body>
<script>
Validation.init("resource/campus_manage/my_campus/month_assess/create_month_assess.xml");
function createInstance(elementId){
	if(Validation.excuteValidate(elementId)){
		if(confirm("提交评估后将无法修改，确认操作？")){
			var param = Submit.excute(elementId);
			$.post(cp+"/ajaxs/resource/campus/manage/my/campus/month/assess/create_month_assess.html",param,function(data){
				location.href = cp + "/pages/resource/campus/manage/my/campus/month/assess/query_month_assess.html";
			});
		}
	}
}
function calculateSum() {
	var sum = 0;
	for(var i=1; i <= 10; i++){
		sum += parseInt($("#score_"+i).val());
	}
	$("#score_sum").html(sum);
}
</script>
<div style="font-family:黑体;font-size:20px;">&nbsp;月 度 考 核</div>
<br><br><br>
<s:iterator value="#request.selfAssess">
<form id="formA">
<s:if test="%{#request.selfAssess.selfAssessTypeUuid == '10000000020130001001000000000010'}">
	<div><font style="font-weight:bold;font-size:12px" color="FF0033">（试用期自评）</font></div>
</s:if>
<input type="hidden" name="instance(SelfAssess).uuid" value="<s:property value="uuid" />"  />
<input type="hidden" name="instance(SelfAssess).timeStamp" value="<s:property value="timeStamp" />" />
<input type="hidden" name="instance(SelfAssessExamine).uuid" value="<s:property value="examineUuid" />" />
<input type="hidden" name="instance(SelfAssessExamine).timeStamp" value="<s:property value="examine.timeStamp" />" />
<table width="720" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="120">申请人：</th>
		<td width="240">
			<s:property value="selfAssessEmployee.person.name" />
		</td>
		<th width="120">组织机构：</th>
		<td width="240"><s:property value="department.description" />&nbsp;</td>
	</tr>
	<tr>
		<th width="120">校区：</th>
		<td width="240"><s:property value="campus.description" />&nbsp;</td>
		<th width="120">岗位：</th>
		<td width="240"><s:property value="job.description" />&nbsp;</td>
	</tr>
<s:if test="%{#request.selfAssess.selfAssessTypeUuid == '10000000020130001001000000000010'}">
	<tr>
		<th width="120">自评时间：</th>
		<td width="240"><s:date name="selfAssessTime" format="yyyy-MM-dd" />&nbsp;</td>
		<th width="120">试用期起止时间：</th>
		<td width="240"><s:date name="fromDt" format="yyyy-MM-dd" />&nbsp;-&nbsp;<s:date name="toDt" format="yyyy-MM-dd" />&nbsp;</td>
	</tr>
</s:if>
<s:if test="%{#request.selfAssess.selfAssessTypeUuid == '10000000020130001001000000000020'}">
		<th width="120">自评时间：</th>
		<td colspan="3"><s:date name="selfAssessTime" format="yyyy-MM-dd" />&nbsp;</td>
</s:if>
	<tr>
		<th width="120">主要工作内容：</th>
		<td style="width:600;word-break:break-all;height:104px;vertical-align:top;padding-top:5px" colspan="3"><s:property value="workContant" /></td>
	</tr>
	<tr>
		<th width="120">如何看待学校现<br>行的规章制度：</th>
		<td style="width:600;word-break:break-all;height:104px;vertical-align:top;padding-top:5px" colspan="3"><s:property value="thinkings" />&nbsp;</td>
	</tr>
	<tr>
		<th width="120">成长与收获：</th>
		<td style="width:600;word-break:break-all;height:104px;vertical-align:top;padding-top:5px" colspan="3"><s:property value="harvest" /></td>
	</tr>
	<tr>
		<th width="120">内观与反思：</th>
		<td style="width:600;word-break:break-all;height:104px;vertical-align:top;padding-top:5px" colspan="3"><s:property value="reflect" /></td>
	</tr>
</table>
<br>
<table width="720" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="123px" rowspan="10">考评项目：</th>
		<td width="120px" rowspan="4">工作态度：</td>
		<td width="160px">出勤情况：&nbsp;&nbsp;&nbsp;&nbsp;(10分)</td>
		<td width="320px"><input type="text" style="width:25px" id="score_1" name="instance(SelfAssessExamine).attendanceMark" onchange="javascript:calculateSum()" value="0" validate="true" />分&nbsp;&nbsp;&nbsp;&nbsp;请假<input type="text" style="width:25px" name="instance(SelfAssessExamine).leaveCount" validate="true" value="0" />次/迟到<input type="text" style="width:25px" name="instance(SelfAssessExamine).lateCount" validate="true" value="0" />次/旷工<input type="text" style="width:25px" name="instance(SelfAssessExamine).absenceCount" validate="true" value="0" />次</td>
	</tr>
	<tr>
		<td>行为规范：&nbsp;&nbsp;&nbsp;&nbsp;(10分)</td>
		<td><input type="text" style="width:25px" id="score_2" name="instance(SelfAssessExamine).behaviorMark" onchange="javascript:calculateSum()" value="0" validate="true" />分</td>
	</tr>
	<tr>
		<td>工作责任感：&nbsp;&nbsp;(10分)</td>
		<td><input type="text" style="width:25px" id="score_3" name="instance(SelfAssessExamine).responsibilityMark" onchange="javascript:calculateSum()" value="0" validate="true" />分</td>
	</tr>
	<tr>
		<td>工作勤懒：&nbsp;&nbsp;&nbsp;&nbsp;(10分)</td>
		<td><input type="text" style="width:25px" id="score_4" name="instance(SelfAssessExamine).diligenceMark" onchange="javascript:calculateSum()" value="0" validate="true" />分</td>
	</tr>
	<tr>
		<td rowspan="4">工作技能：</td>
		<td>工作技能：&nbsp;&nbsp;&nbsp;&nbsp;(10分)</td>
		<td><input type="text" style="width:25px" id="score_5" name="instance(SelfAssessExamine).skillMark" onchange="javascript:calculateSum()" value="0" validate="true" />分</td>
	</tr>
	<tr>
		<td>沟通协调：&nbsp;&nbsp;&nbsp;&nbsp;(10分)</td>
		<td><input type="text" style="width:25px" id="score_6" name="instance(SelfAssessExamine).coordinationMark" onchange="javascript:calculateSum()" value="0" validate="true" />分</td>
	</tr>
	<tr>
		<td>策划能力：&nbsp;&nbsp;&nbsp;&nbsp;(10分)</td>
		<td><input type="text" style="width:25px" id="score_7" name="instance(SelfAssessExamine).planMark" onchange="javascript:calculateSum()" value="0" validate="true" />分</td>
	</tr>
	<tr>
		<td>执行能力：&nbsp;&nbsp;&nbsp;&nbsp;(10分)</td>
		<td><input type="text" style="width:25px" id="score_8" name="instance(SelfAssessExamine).executeMark" onchange="javascript:calculateSum()" value="0" validate="true" />分</td>
	</tr>
	<tr>
		<td rowspan="2">工作业绩：</td>
		<td>工作业绩/质量:(10分)</td>
		<td><input type="text" style="width:25px" id="score_9" name="instance(SelfAssessExamine).qualityMark" onchange="javascript:calculateSum()" value="0" validate="true" />分</td>
	</tr>
	<tr>
		<td>工作效率：&nbsp;&nbsp;&nbsp;&nbsp;(10分)</td>
		<td><input type="text" style="width:25px" id="score_10" name="instance(SelfAssessExamine).efficiencyMark" onchange="javascript:calculateSum()" value="0" validate="true" />分</td>
	</tr>
	<tr>
		<th>合计得分：</th>
		<td colspan="3"><div id="score_sum" name="instance(SelfAssessExamine).totalScore" style="display:inline;width:30px" >0</div>&nbsp;&nbsp;分</td>
	</tr>
	<tr>
		<th width="120px">综合评估：</th>
		<td colspan="3" width="600px" height="104px"><textarea name="instance(SelfAssessExamine).comprehensiveEvaluation" style="width:582px;height:100px;margin-right:-300px"></textarea></td>
	</tr>
	<tr>
		<th width="120px">审批结果：</th>
		<td width="600px" colspan="3"><select name="instance(SelfAssessExamine).assessResUuid" ><option value="<%=Constants.ASSESS_RESULT_PASS%>">通过</option><option value="<%=Constants.ASSESS_RESULT_DISMISS%>">辞退</option><option value="<%=Constants.ASSESS_RESULT_POST%>">调岗</option></select></td>
	</tr>
	<tr>
		<th>主管领导签字：</th>
		<td colspan="3"><s:property value="#session.LOGIN_EMPLOYEE.person.name" /></td>
	</tr>
</table>
</form>
</s:iterator>
<br>
<a href="javascript:createInstance('formA')" >
<img src="<%=request.getContextPath()%>/images/button/b_confirm_2.gif" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="<%=request.getContextPath()%>/pages/resource/campus/manage/my/campus/month/assess/query_month_assess.html" >
<img src="<%=request.getContextPath()%>/images/button/b_cancel.gif" /></a>
<br>
</body>
</html>
