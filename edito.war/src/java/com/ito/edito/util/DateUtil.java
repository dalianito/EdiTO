package com.ito.edito.util;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

public class DateUtil {

    public static Date getCurDayStartTime(){
        Calendar currentDate = new GregorianCalendar();   
        
        currentDate.set(Calendar.HOUR_OF_DAY, 0);  
        currentDate.set(Calendar.MINUTE, 0);  
        currentDate.set(Calendar.SECOND, 0); 
        
        return (Date)currentDate.getTime().clone();
    }
    
    public static Date getCurDayEndTime(){
        Calendar currentDate = new GregorianCalendar();   
        
        currentDate.set(Calendar.HOUR_OF_DAY, 23);  
        currentDate.set(Calendar.MINUTE, 59);  
        currentDate.set(Calendar.SECOND, 59); 
        
        return (Date)currentDate.getTime().clone();
    }
    
    public static Date getCurWeekStartTime(){
        Calendar currentDate = new GregorianCalendar();   
        currentDate.setFirstDayOfWeek(Calendar.MONDAY);  
                  
        currentDate.set(Calendar.HOUR_OF_DAY, 0);  
        currentDate.set(Calendar.MINUTE, 0);  
        currentDate.set(Calendar.SECOND, 0);  
        currentDate.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);  
        return (Date)currentDate.getTime().clone();  
    }
    
    public static Date getStartDateTime() {
        Calendar cal = Calendar.getInstance();
        cal.set(Calendar.DAY_OF_MONTH, 1);
        cal.set(Calendar.HOUR_OF_DAY, 0);
        cal.set(Calendar.MINUTE, 0);
        cal.set(Calendar.SECOND, 0);
        return (Date) cal.getTime().clone();
    }

    public static Date getEndDateTime() {
        Calendar cal = Calendar.getInstance();
        cal.set(Calendar.DAY_OF_MONTH,
                cal.getActualMaximum(Calendar.DAY_OF_MONTH));
        cal.set(Calendar.HOUR_OF_DAY, 23);
        cal.set(Calendar.MINUTE, 59);
        cal.set(Calendar.SECOND, 59);
        return (Date) cal.getTime().clone();
    }
    
    public static int getWeekNoForDate(Date date){
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.setFirstDayOfWeek(Calendar.MONDAY);  
        return cal.get(Calendar.WEEK_OF_YEAR);
    }
}
