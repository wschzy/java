package com.sweet.hzy.mapper.provider;

import java.text.SimpleDateFormat;
import java.util.Date;

public class UserPayProvider {

	private String getTime(Date time) {
		String timeWhere;
		if(time == null) {
			timeWhere = "now()";
		}else {
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd"); 
			timeWhere = sdf.format(time);
		}
		return timeWhere;
	}
	
	public String getMoneyListByWeek(Integer userid,Date time) {
		String timeWhere = getTime(time);
		return "SELECT sum(MONEY)money,date_format(TIME,'%Y-%m-%d')time,DATE_FORMAT(time, '%a') obj FROM user_pay WHERE (userid = "+userid+" or userid in "
				+ "(select userid from user_home_rel where homeid in (select homeid from user_home_rel where userid = "+userid+"))) "
				+ "and YEARWEEK(date_format(time, '%Y-%m-%d') - INTERVAL 1 DAY) = YEARWEEK("+timeWhere+" - INTERVAL 1 DAY) group by date_format(TIME,'%Y-%m-%d')";
	}
	
	public String getMoneyListByMonth(Integer userid,Date time) {
		String timeWhere = getTime(time);
		return "SELECT money,date_format(TIME,'%Y-%m-%d')time FROM user_pay WHERE (userid = "+userid+" or  userid in" + 
		"(select userid from user_home_rel where homeid in (select homeid from user_home_rel where userid = "+userid+"))" + 
		"and date_format(time, '%Y-%m')  = date_format("+timeWhere+", '%Y-%m') order by time";
	}
	
	public String getMoneyListByYear(Integer userid,Date time) {
		String timeWhere = getTime(time);
		return "SELECT sum(MONEY)money,date_format(TIME,'%m')time FROM user_pay WHERE (userid = "+userid+" or userid in "
		+ "(select userid from user_home_rel where homeid in (select homeid from user_home_rel where userid = "+userid+"))) "
		+ "and date_format(time, '%Y')  = date_format("+timeWhere+", '%Y') group by date_format(TIME,'%Y-%m')";
	}
}
