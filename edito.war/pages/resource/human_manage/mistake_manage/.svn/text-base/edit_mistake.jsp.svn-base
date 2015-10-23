<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
	<title>编辑员工差错</title>
</head>
<body>
<script>
Validation.init("resource/human_manage/mistake_manage/create_mistake.xml");
function createInstance(elementId){
	if(Validation.excuteValidate(elementId)){
		if(confirm("确认操作？")){
			var param=Submit.excute(elementId);
			$.post(cp+"/ajaxs/resource/human/manage/mistake/manage/create_mistake.html",param,function(data){
				location.href = cp+"/pages/resource/human/manage/mistake/manage/query_mistake_manage.html";
			})
		}
	}
}
</script>
<div style="font-family:黑体;font-size:20px;">&nbsp;员 工 差 错 管 理</div>
<br><br><br>
<s:iterator value="#request.mistake">
<form id="formA" name="formA" method="post" enctype="multipart/form-data">
<input type="hidden" name="instance(Mistake).uuid" value="<s:property value='uuid' />" />
<input type="hidden" name="instance(Mistake).timeStamp" value="<s:property value='timeStamp' />" />
<input type="hidden" name="instance(Mistake).ifUsing" value="<s:property value='ifUsing' />" />
<table width="580" border="0" cellpadding="0" cellspacing="0" class="InputPanel">
	<tr>
		<th width="100">标题：</th>
		<td width="480"><input type="text" name="instance(Mistake).title" style="width:440px" size="20" validate="true" value="<s:property value='title' />"/>&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<th>内容：</th>
		<td><textarea name="instance(Mistake).content" style="width:440px;height:100px" validate="true" ><s:property value="content" /></textarea>&nbsp;<font color="#996633">*</font></td>
	</tr>
	<tr>
		<th>记录人：</th>
		<td>
			<s:property value="#session.LOGIN_USER.person.name" />
		</td>
	</tr>
</table>
</form>
</s:iterator>
<br>
<a href="javascript:createInstance('formA')" >
<img src="<%=request.getContextPath()%>/images/button/b_confirm_2.gif" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="<%=request.getContextPath()%>/pages/resource/human/manage/mistake/manage/query_mistake_manage.html" >
<img src="<%=request.getContextPath()%>/images/button/b_cancel.gif" /></a>
<br>
</body>
</html>
