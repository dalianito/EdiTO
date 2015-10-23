package com.ito.edito.action.query;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Campus.CampusService;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.Employee;
import com.ito.edito.schema.InternetPublicity;
import com.ito.edito.util.Constants;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class QueryWechatNetworkReviewAction extends AjaxAction {

	@SuppressWarnings("deprecation")
	public void executeManualUT() throws Exception {

		UserService userService = (UserService) JndiFactory.lookup("userService");
		CampusService campusService = (CampusService) JndiFactory.lookup("campusService");

		String pageMark = request.getParameter("pageMark");
		String begingTime = request.getParameter("nowTime");
		String employeeUuid = request.getParameter("Uuid");
		Date time = Constants.DATE_FORMAT_YMD.parse(begingTime + "-01");
		time.setMonth(time.getMonth() + 1);
		String endTime = Constants.DATE_FORMAT_YMD.format(time);

		Date newTime = new Date();
		String newTime1 = Constants.DATE_FORMAT_YMDHM.format(newTime);
		String newTime2 = Constants.DATE_FORMAT_YMD.format(newTime);

		String sqlSelect = "select distinct I.* from InternetPublicity I ";
		String sqlCondition = " where  I.ifUsing = true ";

		if (pageMark != null && pageMark.equals("record")) {
			sqlCondition += " and I.recordUuid =  '" + employeeUuid + "' ";
			sqlCondition += " and I.recordTime >= '" + begingTime + "-01 00:00:00' ";
			sqlCondition += " and I.recordTime < '" + endTime + " 00:00:00' ";
			sqlCondition += " order by I.recordTime desc ";

			sqlSelect += sqlCondition;
			Constraint internetPublicityC = new Constraint("InternetPublicity");
			internetPublicityC.addSQLCondition(sqlSelect, null);
			List<InternetPublicity> list = campusService.selectInternetPublicitys(internetPublicityC);

			String sqlSelect2 = "select distinct I.* from InternetPublicity I ";
			String sqlCondition2 = " where I.ifUsing = true ";
			sqlCondition2 += " and I.recordUuid =  '" + employeeUuid + "' ";
			sqlCondition2 += " and I.recordTime <= '" + newTime1 + ":59' ";
			sqlCondition2 += " and I.recordTime > '" + newTime2 + " 00:00:00' ";
			sqlCondition2 += " order by I.recordTime desc ";
			sqlSelect2 += sqlCondition2;
			Constraint c2 = new Constraint("InternetPublicity");
			c2.addSQLCondition(sqlSelect2, null);
			InternetPublicity publicity = campusService.selectInternetPublicity(c2);

			List<String[]> resultList = new ArrayList<String[]>();
			for (int i = 0; i < list.size(); i++) {
				InternetPublicity internetPublicity = list.get(i);

				String[] str = new String[7];
				str[0] = internetPublicity.getUuid();
				str[1] = internetPublicity.getRecord() != null ? internetPublicity.getRecord().getPerson().getName() : "";
				str[2] = internetPublicity.getRecord() != null ? internetPublicity.getRecord().getDepartment().getDescription() : "";
				str[3] = internetPublicity.getPosterInfos() != null ? String.valueOf(internetPublicity.getPosterInfosCount()) : "";
				str[4] = internetPublicity.getRecordTime() != null ? Constants.DATE_FORMAT_YMD.format(internetPublicity.getRecordTime()).substring(5) : "";
				str[5] = internetPublicity.getReviewFlagUuid() != null ? internetPublicity.getReviewFlag().getDescription() : "";
				if (internetPublicity.getReviewComment() != null && internetPublicity.getReviewComment().length() >= 4) {
					String newcomment = internetPublicity.getReviewComment().substring(0, 2);
					newcomment = newcomment + "...";
					str[6] = newcomment;
				}
				else {
					str[6] = internetPublicity.getReviewComment() != null ? internetPublicity.getReviewComment() : "";
				}
				resultList.add(str);
			}

			String recordValue = "";
			if (publicity != null && publicity.getReviewFlagUuid().equals(Constants.NOT_REVIEW_FLAG)) {
				recordValue = publicity.getUuid();
			}
			else if (publicity != null && publicity.getReviewFlagUuid().equals(Constants.REVIEWD_FLAG)) {
				recordValue = "已审阅";
			}
			List<Object> resultList2 = new ArrayList<Object>();
			resultList2.add(resultList);
			resultList2.add(recordValue);

			setResponseText(resultList2);
		}
		else {
		//	sqlCondition += " and I.reviewFlagUuid = '" + Constants.NOT_REVIEW_FLAG + "' ";
			sqlCondition += " and I.recordTime >= '" + begingTime + " 00:00:00' ";
			sqlCondition += " and I.recordTime <= '" + begingTime + " 23:59:59' ";
			sqlCondition += " order by I.recordTime desc ";

			sqlSelect += sqlCondition;
			Constraint internetPublicityC = new Constraint("InternetPublicity");
			internetPublicityC.addSQLCondition(sqlSelect, null);
			List<InternetPublicity> list = campusService.selectInternetPublicitys(internetPublicityC);

			List<String[]> resultList = new ArrayList<String[]>();

			Employee employee = userService.selectEmployeeByUuid(employeeUuid);

			if (employee.getDepartmentUuid().equals(Constants.WECHAT_DEPARTMENT_PRESIDENT) || employee.getDepartmentUuid().equals(Constants.WECHAT_DEPARTMENT_VICE_PRESIDENT) || employee.getDepartmentUuid().equals(Constants.WECHAT_DEPARTMENT_VICE_PRESIDENT2)) {
				for (int i = 0; i < list.size(); i++) {
					InternetPublicity internetPublicity = list.get(i);

					String[] str = new String[7];
					str[0] = internetPublicity.getUuid();
					str[1] = internetPublicity.getRecord() != null ? internetPublicity.getRecord().getPerson().getName() : "";
					str[2] = internetPublicity.getRecord() != null ? internetPublicity.getRecord().getDepartment().getDescription() : "";
					str[3] = internetPublicity.getPosterInfos() != null ? String.valueOf(internetPublicity.getPosterInfosCount()) : "";
					str[4] = internetPublicity.getRecordTime() != null ? Constants.DATE_FORMAT_YMD.format(internetPublicity.getRecordTime()) : "";
					str[5] = internetPublicity.getReviewFlagUuid() != null ? internetPublicity.getReviewFlag().getDescription() : "";
					if (internetPublicity.getReviewComment() != null && internetPublicity.getReviewComment().length() >= 4) {
						String newcomment = internetPublicity.getReviewComment().substring(0, 2);
						newcomment = newcomment + "...";
						str[6] = newcomment;
					}
					else {
						str[6] = internetPublicity.getReviewComment() != null ? internetPublicity.getReviewComment() : "";
					}
					resultList.add(str);
				}
				setResponseText(resultList);
			}
			else {
				for (int i = 0; i < list.size(); i++) {
					InternetPublicity internetPublicity = list.get(i);
					Employee employee2 = internetPublicity.getRecord();
					String[] str = new String[7];
					if (employee2.getCampusUuid().equals(employee.getCampusUuid())) {

						str[0] = internetPublicity.getUuid();
						str[1] = internetPublicity.getRecord() != null ? internetPublicity.getRecord().getPerson().getName() : "";
						str[2] = internetPublicity.getRecord() != null ? internetPublicity.getRecord().getDepartment().getDescription() : "";
						str[3] = internetPublicity.getPosterInfos() != null ? String.valueOf(internetPublicity.getPosterInfosCount()) : "";
						str[4] = internetPublicity.getRecordTime() != null ? Constants.DATE_FORMAT_YMD.format(internetPublicity.getRecordTime()) : "";
						str[5] = internetPublicity.getReviewFlagUuid() != null ? internetPublicity.getReviewFlag().getDescription() : "";
						if (internetPublicity.getReviewComment() != null && internetPublicity.getReviewComment().length() >= 4) {
							String newcomment = internetPublicity.getReviewComment().substring(0, 2);
							newcomment = newcomment + "...";
							str[6] = newcomment;
						}
						else {
							str[6] = internetPublicity.getReviewComment() != null ? internetPublicity.getReviewComment() : "";
						}
						resultList.add(str);
					}
				}
				setResponseText(resultList);
			}
		}

	}
}
