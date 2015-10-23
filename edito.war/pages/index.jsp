<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<html>
<head>
	<title>首页</title>
	<script>
		var index = "/index.html";
		var pathname = document.location.pathname;
		var fullPath = document.location.href;
		var flag = pathname.search(index);
		if(flag==-1){
			if(pathname=="/edito"){
				document.location.href = fullPath.substr(0, fullPath.indexOf("/edito")) + "/homes/edito" + index;
			}
			else if(pathname=="/resource"){
				document.location.href = fullPath.substr(0, fullPath.indexOf("/resource")) + "/pages/resource" + index;
			}
			else if(pathname=="/content"){
				document.location.href = fullPath.substr(0, fullPath.indexOf("/content")) + "/pages/content" + index;
			}
			else {
				document.location.href = fullPath + "/util/404.jsp";
			}
		}
	</script>
</head>

<body>
	您还没有任何权限！请联系系统管理员为您添加权限！
</body>
</html>
