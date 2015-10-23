<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8">
<head>
	<title>查看历史日志</title>
	<link href="<%=request.getContextPath()%>/style/style_resource.css" rel="stylesheet" type="text/css">
	<script>var cp = "<%=request.getContextPath()%>";</script>
	<script src="<%=request.getContextPath()%>/js/jquery-1.4.2.js"></script>
	<STYLE type="text/css">
		pre {
			white-space: pre-wrap; 
			white-space: -moz-pre-wrap; 
			white-space: -pre-wrap; 
			white-space: -o-pre-wrap; 
			Word-wrap: break-word; 
			}
	</STYLE>
</head>

<body class="BodyView" style="width:600">
<form id="formA" name="form" method="post">
<input type="hidden" name="uuid" />
<input type="hidden" name="type" />
</form>
<script>
function downloadResource(uuid){
	var f = document.getElementById("formA");
	f.action = cp + "/views/resource/campus/manage/my/campus/work/record/forward_file.html";
	f.uuid.value = uuid;
	f.type.value = "workRecord";
	f.submit();
}
</script>
<br>
<p align="center"><img src="<%=request.getContextPath()%>/images/title/title_workRecord.gif"></p>
<s:iterator value="#request.workRecord">
<center>
<table width="500" border="0" cellpadding="0" cellspacing="0" class="InfoShowPanel" >
	<tr>
		<th width="120">记录人：</th>
		<td width="380">
			<s:property value='record.person.name' />
		</td>
	</tr>
	<tr>
		<th>记录时间：</th>
		<td>
			<s:date name="recordTime" format="yyyy-MM-dd" />
		</td>
	</tr>
		<tr>
			<th>今日工作总结：</th>
			<td style="width:380px;word-break:break-all;height:104px;vertical-align:top;padding-top:5px">
				<pre style="word-wrap:break-word"><s:property value="summary"/>&nbsp;<br></pre>
			</td>
		</tr>
		<tr>
			<th>明日工作计划：</th>
			<td style="width:380px;word-break:break-all;height:104px;vertical-align:top;padding-top:5px">
				<pre style="word-wrap:break-word"><s:property value="schedule" />&nbsp;<br></pre>
			</td>
		</tr>
		<tr>
			<th>今日工作感受：</th>
			<td style="width:380px;word-break:break-all;height:104px;vertical-align:top;padding-top:5px">
				<pre style="word-wrap:break-word"><s:property value="share" />&nbsp;<br></pre>
			</td>
		</tr>
		<tr>
		<th>上传文件：</th>
		<td>
			<a href="javascript:downloadResource('<s:property value="fileUuid"/>')"><s:property value="file.name" /></a>&nbsp;<br>
		</td>
	</tr>
	<tr>
		<th>审阅状态：</th>
		<td>
			<s:property value="reviewFlag.description" />&nbsp;<br>
		</td>
	</tr>
	<tr>
		<th>评语：</th>
		<td style="width:380px;word-break:break-all;height:104px;vertical-align:top;padding-top:5px">
			<pre style="word-wrap:break-word"><s:property value="reviewComment" />&nbsp;<br></pre>
		</td>
	</tr>
	<tr>
		<th>审阅人：</th>
		<td>
			<s:property value="reviewEmployee.person.name" />&nbsp;<br>
		</td>
	</tr>
	<tr>
		<th>审阅时间：</th>
		<td>
			<s:date name="reviewTime" format="yyyy-MM-dd HH:mm" />&nbsp;<br>
		</td>
	</tr>
</table>
</center>
</s:iterator>
<br>
<p align="center"><img src="<%=request.getContextPath()%>/images/button/b_close.gif"
	onClick="window.close()" style="cursor:hand"></p>
<br>
</body>
</html>
