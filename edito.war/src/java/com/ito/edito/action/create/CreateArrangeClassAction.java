package com.ito.edito.action.create;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Class.ClassService;
import com.ito.edito.schema.ArrangeClass;
import com.ito.edito.schema.ArrangeClassTime;
import com.ito.edito.schema.ArrangeClassTimeInfo;
import com.ito.edito.schema.TimePositionTeacherInfo;
import com.ito.edito.util.Constants;
import com.ito.fai.util.JndiFactory;

public class CreateArrangeClassAction extends AjaxAction {
	@SuppressWarnings({ "unchecked"})
	public void executeManualUT() throws Exception {
		ClassService classService = (ClassService) JndiFactory.lookup("classService");
		ArrangeClass arrangeClass = (ArrangeClass) carrier.fetchInstance("ArrangeClass");
		List<ArrangeClassTime> arrangeClassTimeList = (List<ArrangeClassTime>) carrier.fetchInstances("ArrangeClassTime");
		Map<String, String> map = new HashMap<String, String>();
		for(int i=0;i<arrangeClassTimeList.size();i++) {
			ArrangeClassTime arrangeClassTime = arrangeClassTimeList.get(i);
			String attendClsEndDateTP = arrangeClassTime.getClsEndDateTP();
			Date attendClsEnd = null;
			Calendar cal = Calendar.getInstance();
	        cal.setTime(arrangeClassTime.getClsBeginDate());
	        int weekFlag = cal.get(Calendar.DAY_OF_WEEK);
	        if(attendClsEndDateTP.equals("clsEndDate")) {
	        	 cal.setTime(arrangeClassTime.getClsEndDate());
	        	 cal.set(Calendar.DAY_OF_MONTH,cal.get(Calendar.DAY_OF_MONTH)+1);
				attendClsEnd = cal.getTime();
				cal.setTime(arrangeClassTime.getClsBeginDate());
			}
			else {
				if(arrangeClassTime.getClsEndTimes() != null && arrangeClassTime.getClsEndTimes().length() > 0) {
					int times = Integer.parseInt(arrangeClassTime.getClsEndTimes());
					times *= 7;
					cal.set(Calendar.DAY_OF_MONTH,cal.get(Calendar.DAY_OF_MONTH) + (times + 1));
				}
				attendClsEnd = cal.getTime();
				cal.setTime(arrangeClassTime.getClsBeginDate());
			}
			List<ArrangeClassTimeInfo> arrangeClassTimeInfoListTemp = new ArrayList<ArrangeClassTimeInfo>();
			if(arrangeClassTime.getAttendClsFreqTP().equals("attendClsFreqBWK")) {
				if(arrangeClassTime.getAttendClsFreqBWK() != null && arrangeClassTime.getAttendClsFreqBWK().length() > 0) {
					int attendClsFreqTPTemp = Integer.parseInt(arrangeClassTime.getAttendClsFreqBWK()) + 1;
					if(arrangeClassTime.getAttendClsOnMon() != null && arrangeClassTime.getAttendClsOnMon().length() > 0) {
						if(arrangeClassTime.getAttendClsOnMon().equals("on")) {
							int temp = (9 - weekFlag) % 7;
							cal.set(Calendar.DAY_OF_MONTH,cal.get(Calendar.DAY_OF_MONTH)+temp);
							while(cal.getTime().before(attendClsEnd)) {
								ArrangeClassTimeInfo arrangeClassTimeInfo = new ArrangeClassTimeInfo();
								arrangeClassTimeInfo.setArrangeClsDate(cal.getTime());
								arrangeClassTimeInfoListTemp.add(arrangeClassTimeInfo);
								cal.set(Calendar.DAY_OF_MONTH,cal.get(Calendar.DAY_OF_MONTH)+(attendClsFreqTPTemp*7));
							}
							cal.setTime(arrangeClassTime.getClsBeginDate());
						}
					}
					if(arrangeClassTime.getAttendClsOnTues() != null && arrangeClassTime.getAttendClsOnTues().length() > 0) {
						if(arrangeClassTime.getAttendClsOnTues().equals("on")) {
							int temp = (10 - weekFlag) % 7;
							cal.set(Calendar.DAY_OF_MONTH,cal.get(Calendar.DAY_OF_MONTH)+temp);
							while(cal.getTime().before(attendClsEnd)) {
								ArrangeClassTimeInfo arrangeClassTimeInfo = new ArrangeClassTimeInfo();
								arrangeClassTimeInfo.setArrangeClsDate(cal.getTime());
								arrangeClassTimeInfoListTemp.add(arrangeClassTimeInfo);
								cal.set(Calendar.DAY_OF_MONTH,cal.get(Calendar.DAY_OF_MONTH)+(attendClsFreqTPTemp*7));
							}
							cal.setTime(arrangeClassTime.getClsBeginDate());
						}
					}
					if(arrangeClassTime.getAttendClsOnWeb() != null && arrangeClassTime.getAttendClsOnWeb().length() > 0) {
						if(arrangeClassTime.getAttendClsOnWeb().equals("on")) {
							int temp = (11 - weekFlag) % 7;
							cal.set(Calendar.DAY_OF_MONTH,cal.get(Calendar.DAY_OF_MONTH)+temp);
							while(cal.getTime().before(attendClsEnd)) {
								ArrangeClassTimeInfo arrangeClassTimeInfo = new ArrangeClassTimeInfo();
								arrangeClassTimeInfo.setArrangeClsDate(cal.getTime());
								arrangeClassTimeInfoListTemp.add(arrangeClassTimeInfo);
								cal.set(Calendar.DAY_OF_MONTH,cal.get(Calendar.DAY_OF_MONTH)+(attendClsFreqTPTemp*7));
							}
							cal.setTime(arrangeClassTime.getClsBeginDate());
						}
					}
					if(arrangeClassTime.getAttendClsOnThurs() != null && arrangeClassTime.getAttendClsOnThurs().length() > 0) {
						if(arrangeClassTime.getAttendClsOnThurs().equals("on")) {
							int temp = (12 - weekFlag) % 7;
							cal.set(Calendar.DAY_OF_MONTH,cal.get(Calendar.DAY_OF_MONTH)+temp);
							while(cal.getTime().before(attendClsEnd)) {
								ArrangeClassTimeInfo arrangeClassTimeInfo = new ArrangeClassTimeInfo();
								arrangeClassTimeInfo.setArrangeClsDate(cal.getTime());
								arrangeClassTimeInfoListTemp.add(arrangeClassTimeInfo);
								cal.set(Calendar.DAY_OF_MONTH,cal.get(Calendar.DAY_OF_MONTH)+(attendClsFreqTPTemp*7));
							}
							cal.setTime(arrangeClassTime.getClsBeginDate());
						}
					}
					if(arrangeClassTime.getAttendClsOnFri() != null && arrangeClassTime.getAttendClsOnFri().length() > 0) {
						if(arrangeClassTime.getAttendClsOnFri().equals("on")) {
							int temp = (13 - weekFlag) % 7;
							cal.set(Calendar.DAY_OF_MONTH,cal.get(Calendar.DAY_OF_MONTH)+temp);
							while(cal.getTime().before(attendClsEnd)) {
								ArrangeClassTimeInfo arrangeClassTimeInfo = new ArrangeClassTimeInfo();
								arrangeClassTimeInfo.setArrangeClsDate(cal.getTime());
								arrangeClassTimeInfoListTemp.add(arrangeClassTimeInfo);
								cal.set(Calendar.DAY_OF_MONTH,cal.get(Calendar.DAY_OF_MONTH)+(attendClsFreqTPTemp*7));
							}
							cal.setTime(arrangeClassTime.getClsBeginDate());
						}
					}
					if(arrangeClassTime.getAttendClsOnSat() != null && arrangeClassTime.getAttendClsOnSat().length() > 0) {
						if(arrangeClassTime.getAttendClsOnSat().equals("on")) {
							int temp = (7 - weekFlag) % 7;
							cal.set(Calendar.DAY_OF_MONTH,cal.get(Calendar.DAY_OF_MONTH)+temp);
							while(cal.getTime().before(attendClsEnd)) {
								ArrangeClassTimeInfo arrangeClassTimeInfo = new ArrangeClassTimeInfo();
								arrangeClassTimeInfo.setArrangeClsDate(cal.getTime());
								arrangeClassTimeInfoListTemp.add(arrangeClassTimeInfo);
								cal.set(Calendar.DAY_OF_MONTH,cal.get(Calendar.DAY_OF_MONTH)+(attendClsFreqTPTemp*7));
							}
							cal.setTime(arrangeClassTime.getClsBeginDate());
						}
					}
					if(arrangeClassTime.getAttendClsOnSun() != null && arrangeClassTime.getAttendClsOnSun().length() > 0) {
						if(arrangeClassTime.getAttendClsOnSun().equals("on")) {
							int temp = (8 - weekFlag) % 7;
							cal.set(Calendar.DAY_OF_MONTH,cal.get(Calendar.DAY_OF_MONTH)+temp);
							while(cal.getTime().before(attendClsEnd)) {
								ArrangeClassTimeInfo arrangeClassTimeInfo = new ArrangeClassTimeInfo();
								arrangeClassTimeInfo.setArrangeClsDate(cal.getTime());
								arrangeClassTimeInfoListTemp.add(arrangeClassTimeInfo);
								cal.set(Calendar.DAY_OF_MONTH,cal.get(Calendar.DAY_OF_MONTH)+(attendClsFreqTPTemp*7));
							}
							cal.setTime(arrangeClassTime.getClsBeginDate());
						}
					}
				}
			}
			else {
				if(arrangeClassTime.getAttendClsFreqBMon() != null && arrangeClassTime.getAttendClsFreqBMon().length() > 0) {
					int attendClsFreqTPTemp = Integer.parseInt(arrangeClassTime.getAttendClsFreqBMon());
					if(arrangeClassTime.getAttendClsOnMon() != null && arrangeClassTime.getAttendClsOnMon().length() > 0) {
						if(arrangeClassTime.getAttendClsOnMon().equals("on")) {
							int temp = (9 - weekFlag) % 7;
							cal.set(Calendar.DAY_OF_MONTH,cal.get(Calendar.DAY_OF_MONTH)+temp);
							while(cal.getTime().before(attendClsEnd)) {
								ArrangeClassTimeInfo arrangeClassTimeInfo = new ArrangeClassTimeInfo();
								arrangeClassTimeInfo.setArrangeClsDate(cal.getTime());
								arrangeClassTimeInfoListTemp.add(arrangeClassTimeInfo);
								int month = cal.get(Calendar.MONTH)+1;
								cal.set(Calendar.DAY_OF_MONTH,cal.get(Calendar.DAY_OF_MONTH)+7);
								if((cal.get(Calendar.MONTH)+1) != month) {
									cal.add(Calendar.MONTH,attendClsFreqTPTemp);
									cal.set(Calendar.DAY_OF_MONTH, 1);
									int monthTemp = cal.get(Calendar.DAY_OF_WEEK);
									cal.set(Calendar.DAY_OF_MONTH,cal.get(Calendar.DAY_OF_MONTH)+((9 - monthTemp) % 7));
								}
							}
							cal.setTime(arrangeClassTime.getClsBeginDate());
						}
					}
					if(arrangeClassTime.getAttendClsOnTues() != null && arrangeClassTime.getAttendClsOnTues().length() > 0) {
						if(arrangeClassTime.getAttendClsOnTues().equals("on")) {
							int temp = (10 - weekFlag) % 7;
							cal.set(Calendar.DAY_OF_MONTH,cal.get(Calendar.DAY_OF_MONTH)+temp);
							while(cal.getTime().before(attendClsEnd)) {
								ArrangeClassTimeInfo arrangeClassTimeInfo = new ArrangeClassTimeInfo();
								arrangeClassTimeInfo.setArrangeClsDate(cal.getTime());
								arrangeClassTimeInfoListTemp.add(arrangeClassTimeInfo);
								int month = cal.get(Calendar.MONTH)+1;
								cal.set(Calendar.DAY_OF_MONTH,cal.get(Calendar.DAY_OF_MONTH)+7);
								if((cal.get(Calendar.MONTH)+1) != month) {
									cal.add(Calendar.MONTH,attendClsFreqTPTemp);
									cal.set(Calendar.DAY_OF_MONTH, 1);
									int monthTemp = cal.get(Calendar.DAY_OF_WEEK);
									cal.set(Calendar.DAY_OF_MONTH,cal.get(Calendar.DAY_OF_MONTH)+((10 - monthTemp) % 7));
								}
							}
							cal.setTime(arrangeClassTime.getClsBeginDate());
						}
					}
					if(arrangeClassTime.getAttendClsOnWeb() != null && arrangeClassTime.getAttendClsOnWeb().length() > 0) {
						if(arrangeClassTime.getAttendClsOnWeb().equals("on")) {
							int temp = (11 - weekFlag) % 7;
							cal.set(Calendar.DAY_OF_MONTH,cal.get(Calendar.DAY_OF_MONTH)+temp);
							while(cal.getTime().before(attendClsEnd)) {
								ArrangeClassTimeInfo arrangeClassTimeInfo = new ArrangeClassTimeInfo();
								arrangeClassTimeInfo.setArrangeClsDate(cal.getTime());
								arrangeClassTimeInfoListTemp.add(arrangeClassTimeInfo);
								int month = cal.get(Calendar.MONTH)+1;
								cal.set(Calendar.DAY_OF_MONTH,cal.get(Calendar.DAY_OF_MONTH)+7);
								if((cal.get(Calendar.MONTH)+1) != month) {
									cal.add(Calendar.MONTH,attendClsFreqTPTemp);
									cal.set(Calendar.DAY_OF_MONTH, 1);
									int monthTemp = cal.get(Calendar.DAY_OF_WEEK);
									cal.set(Calendar.DAY_OF_MONTH,cal.get(Calendar.DAY_OF_MONTH)+((11 - monthTemp) % 7));
								}
							}
							cal.setTime(arrangeClassTime.getClsBeginDate());
						}
					}
					if(arrangeClassTime.getAttendClsOnThurs() != null && arrangeClassTime.getAttendClsOnThurs().length() > 0) {
						if(arrangeClassTime.getAttendClsOnThurs().equals("on")) {
							int temp = (12 - weekFlag) % 7;
							cal.set(Calendar.DAY_OF_MONTH,cal.get(Calendar.DAY_OF_MONTH)+temp);
							while(cal.getTime().before(attendClsEnd)) {
								ArrangeClassTimeInfo arrangeClassTimeInfo = new ArrangeClassTimeInfo();
								arrangeClassTimeInfo.setArrangeClsDate(cal.getTime());
								arrangeClassTimeInfoListTemp.add(arrangeClassTimeInfo);
								int month = cal.get(Calendar.MONTH)+1;
								cal.set(Calendar.DAY_OF_MONTH,cal.get(Calendar.DAY_OF_MONTH)+7);
								if((cal.get(Calendar.MONTH)+1) != month) {
									cal.add(Calendar.MONTH,attendClsFreqTPTemp);
									cal.set(Calendar.DAY_OF_MONTH, 1);
									int monthTemp = cal.get(Calendar.DAY_OF_WEEK);
									cal.set(Calendar.DAY_OF_MONTH,cal.get(Calendar.DAY_OF_MONTH)+((12 - monthTemp) % 7));
								}
							}
							cal.setTime(arrangeClassTime.getClsBeginDate());
						}
					}
					if(arrangeClassTime.getAttendClsOnFri() != null && arrangeClassTime.getAttendClsOnFri().length() > 0) {
						if(arrangeClassTime.getAttendClsOnFri().equals("on")) {
							int temp = (13 - weekFlag) % 7;
							cal.set(Calendar.DAY_OF_MONTH,cal.get(Calendar.DAY_OF_MONTH)+temp);
							while(cal.getTime().before(attendClsEnd)) {
								ArrangeClassTimeInfo arrangeClassTimeInfo = new ArrangeClassTimeInfo();
								arrangeClassTimeInfo.setArrangeClsDate(cal.getTime());
								arrangeClassTimeInfoListTemp.add(arrangeClassTimeInfo);
								int month = cal.get(Calendar.MONTH)+1;
								cal.set(Calendar.DAY_OF_MONTH,cal.get(Calendar.DAY_OF_MONTH)+7);
								if((cal.get(Calendar.MONTH)+1) != month) {
									cal.add(Calendar.MONTH,attendClsFreqTPTemp);
									cal.set(Calendar.DAY_OF_MONTH, 1);
									int monthTemp = cal.get(Calendar.DAY_OF_WEEK);
									cal.set(Calendar.DAY_OF_MONTH,cal.get(Calendar.DAY_OF_MONTH)+((13 - monthTemp) % 7));
								}
							}
							cal.setTime(arrangeClassTime.getClsBeginDate());
						}
					}
					if(arrangeClassTime.getAttendClsOnSat() != null && arrangeClassTime.getAttendClsOnSat().length() > 0) {
						if(arrangeClassTime.getAttendClsOnSat().equals("on")) {
							int temp = (7 - weekFlag) % 7;
							cal.set(Calendar.DAY_OF_MONTH,cal.get(Calendar.DAY_OF_MONTH)+temp);
							while(cal.getTime().before(attendClsEnd)) {
								ArrangeClassTimeInfo arrangeClassTimeInfo = new ArrangeClassTimeInfo();
								arrangeClassTimeInfo.setArrangeClsDate(cal.getTime());
								arrangeClassTimeInfoListTemp.add(arrangeClassTimeInfo);
								int month = cal.get(Calendar.MONTH)+1;
								cal.set(Calendar.DAY_OF_MONTH,cal.get(Calendar.DAY_OF_MONTH)+7);
								if((cal.get(Calendar.MONTH)+1) != month) {
									cal.add(Calendar.MONTH,attendClsFreqTPTemp);
									cal.set(Calendar.DAY_OF_MONTH, 1);
									int monthTemp = cal.get(Calendar.DAY_OF_WEEK);
									cal.set(Calendar.DAY_OF_MONTH,cal.get(Calendar.DAY_OF_MONTH)+((7 - monthTemp) % 7));
								}
							}
							cal.setTime(arrangeClassTime.getClsBeginDate());
						}
					}
					if(arrangeClassTime.getAttendClsOnSun() != null && arrangeClassTime.getAttendClsOnSun().length() > 0) {
						if(arrangeClassTime.getAttendClsOnSun().equals("on")) {
							int temp = (8 - weekFlag) % 7;
							cal.set(Calendar.DAY_OF_MONTH,cal.get(Calendar.DAY_OF_MONTH)+temp);
							while(cal.getTime().before(attendClsEnd)) {
								ArrangeClassTimeInfo arrangeClassTimeInfo = new ArrangeClassTimeInfo();
								arrangeClassTimeInfo.setArrangeClsDate(cal.getTime());
								arrangeClassTimeInfoListTemp.add(arrangeClassTimeInfo);
								int month = cal.get(Calendar.MONTH)+1;
								cal.set(Calendar.DAY_OF_MONTH,cal.get(Calendar.DAY_OF_MONTH)+7);
								if((cal.get(Calendar.MONTH)+1) != month) {
									cal.add(Calendar.MONTH,attendClsFreqTPTemp);
									cal.set(Calendar.DAY_OF_MONTH, 1);
									int monthTemp = cal.get(Calendar.DAY_OF_WEEK);
									cal.set(Calendar.DAY_OF_MONTH,cal.get(Calendar.DAY_OF_MONTH)+((8 - monthTemp) % 7));
								}
							}
							cal.setTime(arrangeClassTime.getClsBeginDate());
						}
					}
				}
			}
			arrangeClassTime.setArrangeClassTimeInfos(arrangeClassTimeInfoListTemp);
			arrangeClassTime.setIfUsing(true);
			String key = String.valueOf(arrangeClassTime.getTimeStamp());
			ut.begin();
			try {
				if(arrangeClassTime.getUuid() == null) {
					String uuid = classService.insertArrangeClassTime(arrangeClassTime, USER.getAccount());
					map.put(key, uuid);
				}
				ut.commit();
			}catch (Exception e) {
				e.printStackTrace();
				ut.rollback();
			}
		}
		List<TimePositionTeacherInfo> timePositionTeacherInfoList = (List<TimePositionTeacherInfo>) carrier.fetchInstances("TimePositionTeacherInfo");
		List<TimePositionTeacherInfo> timePositionTeacherInfoListTemp = new ArrayList<TimePositionTeacherInfo>();
		for(int i=0;i<timePositionTeacherInfoList.size();i++) {
			TimePositionTeacherInfo timePositionTeacherInfo = timePositionTeacherInfoList.get(i);
			String key = String.valueOf(timePositionTeacherInfo.getTimeStamp());
			timePositionTeacherInfo.setArrangeClsTimeUuid(map.get(key), false);
			timePositionTeacherInfoListTemp.add(timePositionTeacherInfo);
		}

		arrangeClass.setTimePositionTeacherInfos(timePositionTeacherInfoListTemp);
		arrangeClass.setCourseCheckStateUuid(Constants.EXAMINATION_STATE_PASSED, false);
		arrangeClass.setClassStateUuid(Constants.CLASS_WILL, false);
		arrangeClass.setIfUsing(true);

		ut.begin();
		try {
			if(arrangeClass.getUuid() == null) {
				classService.insertArrangeClass(arrangeClass, USER.getAccount());
			}
			ut.commit();
		}
		catch (Exception e) {
			e.printStackTrace();
			ut.rollback();
		}
	}
}
