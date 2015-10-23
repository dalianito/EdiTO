<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.ito.edito.util.Constants"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title>编辑面谈记录</title>
</head>
<body>
<script>
Validation.init("resource/campus_manage/my_campus/interview_record/create_interview_record.xml");
var mark = true;
function createInstance(elementId){
	if(mark){
		if(Validation.excuteValidate(elementId)){
			if(confirm("确认操作？")){
				mark = false;
				var param = Submit.excute(elementId);
				$.post(cp+"/ajaxs/resource/campus/manage/my/campus/interview/record/create_interview_record.html",param,function(data){
					location.href = cp + "/pages/resource/campus/manage/my/campus/interview/record/query_interview_record.html";
					
				});
			}
		}
	}
	else {
		alert("操作进行中，请勿重复点击！");
	}
}

function updateRelation(data){
	$("label[name='instance(InterviewRecord).intervieweeCampusUuid']").val(data["employee"].campusUuid);
	$("label[name='instance(InterviewRecord).intervieweeDepartmentUuid']").val(data["employee"].departmentUuid);
	if(data["employee"].jobUuid != null){
		$("label[name='instance(InterviewRecord).intervieweeJobUuid']").val(data["employee"].jobUuid);
	}

}
function clearRelationData(relationId){
	$("label[name='instance(InterviewRecord).intervieweeCampusUuid']").val("");
	$("label[name='instance(InterviewRecord).intervieweeJobUuid']").val("");
	$("label[name='instance(InterviewRecord).intervieweeDepartmentUuid']").val("");
}
</script>

<div style="font-family: 黑体; font-size: 20px;">&nbsp;面 谈 记 录</div>
<br>
<br>
<br>

<s:iterator value="#request.interviewRecord">
	<form id="formA"><input type="hidden"
		name="instance(InterviewRecord).uuid"
		value="<s:property value='uuid' />" /> <input type="hidden"
		name="instance(InterviewRecord).timeStamp"
		value="<s:property value='timeStamp' />" /> <input type="hidden"
		name="instance(InterviewRecord).interviewerUuid"
		value="<s:property value='interviewerUuid' />" /> <input
		type="hidden" name="instance(InterviewRecord).interviewerCampusUuid"
		value="<s:property value='interviewerCampusUuid' />" /> <input
		type="hidden"
		name="instance(InterviewRecord).interviewerDepartmentUuid"
		value="<s:property value='interviewerDepartmentUuid' />" /> <input
		type="hidden" name="instance(InterviewRecord).interviewerJobUuid"
		value="<s:property value='interviewerJobUuid' />" />
	<table width="720" border="0" cellpadding="0" cellspacing="0"
		class="InputPanel">
		<tr>
			<th width="80">面谈人：</th>
			<td width="100"><s:property value='interviewer.person.name' /></td>
			<th width="80">校区：</th>
			<td width="100"><s:property
				value='interviewerCampus.description' /></td>
			<th width="80">组织机构：</th>
			<td width="100"><s:property
				value='interviewerDepartment.description' /></td>
			<th width="80">岗位：</th>
			<td width="100"><s:property value='interviewerJob.description' /></td>
		</tr>
		<tr>
			<th width="80">被面谈人：</th>
			<td width="100"><input
				name="instance(InterviewRecord).intervieweeUuid"
				value="<s:property value='intervieweeUuid' />"
				nextSiblingName="employeeName"
				nextSiblingValue="<s:property value='interviewee.person.name' />"
				class="DropMenu"
				actionPath="<%=request.getContextPath()%>/ajaxs/drop/menu/query_employee_drop_menu.html"
				execute="true"
				executeUrl="<%=request.getContextPath()%>/ajaxs/drop/menu/query_employee_info.html"
				relationId="curPerson" validate="true" />&nbsp;<font
				color="#996633">*</font>&nbsp;</td>
			<th width="80">校区：</th>
			<td width="100"><label
				name="instance(InterviewRecord).intervieweeCampusUuid"
				value="<s:property value='intervieweeCampusUuid' />"
				class="BaseTree" javaClassName="Campus" validate="true"></label>&nbsp;<font
				color="#996633">*</font></td>
			<th width="80">组织机构：</th>
			<td width="100"><label
				name="instance(InterviewRecord).intervieweeDepartmentUuid"
				value="<s:property value='intervieweeDepartmentUuid' />"
				class="BaseTree" javaClassName="Department" validate="true"></label>&nbsp;<font
				color="#996633">*</font></td>
			<th width="80">岗位：</th>
			<td width="100"><label
				name="instance(InterviewRecord).intervieweeJobUuid"
				value="<s:property value='intervieweeJobUuid' />" class="BaseTree"
				javaClassName="Job" validate="true"></label>&nbsp;<font
				color="#996633">*</font></td>
		</tr>
		<tr>
			<th width="80">面谈日期：</th>
			<td width="640" colspan="7"><label type="text"
				name="instance(InterviewRecord).interviewDate"
				value="<s:date name='interviewDate' format='yyyy-MM-dd' />"
				class="DateTimeSingle" format="all" validate="true"></label>&nbsp;<font
				color="#996633">*</font></td>
		</tr>
		<tr>
			<th width="80">面谈目的：</th>
			<td width="640" colspan="7"><textarea
				name="instance(InterviewRecord).interviewPurpose"
				style="width: 620px; height: 100px; margin-right: -300px" /><s:property
				value='interviewPurpose' /></textarea><br>
			</td>
		</tr>
		<tr>
			<th width="80">面谈主要<br>
			内容：</th>
			<td width="640" colspan="7"><textarea
				name="instance(InterviewRecord).interviewContent"
				style="width: 620px; height: 100px; margin-right: -300px" /><s:property
				value='interviewContent' /></textarea><br>
			</td>
		</tr>
		<tr>
			<th width="80">面谈结果<br>
			与总结：</th>
			<td width="640" colspan="7"><textarea
				name="instance(InterviewRecord).interviewSummary"
				style="width: 620px; height: 100px; margin-right: -300px" /><s:property
				value='interviewSummary' /></textarea><br>
			</td>
		</tr>
	</table>
	<br>
	</form>
</s:iterator>
<a href="javascript:createInstance('formA')"> <img
	src="<%=request.getContextPath()%>/images/button/b_confirm_2.gif" /></a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a
	href="<%=request.getContextPath()%>/pages/resource/campus/manage/my/campus/interview/record/query_interview_record.html">
<img src="<%=request.getContextPath()%>/images/button/b_cancel.gif" /></a>
<br>
</body>
</html>
