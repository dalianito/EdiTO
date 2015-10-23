<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
	<title>修改密码</title>
</head>
<body>
<script>
Validation.init("resource/human_manage/employee_manage/edit_password.xml");

function modifyPassword(formId,new_input,rpt_input){
	if(Validation.excuteValidate(formId)){
		if($('input[name="'+new_input+'"]').val()==$('input[name="'+rpt_input+'"]').val()){
			if(confirm("确认操作？")){
				var param = Submit.excute(formId);
				param[param.length] = {name:"role",value:"admin"};
				$.post(cp + "/ajaxs/resource/human/manage/employee/manage/update_user_password.html",param, function(){
					alert("密码修改成功！");
					location.href = cp+"/pages/resource/human/manage/employee/manage/query_employee_manage.html";
				})	
			}
		}
		else{
			alert("新密码输入不一致，请重新输入！");
			$('input[name="'+new_input+'"]').val("");
			$('input[name="'+rpt_input+'"]').val("");
			$('input[name="'+new_input+'"]').focus();
		}
	}
}
</script>
<div style="font-family:黑体;font-size:20px;">&nbsp;员 工 信 息 管 理</div>
<br><br><br>
<form id="formA">
<input type="hidden" name="account" value="<s:property value='#request.account' />" />
<table width="275" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="80">用户帐号</th>
		<td><s:property value="#request.account" /></td>
	</tr>
	<tr>
		<th width="80">用户新密码</th>
		<td><input type="password" name="new_password" validate="true" />&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<th width="80">重复新密码</th>
		<td><input type="password" name="rpt_password" validate="true" />&nbsp;<font color="#996633">*</font></td>
	</tr>
</table>
</form>
<br>
<a href="javascript:modifyPassword('formA','new_password','rpt_password')" >
<img src="<%=request.getContextPath()%>/images/button/b_confirm_2.gif" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="<%=request.getContextPath()%>/pages/resource/human/manage/employee/manage/query_employee_manage.html" >
<img src="<%=request.getContextPath()%>/images/button/b_cancel.gif" /></a>
<br>
</body>
</html>
