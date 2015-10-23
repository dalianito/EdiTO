package com.ito.edito.action.get;

import java.util.ArrayList;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.RelatedFile;
import com.ito.edito.util.Constants;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.ConstantFactory;
import com.ito.fai.util.JndiFactory;

public class GetAllRelatedFileAction extends AjaxAction {

	public void executeManualUT() throws Exception {

		UserService userService = (UserService) JndiFactory.lookup("userService");

		String typeUuid = request.getParameter("typeUuid");

		Constraint c = new Constraint("RelatedFile");
		c.addCondition("typeUuid", typeUuid);
		List<RelatedFile> list = userService.selectRelatedFiles(c);
		List<String[]> resultList = new ArrayList<String[]>();
		for (int i = 0; i < list.size(); i++) {
			RelatedFile relatedFile = list.get(i);

			String[] str = new String[4];
			str[0] = relatedFile.getName();
			str[1] = ConstantFactory.getConstant("path.upload.resource.url") + relatedFile.getPath();
			str[2] = Constants.DATE_FORMAT_YMDHM.format(relatedFile.getUploadTime());
			str[3] = relatedFile.getUuid();

			resultList.add(str);
		}

		setResponseText(resultList);
	}
}
