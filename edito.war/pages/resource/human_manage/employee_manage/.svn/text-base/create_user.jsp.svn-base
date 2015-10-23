<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
<head>
	<title>创建用户</title>
</head>
<body>
<script>
Validation.init("resource/human_manage/employee_manage/create_user.xml");

function createAccount(elementId){
	$.ajaxSetup({async:false});
	if(Validation.excuteValidate(elementId)){
		checkExist();
		if(mark){
			var password = $("input[name='instance(User).password']").val();
			var repPassword = $("input[name='repPassword']").val();
			if(password != repPassword){
				alert("密码输入不一致，请重新输入！");
				$("input[name='instance(User).password']").val("");
				$("input[name='repPassword']").val("");
				$("input[name='instance(User).password']").focus();
			}
			else {
				if(confirm("确认操作？")){
					var param=Submit.excute(elementId);
					$.post(cp+"/ajaxs/resource/human/manage/employee/manage/create_user.html",param,function(){
						location.href=cp+"/pages/resource/human/manage/employee/manage/query_employee_manage.html";
					})
				}
			}
		}
	}
}
var mark;
function checkExist(){
	var account = $("input[name='instance(User).account']").val();
	if(account!=""){
		$.post(cp+"/ajaxs/resource/human/manage/employee/manage/check_employee_username.html",{account:account},function(data){
			var element = $('input[name="instance(User).account"]');
			if(data=="1"){
				mark = false;
				alert("此用户名已经被人占用，请尝试使用其他用户名！");
				element.focus();
			}
			else {
				mark = true;
			}
		})
	}
}
</script>
<div style="font-family:黑体;font-size:20px;">&nbsp;员 工 信 息 管 理</div>
<br><br><br>
<s:iterator value="#request.employee">
<table width="350" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel">
	<tr>
		<th width="100">员工号：</th>
		<td><s:property value="person.personNo" /></td>
	</tr>
	<tr>
		<th>姓名：</th>
		<td><s:property value="person.name" /></td>
	</tr>
	<tr>
		<th>性别：</th>
		<td><s:property value="person.gender.description" /></td>
	</tr>
	<tr>
		<th>出生日期：</th>
		<td><s:date name="person.birthDate" format="yyyy-MM-dd" />&nbsp;</td>
	</tr>
	<tr>
		<th>民族：</th>
		<td><s:property value="person.nationality.description" /></td>
	</tr>
	<tr>
		<th>国籍：</th>
		<td><s:property value="person.country.description" /></td>
	</tr>
	<tr>
		<th>身份证号：</th>
		<td><s:property value="person.idNo" /></td>
	</tr>
	<tr>
		<th>学历：</th>
		<td><s:property value="person.education.description" /></td>
	</tr>
	<tr>
		<th>校区：</th>
		<td><s:property value="campus.description" /></td>
	</tr>
	<tr>
		<th>岗位：</th>
		<td><s:property value="job.description" /></td>
	</tr>
	<tr>
		<th>组织机构：</th>
		<td><s:property value="department.description" /></td>
	</tr>
	<tr>
		<th>政治面貌：</th>
		<td><s:property value="person.political.description" /></td>
	</tr>
	<tr>
		<th>手机：</th>
		<td><s:property value="person.cellPhone" /></td>
	</tr>
	<tr>
		<th>工作电话：</th>
		<td><s:property value="workPhone" /></td>
	</tr>
	<tr>
		<th>电子邮件：</th>
		<td><s:property value="person.email" /></td>
	</tr>
	<tr>
		<th>入职时间：</th>
		<td><s:date name="fromDate" format="yyyy-MM-dd" />&nbsp;</td>
	</tr>
</table>
<br>
<form id="form">
<input type="hidden" name="instance(User).personUuid" value="<s:property value='person.uuid' />" />
<table width="350" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="100">用户名：</th>
		<td><input type="text" name="instance(User).account" size="25" validate="true" />&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<th width="100">密码：</th>
		<td><input type="password" name="instance(User).password" size="25" validate="true" />&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<th width="100">重复密码：</th>
		<td><input type="password" name="repPassword" size="25" validate="true" />&nbsp;<font color="#996633">*</font></td>
	</tr>
</table>
</form>
</s:iterator>
<br>
<a href="javascript:createAccount('form')">
<img src="<%=request.getContextPath()%>/images/button/b_confirm_2.gif" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="<%=request.getContextPath()%>/pages/resource/human/manage/employee/manage/query_employee_manage.html" >
<img src="<%=request.getContextPath()%>/images/button/b_cancel.gif" /></a>
<br>
</body>
</html>
