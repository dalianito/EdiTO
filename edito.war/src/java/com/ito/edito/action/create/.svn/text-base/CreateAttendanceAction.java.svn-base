package com.ito.edito.action.create;

import java.util.Date;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Attendance.AttendanceService;
import com.ito.edito.schema.Attendance;
import com.ito.fai.util.JndiFactory;

public class CreateAttendanceAction extends AjaxAction {

	@SuppressWarnings("unchecked")
	public void executeManualUT() throws Exception {
		AttendanceService attendanceService = (AttendanceService) JndiFactory.lookup("attendanceService");

		List<Attendance> attendanceList = (List<Attendance>) carrier.fetchInstances("Attendance");
		for (int i = 0; i < attendanceList.size(); i++) {
			Attendance attendance = attendanceList.get(i);
			attendance.setRecordTime(new Date());
			attendance.setRecorderUuid(EMPLOYEE.getUuid(), false);

			if (attendance.getUuid() == null) {
				ut.begin();
				attendanceService.insertAttendance(attendance, USER.getAccount());
				ut.commit();
			}
			else {
				Attendance attendanceDB = attendanceService.selectAttendanceByUuid(attendance.getUuid());
				attendanceDB.setTypeUuid(attendance.getTypeUuid(), false);
				attendanceDB.setIntroduction(attendance.getIntroduction());

				ut.begin();
				attendanceService.updateAttendance(attendanceDB, USER.getAccount());
				ut.commit();
			}
		}
	}
}
