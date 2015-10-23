package com.ito.edito.action.create;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Apply.ApplyService;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.ParticipatorInfo;
import com.ito.edito.schema.PreParticipatorInfo;
import com.ito.edito.schema.PropagandaMaterialInfo;
import com.ito.edito.schema.PublicityApplication;
import com.ito.edito.schema.RelatedFile;
import com.ito.edito.util.Constants;
import com.ito.fai.util.ConstantFactory;
import com.ito.fai.util.JndiFactory;

public class CreateUploadFileAction extends AjaxAction {

	private static final long serialVersionUID = 1L;
	private List<File> file;
	private List<String> fileFileName;
	private List<String> fileContentType;

	public List<File> getFile() {
		return file;
	}

	public void setFile(List<File> file) {
		this.file = file;
	}

	public List<String> getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(List<String> fileFileName) {
		this.fileFileName = fileFileName;
	}

	public List<String> getFileContentType() {
		return fileContentType;
	}

	public void setFileContentType(List<String> fileContentType) {
		this.fileContentType = fileContentType;
	}

	public void executeManualUT() throws Exception {
		ApplyService applyService = (ApplyService) JndiFactory.lookup("applyService");
		UserService userService = (UserService) JndiFactory.lookup("userService");
		String uploadPath = ConstantFactory.getConstant("path.upload.resource.dir");
		String publicityApplyUuid = request.getParameter("publicityApplyUuid");
		if (file != null) {
			PublicityApplication publicityApplication = applyService.selectPublicityApplicationByUuid(publicityApplyUuid);

			int fileNum = file.size();
			for (int i = 0; i < fileNum; i++) {
				ut.begin();
				try {
					String realName = this.getFileFileName().get(i);
					String fileSuffix = "";
					if (realName.indexOf(".") != -1) {
						fileSuffix = realName.substring(realName.lastIndexOf(".") + 1);
					}
					Date date = new Date();
					String saveName = String.valueOf(date.getTime()) + "." + fileSuffix;

					RelatedFile relatedFile = new RelatedFile();
					relatedFile.setName(realName);
					relatedFile.setPath(saveName);
					relatedFile.setUploadPersonUuid(EMPLOYEE.getUuid(), false);
					relatedFile.setUploadTime(new Date());
					relatedFile.setTypeUuid(Constants.FILE_TYPE_PAPER_WORK, false);

					String relatedFileUuid = userService.insertRelatedFile(relatedFile, USER.getAccount());
					publicityApplication.setCopyFileUuid(relatedFileUuid, false);
					publicityApplication.setPreParticipators(new ArrayList<PreParticipatorInfo>());
					publicityApplication.setMaterials(new ArrayList<PropagandaMaterialInfo>());
					publicityApplication.setParticipators(new ArrayList<ParticipatorInfo>());
					applyService.updatePublicityApplication(publicityApplication, USER.getAccount());

					InputStream is = new FileInputStream(file.get(i));
					File destFile = new File(uploadPath, saveName);
					OutputStream os = new FileOutputStream(destFile);
					byte[] buffer = new byte[1024];
					int length = 0;
					int size = 0;
					while ((length = is.read(buffer)) > 0) {
						size += length;
						os.write(buffer, 0, length);
					}
					is.close();
					os.close();

					ut.commit();
				}
				catch (Exception e) {
					ut.rollback();
					e.printStackTrace();
				}
			}
		}
	}
}
