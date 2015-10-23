<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page import="com.ito.edito.util.Constants" %>
<html>
<head>
	<title>编辑课程</title>
	<script src="<%=request.getContextPath()%>/js/select_tree.js"></script>
</head>
<body>
<form id="form" name="form" method="post">
<input type="hidden" name="uuid" />
<input type="hidden" name="type" />
</form>
<script>
Validation.init("content/course_manage/course_generate/create_course.xml");

function createInstance(elementId){
	if(Validation.excuteValidate(elementId)){
		if(confirm("确认编辑？")){
			var param=Submit.excute(elementId);
			$.post(cp+"/ajaxs/content/course/manage/course/generate/create_course.html",param,function(){
				location.href = cp+"/pages/content/course/manage/course/inquiry/query_course_inquiry.html";
			})
		}
	}
}
</script>
<iframe name="hiddenPage" style="display:none"></iframe>
<div style="font-family:黑体;font-size:20px;">&nbsp;编 辑 课 程</div>
<br><br><br>
<s:iterator value="#request.course">
<form id="formA">
<input type="hidden" name="instance(Course).uuid" value="<s:property value='uuid' />" />
<input type="hidden" name="instance(Course).timeStamp" value="<s:property value='timeStamp' />" />
<table width="660" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="120">课程编号</th>
		<td width="210"><input name="instance(Course).courseNo" style="width:150px" value="<s:property value='courseNo' />" validate="true" />&nbsp;<font color="#996633">*</font></td>
		<th width="120">课程名</th>
		<td width="210"><input name="instance(Course).courseName" style="width:150px" value="<s:property value='courseName' />" validate="true" />&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<th width="120">课程类别</th>
		<td width="210"><label name="instance(Course).courseTypeUuid" class="BaseTree" javaClassName="CourseCategoryType" value="<s:property value='courseTypeUuid' />" validate="true" ></label>&nbsp;<font color="#996633">*</font></td>
		<th width="120">预计总费用</th>
		<td width="210"><input name="instance(Course).expectedCost" style="width:150px" value="<s:property value='expectedCost' />" validate="true">&nbsp;<font color="#996633">*</font>&nbsp;元</td>
	</tr>
	<tr>
		<th width="120">预计总课时</th>
		<td width="210"><input name="instance(Course).expectedHour" style="width:150px" value="<s:property value='expectedHour' />" />&nbsp;课时</td>
		<th width="120">学期</th>
		<td width="210"><input name="instance(Course).semesterTime" style="width:150px" value="<s:property value='semesterTime' />" /></td>
	</tr>
	<tr>
		<th width="120">适合学员</th>
		<td colspan="3" style="height:64px;width:540px"><textarea name="instance(Course).fitableStudent" style="height:63px;width:539px" ><s:property value='fitableStudent' /></textarea></td>
	</tr>
	<tr>
		<th width="120">课程简介</th>
		<td colspan="3" style="height:64px;width:540px"><textarea name="instance(Course).courseDescription" style="height:63px;width:539px" ><s:property value='courseDescription' /></textarea></td>
	</tr>
	<tr>
		<th width="120">教学目标</th>
		<td colspan="3" style="height:64px;width:540px"><textarea name="instance(Course).teachingTarget" style="height:63px;width:539px" ><s:property value='teachingTarget' /></textarea></td>
	</tr>
	<tr>
		<th width="120">授课内容</th>
		<td colspan="3" style="height:64px;width:540px"><textarea name="instance(Course).teachingContent" style="height:63px;width:539px" ><s:property value='teachingContent' /></textarea></td>
	</tr>
	<tr>
		<th width="120">课程特色</th>
		<td colspan="3" style="height:64px;width:540px"><textarea name="instance(Course).teachingFeature" style="height:63px;width:539px" ><s:property value='teachingFeature' /></textarea></td>
	</tr>
	<tr>
		<th width="120">教材说明</th>
		<td colspan="3" style="height:64px;width:540px"><textarea name="instance(Course).relatedMaterials" style="height:63px;width:539px" ><s:property value='relatedMaterials' /></textarea></td>
	</tr>
	<tr>
		<th width="120">其他</th>
		<td colspan="3" style="height:64px;width:540px"><textarea name="instance(Course).notes" style="height:63px;width:539px" ><s:property value='notes' /></textarea></td>
	</tr>
</table>
<br>
</form>
</s:iterator>
<a href="javascript:createInstance('formA')">
<img src="<%=request.getContextPath()%>/images/button/b_confirm_2.gif" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="<%=request.getContextPath()%>/pages/content/course/manage/course/inquiry/query_course_inquiry.html" >
<img src="<%=request.getContextPath()%>/images/button/b_cancel.gif" /></a>
<br>
</body>
</html>
