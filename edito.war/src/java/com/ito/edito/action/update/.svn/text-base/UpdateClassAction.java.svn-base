package com.ito.edito.action.update;

import java.util.ArrayList;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Class.ClassService;
import com.ito.edito.schema.ArrangeClass;
import com.ito.edito.schema.ArrangeClassTime;
import com.ito.edito.schema.ArrangeClassTimeInfo;
import com.ito.edito.schema.TimePositionTeacherInfo;
import com.ito.fai.util.JndiFactory;

public class UpdateClassAction extends AjaxAction {
	public void executeManualUT() throws Exception {

		ClassService classService = (ClassService) JndiFactory.lookup("classService");
		String uuid = request.getParameter("uuid");

		ArrangeClass arrangeClass = classService.selectArrangeClassByUuid(uuid);
		arrangeClass.setIfUsing(false);
		List<TimePositionTeacherInfo> timePositionTeacherInfoList = arrangeClass.getTimePositionTeacherInfosAsReference();
		List<TimePositionTeacherInfo> timePositionTeacherInfoListtemp = new ArrayList<TimePositionTeacherInfo>();
		for(int i = 0;i < timePositionTeacherInfoList.size(); i++) {
			TimePositionTeacherInfo timePositionTeacherInfo = timePositionTeacherInfoList.get(i);

			ArrangeClassTime arrangeClassTime = classService.selectArrangeClassTimeByUuid(timePositionTeacherInfo.getArrangeClsTimeUuid());
			arrangeClassTime.setIfUsing(false);
			List<ArrangeClassTimeInfo> arrangeClassTimeInfoList = arrangeClassTime.getArrangeClassTimeInfosAsReference();
			List<ArrangeClassTimeInfo> arrangeClassTimeInfotemp = new ArrayList<ArrangeClassTimeInfo>();
			for(int j = 0;j < arrangeClassTimeInfoList.size(); j++) {
				ArrangeClassTimeInfo arrangeClassTimeInfo = arrangeClassTimeInfoList.get(j);
				arrangeClassTimeInfo.setOperationStatus("2");
				arrangeClassTimeInfotemp.add(arrangeClassTimeInfo);
			}
			arrangeClassTime.setArrangeClassTimeInfos(arrangeClassTimeInfotemp);
			ut.begin();
			try {
				classService.updateArrangeClassTime(arrangeClassTime, USER.getAccount());
				ut.commit();
			}
			catch (Exception e) {
				e.printStackTrace();
				ut.rollback();
			}

			timePositionTeacherInfo.setOperationStatus("2");
			timePositionTeacherInfoListtemp.add(timePositionTeacherInfo);
		}
		arrangeClass.setTimePositionTeacherInfos(timePositionTeacherInfoListtemp);

		ut.begin();
		try {
			classService.updateArrangeClass(arrangeClass, USER.getAccount());
			ut.commit();
		}
		catch (Exception e) {
			e.printStackTrace();
			ut.rollback();
		}
	}
}
