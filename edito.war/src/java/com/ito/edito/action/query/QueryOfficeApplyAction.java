package com.ito.edito.action.query;

import java.util.ArrayList;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Material.MaterialService;
import com.ito.edito.ejb.Statistics.StatisticsService;
import com.ito.edito.schema.Apply;
import com.ito.edito.schema.Employee;
import com.ito.edito.schema.JdoVirtual;
import com.ito.edito.schema.OfficeApplication;
import com.ito.edito.schema.OfficeApplicationInfo;
import com.ito.edito.schema.Person;
import com.ito.edito.util.Constants;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class QueryOfficeApplyAction extends AjaxAction {
	public void executeManualUT() throws Exception {

		MaterialService materialService = (MaterialService) JndiFactory.lookup("materialService");
		StatisticsService statisticsService = (StatisticsService) JndiFactory.lookup("statisticsService");
		String applicant = request.getParameter("applicant");
		String statusTypeUuid = request.getParameter("statusTypeUuid");
		String beginDate = request.getParameter("beginDate");
		String endDate = request.getParameter("endDate");
		String offset = request.getParameter("offset");
		String recnum = request.getParameter("recnum");
		String sql = "select distinct O.* from OfficeApplication O ,Apply A ,Employee E ,Person P ";
		sql += "where E.personUuid = P.uuid and E.Uuid = A.applicantUuid and A.Uuid = O.applyUuid  and E.ifUsing = true and P.ifUsing = true and O.ifUsing = true ";
		sql += " and A.applicantUuid = '" + EMPLOYEE.getUuid() + "' ";

		if (applicant != null && applicant.length() > 0) {
			sql += " and P.name like '%" + applicant + "%' ";
		}
		if (statusTypeUuid != null && statusTypeUuid.length() > 0) {
			sql += " and A.stateUuid = '" + statusTypeUuid + "' ";
		}
		if (beginDate != null && !beginDate.equals("")) {
			sql += " and A.applicationTime >= '" + Constants.DATE_FORMAT_YMD.format(Constants.DATE_FORMAT_YMD.parse(beginDate)) + " 00:00:00' ";
		}
		if (endDate != null && !endDate.equals("")) {
			sql += " and A.applicationTime <= '" + Constants.DATE_FORMAT_YMD.format(Constants.DATE_FORMAT_YMD.parse(endDate)) + " 23:59:59' ";
		}

		String sqlCount = "select '" + statVirtualUuid++ + "' as uuid, 1 as timeStamp, count from (" + sql.replace("distinct O.*", " count(*) as count ") + ") as JdoVirtual";
		int count = 0;
		Constraint jdoVirtualC = new Constraint("JdoVirtual");
		jdoVirtualC.addSQLCondition(sqlCount, null);
		JdoVirtual jdoVirtual = statisticsService.selectJdoVirtual(jdoVirtualC);
		if (jdoVirtual.getCount() != null) {
			count = jdoVirtual.getCount().intValue();
		}

		sql += "limit " + String.valueOf((Integer.parseInt(offset) - 1)) + ", " + recnum;
		Constraint c1 = new Constraint("OfficeApplication");
		c1.addSQLCondition(sql, null);
		List<OfficeApplication> officeApplicationsTemp = materialService.selectOfficeApplications(c1);
		List<String[]> tempList = new ArrayList<String[]>();
		for (int i = 0; i < officeApplicationsTemp.size(); i++) {
			String ifReceipt = "receipt";
			OfficeApplication officeApplication = officeApplicationsTemp.get(i);

			Apply apply = officeApplication.getApply();
			Employee employee = apply.getApplicant();
			Person person = employee.getPerson();
			String size = Integer.toString(officeApplication.getOfficeMaterialsAsReference().size());
			String[] str = new String[10];
			str[0] = Integer.toString(Integer.parseInt(offset) + i);
			str[1] = person.getName() == null ? "" : person.getName();
			str[2] = size == null ? "" : size; // 申请条数
			int passNum = 0;
			for (int j = 0; j < officeApplication.getOfficeMaterialsAsReference().size(); j++) {
				OfficeApplicationInfo officeApplicationInfo = officeApplication.getOfficeMaterialsAsReference().get(j);
				if ((officeApplicationInfo.getStateUuid() != null) && (officeApplicationInfo.getReceipStateUuid() != null) && (officeApplicationInfo.getStateUuid().equals(Constants.EXAMINATION_STATE_PASSED)) && (officeApplicationInfo.getReceipStateUuid().equals(Constants.RECEIPT_STATE_UNDONE))) {
					ifReceipt = "unReceipt";
				}
				if (Constants.EXAMINATION_STATE_PASSED.equals(officeApplicationInfo.getStateUuid())) {
					passNum++;
				}
			}
			str[3] = String.valueOf(passNum);// 通过申请数
			str[4] = apply.getApplicationTime() == null ? "" : Constants.DATE_FORMAT_YMDHM.format(apply.getApplicationTime());// 申请时间
			str[5] = apply.getState() == null ? "" : apply.getState().getDescription();// 审核状态
			str[6] = apply.getStateUuid() == null ? "" : apply.getStateUuid();
			str[7] = officeApplication.getUuid();
			str[8] = apply.getCheckStateOneUuid() == null ? "" : apply.getCheckStateOneUuid();
			str[9] = ifReceipt;
			tempList.add(str);
		}
		List<Object> resultList = new ArrayList<Object>();
		resultList.add(tempList);
		resultList.add(count);
		setResponseText(resultList);
	}
}
