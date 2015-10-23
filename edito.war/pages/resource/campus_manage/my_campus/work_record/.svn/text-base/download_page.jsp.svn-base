<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page import="java.net.*"%>
<%@ page import="java.io.*"%>

<%
	response.reset();
	response.setContentType("application/x-download");
	String resourcePath = (String) request.getAttribute("resourcePath");
	String resourceName = (String) request.getAttribute("resourceName");
	resourceName = URLEncoder.encode(resourceName, "UTF-8");
	response.addHeader("Content-Disposition", "attachment;filename=" + resourceName);

	OutputStream os = null;
	FileInputStream fis = null;
	try {
		os = response.getOutputStream();
		fis = new FileInputStream(resourcePath);

		byte[] b = new byte[1024];
		int i = 0;
		while ((i = fis.read(b)) > 0) {
			os.write(b, 0, i);
		}
		os.flush();
	}
	catch (Exception e) {
		e.printStackTrace();
	}
	finally {
		if (fis != null) {
			fis.close();
			fis = null;
		}
		if (os != null) {
			os.close();
			os = null;
		}
	}
	out.clear();
	out = pageContext.pushBody();
%>
