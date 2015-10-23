package com.ito.edito.action.delete;

import java.io.File;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Campus.CampusService;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.RelatedFile;
import com.ito.edito.schema.WorkRecord;
import com.ito.fai.util.ConstantFactory;
import com.ito.fai.util.JndiFactory;

public class DeleteRecordFileAction extends AjaxAction {
	public void executeManualUT() throws Exception {
		CampusService campusService = (CampusService) JndiFactory.lookup("campusService");
		UserService userService = (UserService) JndiFactory.lookup("userService");

		String workRecordUuid = request.getParameter("uuid");
		WorkRecord workRecord = campusService.selectWorkRecordByUuid(workRecordUuid);
		RelatedFile relatedFile = workRecord.getFile();

		workRecord.setFileUuid(null);

		ut.begin();
		try {
			String resourcePath = ConstantFactory.getConstant("path.upload.resource.dir") + relatedFile.getPath();
			File file = new File(resourcePath);
			if (file.isFile() && file.exists()) {
				file.delete();
			}

			campusService.updateWorkRecord(workRecord, USER.getAccount());
			userService.deleteRelatedFile(relatedFile, USER.getAccount());
			ut.commit();

			WorkRecord workRecordDB = campusService.selectWorkRecordByUuid(workRecordUuid);
			setResponseText(workRecordDB.getTimeStamp());
		}
		catch (Exception e) {
			ut.rollback();
		}
	}
}
