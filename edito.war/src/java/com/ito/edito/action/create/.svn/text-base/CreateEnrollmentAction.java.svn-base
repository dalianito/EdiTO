package com.ito.edito.action.create;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Class.ClassService;
import com.ito.edito.ejb.Consult.ConsultService;
import com.ito.edito.ejb.Statistics.StatisticsService;
import com.ito.edito.ejb.User.UserService;
import com.ito.edito.schema.ArrangeClass;
import com.ito.edito.schema.ClassEnrollment;
import com.ito.edito.schema.Communication;
import com.ito.edito.schema.Consultant;
import com.ito.edito.schema.EducationExpInfo;
import com.ito.edito.schema.JdoVirtual;
import com.ito.edito.schema.Person;
import com.ito.edito.schema.Student;
import com.ito.edito.schema.Tuition;
import com.ito.edito.util.Constants;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class CreateEnrollmentAction extends AjaxAction {

	public void executeManualUT() throws Exception {

		UserService userService = (UserService) JndiFactory.lookup("userService");
		ClassService classService = (ClassService) JndiFactory.lookup("classService");
		ConsultService consultService = (ConsultService) JndiFactory.lookup("consultService");
		StatisticsService statisticsService = (StatisticsService) JndiFactory.lookup("statisticsService");

		ArrangeClass arrangeClass = (ArrangeClass) carrier.fetchInstance("ArrangeClass");
		Person person = (Person) carrier.fetchInstance("Person");
		Student student = (Student) carrier.fetchInstance("Student");
		Tuition tuition = (Tuition) carrier.fetchInstance("Tuition");
		Consultant consultant = (Consultant) carrier.fetchInstance("Consultant");
		ClassEnrollment classEnrollment = (ClassEnrollment) carrier.fetchInstance("ClassEnrollment");

		String personUuid = person.getUuid();
		String name = person.getName();
		String genderUuid = person.getGenderUuid();
		Date birthDate = person.getBirthDate();
		String nationalityUuid = person.getNationalityUuid();
		String marriageUuid = person.getMarriageUuid();
		String educationUuid = person.getEducationUuid();
		String parentName = person.getParentName();
		String parentPhone = person.getParentPhone();
		String politicalUuid = person.getPoliticalUuid();
		String idNo = person.getIdNo();
		String cellPhone = person.getCellPhone();
		String address = person.getAddress();
		String qq = person.getQq();
		String realAddress = person.getRealAddress();

		Person personUpdate = userService.selectPersonByUuid(personUuid);

		List<EducationExpInfo> EducationExpInfo = new ArrayList<EducationExpInfo>();
		personUpdate.setEducationExpInfos(EducationExpInfo);
		personUpdate.setName(name);
		personUpdate.setGenderUuid(genderUuid, false);
		personUpdate.setBirthDate(birthDate);
		personUpdate.setNationalityUuid(nationalityUuid, false);
		personUpdate.setMarriageUuid(marriageUuid, false);
		personUpdate.setEducationUuid(educationUuid, false);
		personUpdate.setParentName(parentName);
		personUpdate.setParentPhone(parentPhone);
		personUpdate.setPoliticalUuid(politicalUuid, false);
		personUpdate.setIdNo(idNo);
		personUpdate.setCellPhone(cellPhone);
		personUpdate.setAddress(address);
		personUpdate.setQq(qq);
		personUpdate.setRealAddress(realAddress);

		List<Communication> communicationList = consultService.selectCommunicationsByCustomerUuid(person.getUuid());
		Communication communication = null;
		String consultantUuid = "";
		String employeeUuid = "";

		ut.begin();
		try {
			userService.updatePerson(personUpdate, USER.getAccount());

			String sqlCount = "select '" + statVirtualUuid++ + "' as uuid, 1 as timeStamp, count from (select count(*) as count from Student S where studentID != 'null'";
			sqlCount += ") as JdoVirtual";
			Constraint c = new Constraint("JdoVirtual");
			c.addSQLCondition(sqlCount, null);
			JdoVirtual jdoVirtual = statisticsService.selectJdoVirtual(c);
			int count = 0;
			if (jdoVirtual.getCount() != null) {
				count = jdoVirtual.getCount().intValue();
			}

			if (student.getUuid() == null) {
				if (count > 999999) {
					student.setStudentID("7" + count);
				}
				else if (count > 99999) {
					student.setStudentID("70" + count);
				}
				else if (count > 9999) {
					student.setStudentID("700" + count);
				}
				else if (count > 999) {
					student.setStudentID("7000" + count);
				}
				else if (count > 99) {
					student.setStudentID("70000" + count);
				}
				else if (count > 9) {
					student.setStudentID("700000" + count);
				}
				else {
					student.setStudentID("7000000" + count);
				}

				student.setIfUsing(true);
				String sUuid = userService.insertStudent(student, USER.getAccount());
				classEnrollment.setStudentUuid(sUuid, false);
			}
			else {
				if (student.getStudentID() == null) {
					if (count > 999999) {
						student.setStudentID("7" + count);
					}
					else if (count > 99999) {
						student.setStudentID("70" + count);
					}
					else if (count > 9999) {
						student.setStudentID("700" + count);
					}
					else if (count > 999) {
						student.setStudentID("7000" + count);
					}
					else if (count > 99) {
						student.setStudentID("70000" + count);
					}
					else if (count > 9) {
						student.setStudentID("700000" + count);
					}
					else {
						student.setStudentID("7000000" + count);
					}
					userService.updateStudent(student, USER.getAccount());
				}
				classEnrollment.setStudentUuid(student.getUuid(), false);
			}

			if (classEnrollment.getIfFree() == false) {
				tuition.setPreDiscountAmount(tuition.getPreDiscountAmount());
				tuition.setDiscount(tuition.getDiscount());
				tuition.setDiscountReason(tuition.getDiscountReason());
				tuition.setActualTotalAmount(tuition.getActualTotalAmount());
				tuition.setAmountPaid(tuition.getAmountPaid());
				String tUuid = classService.insertTuition(tuition, USER.getAccount());
				classEnrollment.setTuitionUuid(tUuid, false);
			}

			if (communicationList != null && communicationList.size() > 0) {
				communication = communicationList.get(communicationList.size() - 1);
				employeeUuid = communication.getEmployeeUuid();
				Constraint cC = new Constraint("Consultant");
				cC.addCondition("employeeUuid", employeeUuid);
				Consultant oldConsultant = consultService.selectConsultant(cC);
				if (oldConsultant != null) {
					consultantUuid = oldConsultant.getUuid();
					classEnrollment.setConsultantUuid(consultantUuid, false);
				}
				else {
					consultant.setEmployeeUuid(employeeUuid, false);
					consultant.setIfUsing(false);
					consultantUuid = consultService.insertConsultant(consultant, USER.getAccount());
					classEnrollment.setConsultantUuid(consultantUuid, false);
				}
			}

			String arrangeClassUuid = arrangeClass.getUuid();

			classEnrollment.setArrangeClassUuid(arrangeClassUuid, false);
			classEnrollment.setEnrollmentStateUuid(Constants.STUDENT_APPLY, false);
			classEnrollment.setEnrollmentTime(new Date());

			classService.insertClassEnrollment(classEnrollment, USER.getAccount());

			ut.commit();
		}
		catch (Exception e) {
			e.printStackTrace();
			ut.rollback();
		}
	}
}
