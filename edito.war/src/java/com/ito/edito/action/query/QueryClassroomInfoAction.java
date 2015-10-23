package com.ito.edito.action.query;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.ito.edito.action.AjaxAction;
import com.ito.edito.ejb.Class.ClassService;
import com.ito.edito.schema.ArrangeClassTimeInfo;
import com.ito.edito.schema.Room;
import com.ito.edito.schema.TimePositionTeacherInfo;
import com.ito.fai.idp.core.Constraint;
import com.ito.fai.util.JndiFactory;

public class QueryClassroomInfoAction extends AjaxAction {
	public void executeManualUT() throws Exception {
		ClassService classService  = (ClassService) JndiFactory.lookup("classService");

		String campusUuid = request.getParameter("campusUuid");
		String attendClsFreq = request.getParameter("attendClsFreq");
		String attendClsFreqP = request.getParameter("attendClsFreqP");
		String clsMon = request.getParameter("clsMon");
		String clsTues = request.getParameter("clsTues");
		String clsWeb = request.getParameter("clsWeb");
		String clsThurs = request.getParameter("clsThurs");
		String clsFri = request.getParameter("clsFri");
		String clsSat = request.getParameter("clsSat");
		String clsSun = request.getParameter("clsSun");
		String clsBeginDate = request.getParameter("clsBeginDate");
		String clsEndTimes = request.getParameter("clsEndTimes");
		String clsStartTimeH = request.getParameter("clsStartTimeH");
		String clsStartTimeM = request.getParameter("clsStartTimeM");
		String clsFinishTimeH = request.getParameter("clsFinishTimeH");
		String clsFinishTimeM = request.getParameter("clsFinishTimeM");

		Constraint roomC = new Constraint("Room");
		if(campusUuid != null && campusUuid.length() >0) {
			roomC.addCondition("campusUuid", campusUuid);
		}
		roomC.addCondition("ifUsing", true);
		List<Room> roomList = classService.selectRooms(roomC);
		List<String[]> resultList = new ArrayList<String[]>();

		for(int i=0; i<roomList.size(); i++) {
			boolean flag = true;
			boolean flag2 = true;
			Room rm = roomList.get(i);
			String []str = new String[6];
			str[0] = rm.getUuid();
			str[1] = rm.getClassroomName();
			str[2] = rm.getNumberOf().toString();
			str[3] = rm.getRemarks() != null ? rm.getRemarks(): "" ;
			str[4] = rm.getCampus() != null ? rm.getCampus().getDescription() : "";

			Constraint timePositionTeacherC = new Constraint("TimePositionTeacherInfo");
			timePositionTeacherC.addCondition("arrangeRmUuid", str[0]);
			List<TimePositionTeacherInfo> timePositionTeacherInfoList = classService.selectTimePositionTeacherInfos(timePositionTeacherC);
			for(int j = 0; j<timePositionTeacherInfoList.size(); j++) {
				TimePositionTeacherInfo timePositionTeacherInfo = timePositionTeacherInfoList.get(j);
				int weekTempFlag = 0;
				int weekTempFlags[] = {0,0,0,0,0,0,0};
				if(Integer.parseInt(clsStartTimeH) > Integer.parseInt(timePositionTeacherInfo.getArrangeClsTime().getClsFinishTimeH())) {
					
				}
				else if(Integer.parseInt(clsFinishTimeH) < Integer.parseInt(timePositionTeacherInfo.getArrangeClsTime().getClsStartTimeH())) {
					
				}
				else if((Integer.parseInt(clsStartTimeH) == Integer.parseInt(timePositionTeacherInfo.getArrangeClsTime().getClsFinishTimeH())) && (Integer.parseInt(clsStartTimeM) > Integer.parseInt(timePositionTeacherInfo.getArrangeClsTime().getClsFinishTimeM()))) {
				
				}
				else if((Integer.parseInt(clsFinishTimeH) == Integer.parseInt(timePositionTeacherInfo.getArrangeClsTime().getClsStartTimeH())) && (Integer.parseInt(clsFinishTimeM) < Integer.parseInt(timePositionTeacherInfo.getArrangeClsTime().getClsStartTimeM()))) {
					
				}
				else {
					if((timePositionTeacherInfo.getArrangeClsTime().getAttendClsOnMon() != null) && (timePositionTeacherInfo.getArrangeClsTime().getAttendClsOnMon().length() > 0)) {
						if(timePositionTeacherInfo.getArrangeClsTime().getAttendClsOnMon().equals(clsMon)) {
							flag = false;
							weekTempFlag = 2;
						}
					}
					else if((timePositionTeacherInfo.getArrangeClsTime().getAttendClsOnTues() != null) && (timePositionTeacherInfo.getArrangeClsTime().getAttendClsOnTues().length() > 0)) {
						if(timePositionTeacherInfo.getArrangeClsTime().getAttendClsOnTues().equals(clsTues)) {
							flag = false;
							weekTempFlag = 3;
						}
					}
					else if((timePositionTeacherInfo.getArrangeClsTime().getAttendClsOnWeb() != null) && (timePositionTeacherInfo.getArrangeClsTime().getAttendClsOnWeb().length() > 0)) {
						if(timePositionTeacherInfo.getArrangeClsTime().getAttendClsOnWeb().equals(clsWeb)) {
							flag = false;
							weekTempFlag = 4;
						}
					}
					else if((timePositionTeacherInfo.getArrangeClsTime().getAttendClsOnThurs() != null) && (timePositionTeacherInfo.getArrangeClsTime().getAttendClsOnThurs().length() > 0)) {
						if(timePositionTeacherInfo.getArrangeClsTime().getAttendClsOnThurs().equals(clsThurs)) {
							flag = false;
							weekTempFlag = 5;
						}
					}
					else if((timePositionTeacherInfo.getArrangeClsTime().getAttendClsOnFri() != null) && (timePositionTeacherInfo.getArrangeClsTime().getAttendClsOnFri().length() > 0)) {
						if(timePositionTeacherInfo.getArrangeClsTime().getAttendClsOnFri().equals(clsFri)) {
							flag = false;
							weekTempFlag = 6;
						}
					}
					else if((timePositionTeacherInfo.getArrangeClsTime().getAttendClsOnSat() != null) && (timePositionTeacherInfo.getArrangeClsTime().getAttendClsOnSat().length() > 0)) {
						if(timePositionTeacherInfo.getArrangeClsTime().getAttendClsOnSat().equals(clsSat)) {
							flag = false;
							weekTempFlag = 7;
						}
					}
					else if((timePositionTeacherInfo.getArrangeClsTime().getAttendClsOnSun() != null) && (timePositionTeacherInfo.getArrangeClsTime().getAttendClsOnSun().length() > 0)) {
						if(timePositionTeacherInfo.getArrangeClsTime().getAttendClsOnSun().equals(clsSun)) {
							flag = false;
							weekTempFlag = 1;
						}
					}
					if(!flag) {
						int[][] calC = new int[2][];
						Calendar calTemp = Calendar.getInstance();
						calTemp.setFirstDayOfWeek(Calendar.MONDAY);
						SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
						Date dateEnd = format.parse(clsEndTimes);
						Date dateBegin = format.parse(clsBeginDate);
						if((timePositionTeacherInfo.getArrangeClsTime().getAttendClsOnMon() != null) && (timePositionTeacherInfo.getArrangeClsTime().getAttendClsOnMon().length() > 0)) {
							if(timePositionTeacherInfo.getArrangeClsTime().getAttendClsOnMon().equals(clsMon)) {
								weekTempFlags[0] = 1;
							}
						}
						if((timePositionTeacherInfo.getArrangeClsTime().getAttendClsOnTues() != null) && (timePositionTeacherInfo.getArrangeClsTime().getAttendClsOnTues().length() > 0)) {
							if(timePositionTeacherInfo.getArrangeClsTime().getAttendClsOnTues().equals(clsTues)) {
								weekTempFlags[1] = 1;
							}
						}
						if((timePositionTeacherInfo.getArrangeClsTime().getAttendClsOnWeb() != null) && (timePositionTeacherInfo.getArrangeClsTime().getAttendClsOnWeb().length() > 0)) {
							if(timePositionTeacherInfo.getArrangeClsTime().getAttendClsOnWeb().equals(clsWeb)) {
								weekTempFlags[2] = 1;
							}
						}
						if((timePositionTeacherInfo.getArrangeClsTime().getAttendClsOnThurs() != null) && (timePositionTeacherInfo.getArrangeClsTime().getAttendClsOnThurs().length() > 0)) {
							if(timePositionTeacherInfo.getArrangeClsTime().getAttendClsOnThurs().equals(clsThurs)) {
								weekTempFlags[3] = 1;
							}
						}
						if((timePositionTeacherInfo.getArrangeClsTime().getAttendClsOnFri() != null) && (timePositionTeacherInfo.getArrangeClsTime().getAttendClsOnFri().length() > 0)) {
							if(timePositionTeacherInfo.getArrangeClsTime().getAttendClsOnFri().equals(clsFri)) {
								weekTempFlags[4] = 1;
							}
						}
						if((timePositionTeacherInfo.getArrangeClsTime().getAttendClsOnSat() != null) && (timePositionTeacherInfo.getArrangeClsTime().getAttendClsOnSat().length() > 0)) {
							if(timePositionTeacherInfo.getArrangeClsTime().getAttendClsOnSat().equals(clsSat)) {
								weekTempFlags[5] = 1;
							}
						}
						if((timePositionTeacherInfo.getArrangeClsTime().getAttendClsOnSun() != null) && (timePositionTeacherInfo.getArrangeClsTime().getAttendClsOnSun().length() > 0)) {
							if(timePositionTeacherInfo.getArrangeClsTime().getAttendClsOnSun().equals(clsSun)) {
								weekTempFlags[6] = 1;
							}
						}
						if(attendClsFreq.equals("attendClsFreqBWK")) {
							boolean tempFlag3 = false;
							int tempInterval = (Integer.parseInt(attendClsFreqP) + 1) * 7;
							calTemp.setTime(dateEnd);
							calTemp.set(Calendar.DAY_OF_MONTH,calTemp.get(Calendar.DAY_OF_MONTH)+1);
							Date finishDate = calTemp.getTime();
							calTemp.setTime(dateBegin);
							int weekFlag = calTemp.get(Calendar.DAY_OF_WEEK);
							int month1 =  calTemp.get(Calendar.MONTH)+1;
							calTemp.set(Calendar.DAY_OF_MONTH,calTemp.get(Calendar.DAY_OF_MONTH)+(2-weekFlag));
							int month2 =  calTemp.get(Calendar.MONTH)+1;
							if(month1 != month2) {
								if(weekFlag == 1) {
									if(weekTempFlags[6] == 1) {
										tempFlag3 = true;
									}
								}
								else {
									for(int l=weekFlag; l<=7; l++){
										if(weekTempFlags[l-2] == 1) {
											tempFlag3 = true;
										}
									}
								}
							}
							if(!tempFlag3) {
								calTemp.set(Calendar.DAY_OF_MONTH,calTemp.get(Calendar.DAY_OF_MONTH)+7);
							}
							int temp = 0;
							
							while(calTemp.getTime().before(finishDate)) {
								temp++;
								calTemp.set(Calendar.DAY_OF_MONTH,calTemp.get(Calendar.DAY_OF_MONTH)+tempInterval);
								while(calTemp.getTime().after(finishDate)) {
									calTemp.set(Calendar.DAY_OF_MONTH,calTemp.get(Calendar.DAY_OF_MONTH)-tempInterval);
									int weekFlag2 = calTemp.get(Calendar.DAY_OF_WEEK);
									boolean flagC = true;
									while(calTemp.getTime().before(finishDate) && flagC) {
										if(weekFlag2 != 1) {
												if(weekTempFlags[weekFlag2-2] == 1) {
													flagC = false;
												}
										}
										else {
											flagC = false;
										}
										calTemp.set(Calendar.DAY_OF_MONTH,calTemp.get(Calendar.DAY_OF_MONTH)+1);
										weekFlag2++;
									}
									if(flagC) {
										temp--;
									}
								}
							}
							calC[0] = new int[temp];
							calC[1] = new int[temp];
							calTemp.setTime(dateBegin);
							calTemp.set(Calendar.DAY_OF_MONTH,calTemp.get(Calendar.DAY_OF_MONTH)+(2-weekFlag));
							if(!tempFlag3) {
								calTemp.set(Calendar.DAY_OF_MONTH,calTemp.get(Calendar.DAY_OF_MONTH)+7);
							}
							for(int k=0; k<temp; k++) {
								calC[0][k] = calTemp.get(Calendar.YEAR);
								calC[1][k] = calTemp.get(Calendar.WEEK_OF_YEAR);
								calTemp.set(Calendar.DAY_OF_MONTH,calTemp.get(Calendar.DAY_OF_MONTH)+tempInterval);
							}
						}
						else {
							boolean tempFlag2 = false;
							int tempInterval = Integer.parseInt(attendClsFreqP);
							calTemp.setTime(dateEnd);
							calTemp.set(Calendar.DAY_OF_MONTH,calTemp.get(Calendar.DAY_OF_MONTH)+1);
							Date finishDate = calTemp.getTime();
							calTemp.setTime(dateBegin);
							int month1 =  calTemp.get(Calendar.MONTH)+1;
							int weekFlag = calTemp.get(Calendar.DAY_OF_WEEK);
							calTemp.set(Calendar.DAY_OF_MONTH,calTemp.get(Calendar.DAY_OF_MONTH)+(weekTempFlag-weekFlag));
							int month2 =  calTemp.get(Calendar.MONTH)+1;
							if(month1 != month2) {
								if(weekFlag == 1) {
									if(weekTempFlags[6] == 1) {
										tempFlag2 = true;
									}
								}
								else {
									for(int l=weekFlag; l<=7; l++){
										if(weekTempFlags[l-2] == 1) {
											tempFlag2 = true;
										}
									}
								}
							}
							if(!tempFlag2) {
								calTemp.set(Calendar.DAY_OF_MONTH,calTemp.get(Calendar.DAY_OF_MONTH)+7);
							}
							int temp = 0;
							while(calTemp.getTime().before(finishDate)) {
								boolean tempflag = false;
								temp++;
								int month = calTemp.get(Calendar.MONTH)+1;
								calTemp.set(Calendar.DAY_OF_MONTH,calTemp.get(Calendar.DAY_OF_MONTH)+7);
								if((calTemp.get(Calendar.MONTH)+1) != month) {
									calTemp.add(Calendar.MONTH,tempInterval);
									if(tempInterval != 0) {
										calTemp.set(Calendar.DAY_OF_MONTH, 1);
										int monthTemp = calTemp.get(Calendar.DAY_OF_WEEK);
										for(int l=monthTemp; l<=7; l++){
											if(weekTempFlags[l-1] == 1) {
												tempflag = true;
											}
										}
										if(!tempflag) {
											calTemp.set(Calendar.DAY_OF_MONTH,calTemp.get(Calendar.DAY_OF_MONTH)+(weekTempFlag-monthTemp));
										}
									}
								}
							}
							tempFlag2 = false;
							int n = 0;
							calC[0] = new int[temp];
							calC[1] = new int[temp];
							calTemp.setTime(dateBegin);
							calTemp.set(Calendar.DAY_OF_MONTH,calTemp.get(Calendar.DAY_OF_MONTH)+(weekTempFlag-weekFlag));
							if(month1 != month2) {
								for(int l=weekFlag; l<=7; l++){
									if(weekTempFlags[l-1] == 1) {
										tempFlag2 = true;
									}
								}
							}
							if(!tempFlag2) {
								calTemp.set(Calendar.DAY_OF_MONTH,calTemp.get(Calendar.DAY_OF_MONTH)+7);
							}
							else
							{
								calC[0][n] = calTemp.get(Calendar.YEAR);
								calC[1][n] = calTemp.get(Calendar.WEEK_OF_YEAR);
								n++;
							}
							while(calTemp.getTime().before(finishDate)) {
								boolean tempflag = false;
								int month = calTemp.get(Calendar.MONTH)+1;
								calC[0][n] = calTemp.get(Calendar.YEAR);
								calC[1][n] = calTemp.get(Calendar.WEEK_OF_YEAR);
								calTemp.set(Calendar.DAY_OF_MONTH,calTemp.get(Calendar.DAY_OF_MONTH)+7);
								n++;
								if((calTemp.get(Calendar.MONTH)+1) != month) {
									calTemp.add(Calendar.MONTH,tempInterval);
									if(tempInterval != 0) {
										calTemp.set(Calendar.DAY_OF_MONTH, 1);
										int monthTemp = calTemp.get(Calendar.DAY_OF_WEEK);
										for(int l=monthTemp; l<=7; l++){
											if(weekTempFlags[l-1] == 1) {
												tempflag = true;
											}
										}
										if(!tempflag) {
											calTemp.set(Calendar.DAY_OF_MONTH,calTemp.get(Calendar.DAY_OF_MONTH)+(weekTempFlag-monthTemp));
										}
									}
								}
							}
						}

						Constraint arrangeClassTimeInfoC = new Constraint("ArrangeClassTimeInfo");
						arrangeClassTimeInfoC.addCondition("bizDataUuid", timePositionTeacherInfo.getArrangeClsTimeUuid());
						List<ArrangeClassTimeInfo> timeInfoList = classService.selectArrangeClassTimeInfos(arrangeClassTimeInfoC);
						for(int n=0; n<timeInfoList.size(); n++) {
							Date dateTemp = timeInfoList.get(n).getArrangeClsDate();
							calTemp.setTime(dateTemp);
							int weekOfYearTemp =  calTemp.get(Calendar.WEEK_OF_YEAR);
							int yearTemp =  calTemp.get(Calendar.YEAR);
							for(int a = 0; a<calC[0].length; a++) {
								if(calC[1][a] == weekOfYearTemp){
									if(calC[0][a] == yearTemp) {
										flag2 = false;
									}
								}
							}
						}
					}
				}
			}
			if(flag || flag2) {
				str[5] = "可用";
			}
			else {
				str[5] = "不可用";
			}
			resultList.add(str);
		}
		setResponseText(resultList);
	}
}
