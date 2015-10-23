<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.ito.edito.schema.User"%>
<html>
<head>
	<script>var cp="<%=request.getContextPath()%>";</script>
	<link href="<%=request.getContextPath()%>/style/style_resource.css" rel="stylesheet" type="text/css">
	<script src="<%=request.getContextPath()%>/js/jquery-1.4.2.js"></script>
	<script src="<%=request.getContextPath()%>/js/iscript.js"></script>
	<script src="<%=request.getContextPath()%>/js/submit.js"></script>
	<script src="<%=request.getContextPath()%>/js/validation.js"></script>
	<title>修改密码</title>
</head>
<body class="BodyView" style="width:450px">
<script>
Validation.init("resource/human_manage/employee_manage/edit_password.xml");
function updatePassword(formId,new_input,rpt_input){
	if(Validation.excuteValidate(formId)){
		if($('input[name="'+new_input+'"]').val()==$('input[name="'+rpt_input+'"]').val()){
			if(confirm("确认操作？")){
				var param = Submit.excute(formId);
				param[param.length] = {name:"role",value:"personal"};
				$.post(cp+"/ajaxs/resource/human/manage/employee/manage/update_user_password.html" ,param, function(data){
					if(data=="1"){
						alert("用户旧密码不正确,请重新输入！");
					}
					else if(data=="2"){
						alert("更新密码成功！");
						window.close();
					}
					$("[name='old_password']").val("");
					$("[name='new_password']").val("");
					$("[name='rpt_password']").val("");
				})	
			}
		}
		else{
		  	alert("新密码输入不一致，请重新输入！");
			$("[name='new_password']").val("");
			$("[name='rpt_password']").val("");
		}
	}
}
</script>

<p align="center"><br><img
	src="<%=request.getContextPath()%>/images/title/title_psw.gif"></p>
<form id="formA">
<p align="center">
<table width="300" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="80">用户帐号</th>
		<td><%=((User) request.getSession().getAttribute("LOGIN_USER")).getAccount() %></td>
	</tr>
	<tr>
		<th width="80">用户旧密码</th>
		<td><input type="password" name="old_password" validate="true" />&nbsp;<font color="#996633">*</font></td>
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
</p>
</form>
<div id="DISPLAY"></div>
<p><img src="<%=request.getContextPath()%>/images/button/b_confirm_2.gif" onClick="updatePassword('formA','new_password','rpt_password')" style="cursor:hand">&nbsp;
<img src="<%=request.getContextPath()%>/images/button/b_close.gif" onClick="window.close()" style="cursor:hand"></p>
</body>
</html>
