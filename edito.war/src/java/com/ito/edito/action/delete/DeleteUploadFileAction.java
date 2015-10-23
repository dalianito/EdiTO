package com.ito.edito.action.delete;

import java.io.File;
import java.util.ArrayList;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Apply.ApplyService;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.ParticipatorInfo;
import com.ito.edito.schema.PreParticipatorInfo;
import com.ito.edito.schema.PropagandaMaterialInfo;
import com.ito.edito.schema.PublicityApplication;
import com.ito.edito.schema.RelatedFile;
import com.ito.fai.util.ConstantFactory;
import com.ito.fai.util.JndiFactory;

public class DeleteUploadFileAction extends AjaxAction {
	public void executeManualUT() throws Exception {
		ApplyService applyService = (ApplyService) JndiFactory.lookup("applyService");
		UserService userService = (UserService) JndiFactory.lookup("userService");

		String publicityApplyUuid = request.getParameter("uuid");
		PublicityApplication publicityApplication = applyService.selectPublicityApplicationByUuid(publicityApplyUuid);
		RelatedFile relatedFile = publicityApplication.getCopyFile();

		publicityApplication.setCopyFileUuid(null);
		publicityApplication.setPreParticipators(new ArrayList<PreParticipatorInfo>());
		publicityApplication.setMaterials(new ArrayList<PropagandaMaterialInfo>());
		publicityApplication.setParticipators(new ArrayList<ParticipatorInfo>());

		ut.begin();
		try {
			String resourcePath = ConstantFactory.getConstant("path.upload.resource.dir") + relatedFile.getPath();
			File file = new File(resourcePath);
			if (file.isFile() && file.exists()) {
				file.delete();
			}

			applyService.updatePublicityApplication(publicityApplication, USER.getAccount());
			userService.deleteRelatedFile(relatedFile, USER.getAccount());
			ut.commit();

			PublicityApplication publicityApplicationDB = applyService.selectPublicityApplicationByUuid(publicityApplyUuid);
			setResponseText(publicityApplicationDB.getTimeStamp());
		}
		catch (Exception e) {
			ut.rollback();
		}
	}
}
