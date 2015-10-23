<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no">
<meta name="format-detection" content="telephone=no" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta http-equiv="pragma" content="no-cache" />
<head>
	<title><decorator:title default="富海教育" /></title>
	<script>var cp="<%=request.getContextPath()%>";</script>
	<script src="<%=request.getContextPath()%>/js/jquery-1.4.2.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.ui.core.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.ui.widget.js"></script>
	<script src="<%=request.getContextPath()%>/js/hashtable.js"></script>
	<script src="<%=request.getContextPath()%>/js/dateformat.js"></script>
	<script src="<%=request.getContextPath()%>/js/json2.js"></script>
	<script src="<%=request.getContextPath()%>/js/iscript.js"></script>
	<script src="<%=request.getContextPath()%>/js/info_manager.js"></script>
	<script src="<%=request.getContextPath()%>/js/basetree.js"></script>
	<script src="<%=request.getContextPath()%>/js/date.js"></script>
	<script src="<%=request.getContextPath()%>/js/drop_menu.js"></script>
	<script src="<%=request.getContextPath()%>/js/submit.js"></script>
	<script src="<%=request.getContextPath()%>/js/validation.js"></script>
	<link href="<%=request.getContextPath()%>/style/style_weixin.css" rel="stylesheet" type="text/css">
	<script>
		$(document).ready(function(){
			if(typeof($("#pageTitle"))!="undefined"){
				$("#mainPageTitle").text($("#pageTitle").val());
			}
			$("#contentDiv").css("min-height", window.innerHeight - 135);
		});
	</script>
</head>

<body>
<div class="header">
<div id="mainPageTitle" style="margin-top:10px"></div>
</div>
<div id="contentDiv" class="content">
	<decorator:body />
</div>
<div class="liner1"></div>
<div class="liner2"></div>
<div class="footer">
Copyright©2015 大连元合科技有限公司<br>
服务热线 0411-84753258
</div>
</body>
</html>
