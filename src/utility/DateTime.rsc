module utility::DateTime

import DateTime;
import String;

// overloads to mask issues with date time
datetime parseDate(str date, str format) = DateTime::parseDate(date, replaceAll(format, "Y", "y"));
datetime parseDate(str date) = parseDate(date, "yyyy-MM-dd");
str printDate(datetime date) = ("<date.year>-<right("<date.month>", 2, "0")>-<right("<date.day>", 2, "0")>");

// overloads to fix issues with date incrementing
datetime incrementMonths(datetime d) = incrementMonths(d, 1);
datetime incrementMonths(datetime d, int monthsToIncrement) = createDate(d.year, d.month + monthsToIncrement, d.day);
