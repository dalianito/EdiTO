package com.ito.edito.action.get;

import com.ito.edito.action.DefaultAction;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.RelatedFile;
import com.ito.fai.util.ConstantFactory;
import com.ito.fai.util.JndiFactory;

public class GetResourceAction extends DefaultAction {

	public void executeManualUT() throws Exception {

		UserService userService = (UserService) JndiFactory.lookup("userService");

		String uuid = request.getParameter("uuid");
		String resourcePath = "";
		String resourceName = "";

		RelatedFile relatedPhoto = userService.selectRelatedFileByUuid(uuid);
		resourcePath = ConstantFactory.getConstant("path.upload.resource.dir") + relatedPhoto.getPath();
		resourceName = relatedPhoto.getName();
		request.setAttribute("resourcePath", resourcePath);
		request.setAttribute("resourceName", resourceName);
	}
}
