package com.sweet.util;

import org.springframework.util.StringUtils;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

public interface FinalString {
    public final static String DATE_PATTERN = "yyyy-MM-dd";
    public static final String key = "operation-records";


    public static ThreadLocal<DateFormat> threadLocal = new ThreadLocal<DateFormat>() {
        @Override
        protected DateFormat initialValue() {
            return new SimpleDateFormat(DATE_PATTERN);
        }
    };

    public static Date parseSync(String dateStr) throws ParseException {
        return threadLocal.get().parse(dateStr);
    }

    public static String formatSync(Date date) {
        return threadLocal.get().format(date);
    }

    public static Date getDate(String dateStr, String pattern) {
        if (StringUtils.isEmpty(pattern)) {
            pattern = DATE_PATTERN;
        }
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern(pattern);
        LocalDate date = LocalDate.parse(dateStr, formatter);
        ZoneId zoneId = ZoneId.systemDefault();
        ZonedDateTime zdt = date.atStartOfDay(zoneId);
        return Date.from(zdt.toInstant());
    }

    public static String getDateStr(Date date, String pattern) {
        if (StringUtils.isEmpty(pattern)) {
            pattern = DATE_PATTERN;
        }
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern(pattern);
        ZoneId zoneId = ZoneId.systemDefault();
        LocalDateTime now = date.toInstant().atZone(zoneId).toLocalDateTime();
        return now.format(formatter);

    }

}
