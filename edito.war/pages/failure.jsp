<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<html>
<head>
<title>Edito 登录页面</title>
<link rel="Shortcut Icon"  href="<%=request.getContextPath()%>/images/favicon.ico">
<link href="<%=request.getContextPath()%>/style/style_edito.css" rel="stylesheet" type="text/css">
</head>

<body class="body_login">
<div class="content_login">
<form action="j_security_check" method="post">
<div class="login">
<table align="right">
	<tr>
		<td align="left">&nbsp;用户名：</td>
		<td align="left"><input type="text" name="j_username" onmouseover="this.focus()" onfocus="this.select()" style="width:145px;height:16px" /></td>
	</tr>
	<tr>
		<td align="left">&nbsp;密&nbsp;&nbsp;码：</td>
		<td align="left"><input name="j_password" type="password" onmouseover="this.focus()" onfocus="this.select()" style="width:145px;height:16px" /></td>
	</tr>
	<tr>
		<td colspan="2"><input type="image" src="<%=request.getContextPath()%>/images/loginEdito/b_signon.gif" alt="登录" />
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td colspan="2"><font color="red">用户名或密码错误，请重新登录！</font></td>
	</tr>
</table>
</div>
</form>
</div>
</body>
</html>
