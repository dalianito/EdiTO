package com.ito.edito.action.query;

import java.util.ArrayList;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Statistics.StatisticsService;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.Candidates;
import com.ito.edito.schema.EducateInfo;
import com.ito.edito.schema.JdoVirtual;
import com.ito.edito.schema.Person;
import com.ito.edito.util.Constants;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class QueryCandidatesAction extends AjaxAction {

	public void executeManualUT() throws Exception {
		UserService userService = (UserService) JndiFactory.lookup("userService");
		StatisticsService statisticsService = (StatisticsService) JndiFactory.lookup("statisticsService");

		String name = request.getParameter("name");
		String genderUuid = request.getParameter("genderUuid");
		String educationUuid = request.getParameter("educationUuid");
		String recruitStateUuid = request.getParameter("recruitStateUuid");
		String beginDate = request.getParameter("beginDate");
		String endDate = request.getParameter("endDate");

		String offset = request.getParameter("offset");
		String recnum = request.getParameter("recnum");

		String sqlCount = "select '" + statVirtualUuid++ + "' as uuid, 1 as timeStamp, count from (select count(*) as count from Candidates C, Person P ";
		String sqlSelect = "select C.* from Candidates C, Person P ";
		String sqlCondition = "where C.personUuid = P.uuid and C.ifUsing = true ";

		if (!(USER.getUuid().equals(Constants.ADMIN_USER_UUID))) {
			sqlCondition += "and P.uuid != '" + Constants.ADMIN_PERSON_UUID + "' ";
		}
		if (name != null && name.length() > 0) {
			sqlCondition += "and P.name like '%" + name + "%' ";
		}
		if (genderUuid != null && genderUuid.length() > 0) {
			sqlCondition += "and P.genderUuid = '" + genderUuid + "' ";
		}
		if (educationUuid != null && educationUuid.length() > 0) {
			sqlCondition += "and P.educationUuid = '" + educationUuid + "' ";
		}
		if (recruitStateUuid != null && recruitStateUuid.length() > 0) {
			sqlCondition += "and C.recruitStateUuid = '" + recruitStateUuid + "' ";
		}
		if (beginDate != null && !beginDate.equals("")) {
			sqlCondition += " and inviteDate >= '" + Constants.DATE_FORMAT_YMD.format(Constants.DATE_FORMAT_YMD.parse(beginDate)) + " 00:00:00' ";
		}
		if (endDate != null && !endDate.equals("")) {
			sqlCondition += " and inviteDate <= '" + Constants.DATE_FORMAT_YMD.format(Constants.DATE_FORMAT_YMD.parse(endDate)) + " 23:59:59' ";
		}

		sqlCount += sqlCondition + ") as JdoVirtual";
		int count = 0;
		Constraint jdoVirtualC = new Constraint("JdoVirtual");
		jdoVirtualC.addSQLCondition(sqlCount, null);
		JdoVirtual jdoVirtual = statisticsService.selectJdoVirtual(jdoVirtualC);
		if (jdoVirtual.getCount() != null) {
			count = jdoVirtual.getCount().intValue();
		}

		sqlSelect += sqlCondition;
		sqlSelect += "limit " + String.valueOf((Integer.parseInt(offset) - 1)) + ", " + recnum;

		Constraint candidatesC = new Constraint("Candidates");
		candidatesC.addSQLCondition(sqlSelect, null);
		List<Candidates> list = userService.selectCandidatess(candidatesC);
		List<String[]> tempList = new ArrayList<String[]>();
		for (int i = 0; i < list.size(); i++) {
			Candidates candidates = list.get(i);
			Person person = candidates.getPerson();

			List<EducateInfo> educateInfoList = candidates.getEducateInfosAsReference();
			int temp = 0;
			String tempStr = "";
			for (int j = 0; j < educateInfoList.size(); j++) {
				EducateInfo educateInfo = educateInfoList.get(j);
				if (educateInfo.getSequence() > temp) {
					temp = educateInfo.getSequence();
					tempStr = educateInfo.getGraduateSchool();
				}
			}

			String[] str = new String[11];
			str[0] = Integer.toString(Integer.parseInt(offset) + i);
			str[1] = person.getName();
			str[2] = person.getGenderUuid() != null ? person.getGender().getDescription() : "";
			str[3] = person.getEducationUuid() != null ? person.getEducation().getDescription() : "";
			str[4] = candidates.getRecruitStateUuid() != null ? candidates.getRecruitState().getDescription() : "";
			str[5] = candidates.getUuid();
			str[6] = person.getUuid();
			str[7] = candidates.getPost() != null ? candidates.getPost() : "";
			str[8] = person.getCellPhone() != null ? person.getCellPhone() : "";
			str[9] = candidates.getInviteDate() != null ? Constants.DATE_FORMAT_YMDHM.format(candidates.getInviteDate()) : "";
			str[10] = tempStr != null ? tempStr : "";
			tempList.add(str);
		}

		List<Object> resultList = new ArrayList<Object>();
		resultList.add(tempList);
		resultList.add(count);
		setResponseText(resultList);
	}
}
