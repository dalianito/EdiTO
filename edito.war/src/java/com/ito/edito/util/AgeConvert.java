package com.ito.edito.util;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

public class AgeConvert {
	public static int getAge(long l) {
		GregorianCalendar gregorianCalendar = new GregorianCalendar();
		gregorianCalendar.setTimeInMillis(l);
		Calendar calendar = Calendar.getInstance();
		Calendar calendar2 = gregorianCalendar;
		int i = calendar.get(Calendar.YEAR) - calendar2.get(Calendar.YEAR);
		calendar2.roll(Calendar.YEAR, i);
		if (calendar2.after(calendar)) {
			i = i - 1;
		}
		return i;
	}

	public static int getBirthdateYear(String age) {
		GregorianCalendar gregorianCalendar = new GregorianCalendar();
		gregorianCalendar.setTimeInMillis(new Date().getTime());
		// Calendar calendar = gregorianCalendar;
		Calendar calendar1 = Calendar.getInstance();
		int s = calendar1.get(Calendar.YEAR) - Integer.parseInt(age);
		return s;
	}
}
