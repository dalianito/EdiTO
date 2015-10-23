package com.ito.edito.action.query;

import java.util.ArrayList;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Material.MaterialService;
import com.ito.edito.schema.OfficeApplication;
import com.ito.edito.schema.OfficeApplicationInfo;
import com.ito.edito.util.Constants;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class QueryOrderGenerateAction extends AjaxAction {
	public void executeManualUT() throws Exception {

		MaterialService materialService = (MaterialService) JndiFactory.lookup("materialService");

		Constraint c = new Constraint("OfficeApplicationInfo");
		c.addCondition("stateUuid", Constants.EXAMINATION_STATE_PASSED);
		c.addCondition("ifGenerate", true, Constraint.UNEQUAL);
		c.addOrderCondition("materialUuid", "asc");
		List<OfficeApplicationInfo> officeApplicationInfosTemp = materialService.selectOfficeApplicationInfos(c);
		List<String[]> tempList = new ArrayList<String[]>();
		for (int i = 0; i < officeApplicationInfosTemp.size(); i++) {
			OfficeApplicationInfo officeApplicationInfo = officeApplicationInfosTemp.get(i);

			String biaDataUuid = officeApplicationInfo.getBizDataUuid();
			OfficeApplication officeApplication = materialService.selectOfficeApplicationByUuid(biaDataUuid);

			String[] str = new String[15];
			str[0] = Integer.toString(i);
			str[1] = officeApplicationInfo.getMaterialUuid() == null ? "" : officeApplicationInfo.getMaterial().getType().getDescription();// 物品名称
			str[2] = officeApplicationInfo.getMaterialUuid() == null ? "" : officeApplicationInfo.getMaterial().getMaterialNo();// 物品编号
			str[3] = officeApplicationInfo.getMaterialUuid() == null ? "" : officeApplicationInfo.getMaterial().getSpecification();// 规格型号
			str[4] = officeApplicationInfo.getMaterialUuid() == null ? "" : officeApplicationInfo.getMaterial().getUnit();// 物品单位
			str[5] = officeApplicationInfo.getMaterialUuid() == null ? "" : officeApplicationInfo.getMaterialAmount().toString();// 申请数量
			str[6] = officeApplicationInfo.getApprovalAmount() == null ? "" : officeApplicationInfo.getApprovalAmount().toString();// 审核状态
			str[7] = officeApplication.getApplyUuid() == null ? "" : officeApplication.getApply().getApplicant().getPerson().getName();// 申请人
			str[8] = officeApplication.getApply().getApplicationTime() == null ? "" : Constants.DATE_FORMAT_YMDHM.format(officeApplication.getApply().getApplicationTime());// 申请时间
			str[9] = officeApplication.getDepartmentUuid() == null ? "" : officeApplication.getDepartment().getDescription();// 组织机构
			str[10] = officeApplication.getUuid();
			str[11] = officeApplicationInfo.getMaterialUuid();
			str[12] = officeApplicationInfo.getNotes() == null ? "" : officeApplicationInfo.getNotes();
			str[13] = officeApplicationInfo.getUuid() == null ? "" : officeApplicationInfo.getUuid();
			str[14] = officeApplication.getCampusUuid() == null ? "" : officeApplication.getCampus().getDescription();// 校区

			tempList.add(str);
		}
		setResponseText(tempList);
	}
}
