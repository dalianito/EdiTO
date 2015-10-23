package com.ito.edito.action.query;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Campus.CampusService;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.Employee;
import com.ito.edito.schema.WorkRecord;
import com.ito.edito.util.Constants;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class QueryWechatWorkRecordAction extends AjaxAction {

	@SuppressWarnings("deprecation")
	public void executeManualUT() throws Exception {

		UserService userService = (UserService) JndiFactory.lookup("userService");
		CampusService workRecordService = (CampusService) JndiFactory.lookup("campusService");

		String pageMark = request.getParameter("pageMark");
		String begingTime = request.getParameter("nowTime");
		String employeeUuid = request.getParameter("Uuid");
		Date time = Constants.DATE_FORMAT_YMD.parse(begingTime + "-01");
		time.setMonth(time.getMonth() + 1);
		String endTime = Constants.DATE_FORMAT_YMD.format(time);

		Date newTime = new Date();
		String newTime1 = Constants.DATE_FORMAT_YMDHM.format(newTime);
		String newTime2 = Constants.DATE_FORMAT_YMD_0.format(newTime);

		String sqlSelect = "select distinct W.* from WorkRecord W ";
		String sqlCondition = " where  W.ifUsing = true ";

		if (pageMark != null && pageMark.equals("record")) {
			sqlCondition += " and W.recordUuid =  '" + employeeUuid + "' ";
			sqlCondition += " and W.recordTime >= '" + begingTime + "-01 00:00:00' ";
			sqlCondition += " and W.recordTime < '" + endTime + " 00:00:00' ";
			sqlCondition += " order by W.recordTime desc ";
			sqlSelect += sqlCondition;
			Constraint c = new Constraint("WorkRecord");
			c.addSQLCondition(sqlSelect, null);
			List<WorkRecord> list = workRecordService.selectWorkRecords(c);

			String sqlSelect2 = "select distinct W.* from WorkRecord W ";
			String sqlCondition2 = " where  W.ifUsing = true ";
			sqlCondition2 += " and W.recordUuid =  '" + employeeUuid + "' ";
			sqlCondition2 += " and W.recordTime <= '" + newTime1 + ":59' ";
			sqlCondition2 += " and W.recordTime > '" + newTime2 + " 00:00:00' ";
			sqlCondition2 += " order by W.recordTime desc ";
			sqlSelect2 += sqlCondition2;
			Constraint c2 = new Constraint("WorkRecord");
			c2.addSQLCondition(sqlSelect2, null);
			WorkRecord record = workRecordService.selectWorkRecord(c2);

			List<String[]> resultList = new ArrayList<String[]>();

			for (int i = 0; i < list.size(); i++) {
				WorkRecord workRecord = list.get(i);

				String[] str = new String[6];
				str[0] = workRecord.getUuid();
				str[1] = workRecord.getRecord() != null ? workRecord.getRecord().getPerson().getName() : "";
				str[2] = workRecord.getRecord() != null ? workRecord.getRecord().getDepartment().getDescription() : "";
				str[3] = workRecord.getRecordTime() != null ? Constants.DATE_FORMAT_YMD.format(workRecord.getRecordTime()).substring(5) : "";
				str[4] = workRecord.getReviewFlagUuid() != null ? workRecord.getReviewFlag().getDescription() : "";
				if (workRecord.getReviewComment() != null && workRecord.getReviewComment().length() >= 4) {
					String newcomment = workRecord.getReviewComment().substring(0, 2);
					newcomment = newcomment + "...";
					str[5] = newcomment;
				}
				else {
					str[5] = workRecord.getReviewComment() != null ? workRecord.getReviewComment() : "";
				}

				resultList.add(str);
			}

			String recordValue = "";
			if (record != null && record.getReviewFlagUuid().equals(Constants.NOT_REVIEW_FLAG)) {
				recordValue = record.getUuid();
			}
			else if (record != null && record.getReviewFlagUuid().equals(Constants.REVIEWD_FLAG)) {
				recordValue = "已审阅";
			}

			List<Object> resultList2 = new ArrayList<Object>();
			resultList2.add(resultList);
			resultList2.add(recordValue);

			setResponseText(resultList2);
		}
		else {
			sqlCondition += " and W.recordTime >= '" + begingTime + " 00:00:00' ";
			sqlCondition += " and W.recordTime <= '" + begingTime + " 23:59:59' ";
		//	sqlCondition += " and W.reviewFlagUuid = '" + Constants.NOT_REVIEW_FLAG + "' ";
			sqlCondition += " order by W.recordTime desc ";
			sqlSelect += sqlCondition;
			Constraint c = new Constraint("WorkRecord");
			c.addSQLCondition(sqlSelect, null);
			List<WorkRecord> list = workRecordService.selectWorkRecords(c);

			List<String[]> resultList = new ArrayList<String[]>();

			Employee employee = userService.selectEmployeeByUuid(employeeUuid);

			if (employee.getDepartmentUuid().equals(Constants.WECHAT_DEPARTMENT_PRESIDENT) || employee.getDepartmentUuid().equals(Constants.WECHAT_DEPARTMENT_VICE_PRESIDENT) || employee.getDepartmentUuid().equals(Constants.WECHAT_DEPARTMENT_VICE_PRESIDENT2)) {
				for (int i = 0; i < list.size(); i++) {
					WorkRecord workRecord = list.get(i);

					String[] str = new String[6];
					str[0] = workRecord.getUuid();
					str[1] = workRecord.getRecord() != null ? workRecord.getRecord().getPerson().getName() : "";
					str[2] = workRecord.getRecord() != null ? workRecord.getRecord().getDepartment().getDescription() : "";
					str[3] = workRecord.getRecordTime() != null ? Constants.DATE_FORMAT_YMD.format(workRecord.getRecordTime()) : "";
					str[4] = workRecord.getReviewFlagUuid() != null ? workRecord.getReviewFlag().getDescription() : "";
					if (workRecord.getReviewComment() != null && workRecord.getReviewComment().length() >= 4) {
						String newcomment = workRecord.getReviewComment().substring(0, 2);
						newcomment = newcomment + "...";
						str[5] = newcomment;
					}
					else {
						str[5] = workRecord.getReviewComment() != null ? workRecord.getReviewComment() : "";
					}

					resultList.add(str);
				}
				setResponseText(resultList);
			}
			else {
				for (int i = 0; i < list.size(); i++) {			
					WorkRecord workRecord = list.get(i);
					Employee employee2 = workRecord.getRecord();
					String[] str = new String[6];
					if (employee2.getCampusUuid().equals(employee.getCampusUuid())) {
						str[0] = workRecord.getUuid();
						str[1] = workRecord.getRecord() != null ? workRecord.getRecord().getPerson().getName() : "";
						str[2] = workRecord.getRecord() != null ? workRecord.getRecord().getDepartment().getDescription() : "";
						str[3] = workRecord.getRecordTime() != null ? Constants.DATE_FORMAT_YMD.format(workRecord.getRecordTime()) : "";
						str[4] = workRecord.getReviewFlagUuid() != null ? workRecord.getReviewFlag().getDescription() : "";
						if (workRecord.getReviewComment() != null && workRecord.getReviewComment().length() >= 4) {
							String newcomment = workRecord.getReviewComment().substring(0, 2);
							newcomment = newcomment + "...";
							str[5] = newcomment;
						}
						else {
							str[5] = workRecord.getReviewComment() != null ? workRecord.getReviewComment() : "";
						}
						resultList.add(str);
					}
				}
				setResponseText(resultList);
			}
		}

	}
}
