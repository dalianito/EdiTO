package com.ito.edito.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;

public class AjaxAction extends DefaultAction {

	private static final long serialVersionUID = 201009194352645515L;

	private PrintWriter out = null;
	private String responseText = new String("");

	protected void printResult() {
		try {
			out = response.getWriter();
			out.print(responseText);
			resultCode = NONE;
		}
		catch (IOException ex) {
			ex.printStackTrace();
		}
		finally {
			if (null != out) {
				out.close();
			}
		}
	}

	protected void setResponseText(String responseText) {
		this.responseText = responseText;
	}

	protected void setResponseText(Object object) throws Exception {
		try {
			StringWriter sw = new StringWriter();
			JacksonJsonMapper.getInstance().writeValue(sw, object);
			setResponseText(sw.toString());
		}
		catch (Exception e) {
			throw e;
		}
	}

	protected String getResponseText() {
		return responseText;
	}
}
