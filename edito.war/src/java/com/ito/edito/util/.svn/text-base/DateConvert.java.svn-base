package com.ito.edito.util;

import java.util.Calendar;
import java.util.Date;
import java.util.StringTokenizer;

import org.apache.commons.beanutils.ConversionException;
import org.apache.commons.beanutils.Converter;

/**
 * <p>
 * 该类基于beanutil,可以将String转换成Date类型。
 * </p>
 * 
 * @author <a href="mailto:eric_lee@ito.com.cn">Eric Lee</a>
 */

public class DateConvert implements Converter {
	/**
	 * @param type Converter接口参数，未使用
	 * @param value 要转换的value，可以是Data或String，否则返回null
	 * @return 日期类型数据或者null
	 */
	@SuppressWarnings("unchecked")
	public Object convert(Class type, Object value) {

		if (value instanceof Date) {// 日期类型直接返回
			return (Date) value;
		}
		else if (value instanceof String) {// 转化String类型
			String str = ((String) value).trim();
			if (str.length() == 0)
				return null;
			Calendar result = Calendar.getInstance();
			result.clear();
			try {
				int index = str.indexOf(' ');
				if (str.indexOf("T") != -1) {
					String s = str.substring(0, 10);
					parseDate(result, s);
				}
				else {
					if (index != -1) {
						parseDate(result, str.substring(0, index));
						parseTime(result, str.substring(++index));
					}
					else if (str.indexOf(':') != -1) {
						parseTime(result, str);
					}
					else {
						parseDate(result, str);
					}
				}
				return result.getTime();
			}
			catch (NumberFormatException e) {
				throw new ConversionException("日期转换错误:" + str);
			}
		}
		else {
			return null;
		}
	}

	/**
	 * 解析日期部分yyyy-MM-dd
	 * 
	 * @param date Calendar 解析后时间存储位置
	 * @param str String 时间字符串
	 */
	private void parseDate(Calendar date, String str) {
		StringTokenizer st = new StringTokenizer(str, "-");
		if (st.hasMoreTokens()) {
			date.set(Calendar.YEAR, Integer.parseInt(st.nextToken()));
			if (st.hasMoreTokens()) {
				date.set(Calendar.MONTH, Integer.parseInt(st.nextToken()) - 1);
				if (st.hasMoreTokens())
					date.set(Calendar.DATE, Integer.parseInt(st.nextToken()));
			}
		}
	}

	/**
	 * 解析时间部分hh:mm:ss
	 * 
	 * @param date Calendar 解析后时间存储位置
	 * @param str String 时间字符串
	 */
	private void parseTime(Calendar date, String str) {
		StringTokenizer st = new StringTokenizer(str, ":");
		if (st.hasMoreTokens()) {
			date.set(Calendar.HOUR, Integer.parseInt(st.nextToken()));
			if (st.hasMoreTokens()) {
				date.set(Calendar.MINUTE, Integer.parseInt(st.nextToken()));
				if (st.hasMoreTokens())
					date.set(Calendar.SECOND, Integer.parseInt(st.nextToken()));
			}
		}
	}
}
