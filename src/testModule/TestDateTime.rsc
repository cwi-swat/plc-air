module testModule::TestDateTime

import utility::DateTime;
import utility::TestUtility;

import DateTime;
import IO;
import String;

// parsing appears right
test bool testMinimumMonth() = expectEqual("$2017-01-05$", "<parseDate("2017-01-05")>", "5th of janary, 2017");
test bool testMaximumMonth() = expectEqual("$2017-12-05$", "<parseDate("2017-12-05")>", "5th of december, 2017"); 

// Printing is from feb. to dec.
test bool printMinimumDate() = expectEqual("2017-01-05", printDate(parseDate("2017-01-05")), "Printing january date prints february");
test bool printMaximumDate() = expectEqual("2017-12-05", printDate(parseDate("2017-12-05")), "Printing december date throws an exception");

// Funny thing is that it compensates the argument passed, except for 0
test bool printAboveLimit() = expectEqual("2018-01-05", printDate(parseDate("2017-13-05")), "Works, so should be january"); 
test bool printInvalidDate() = expectEqual("2017-01-05", printDate(parseDate("2017-01-05")), "This qualifies as january");

// These can be interpreted ambiguously, because a year and NO months, will still be janary, or a year and 1 months is january, thus resulting in december...
test bool printInvalidDate() = expectEqual("2016-12-05", printDate(parseDate("2017-00-05")), "So 00 would then result in december"); 
test bool printNegativeLimit() = expectEqual("2016-11-05", printDate(parseDate("2017--1-05")), "So -1 would then result in november");

// Some date printing test routines
test bool testExample() = expectEqual(substring("<now()>", 1,11), printDate(now()), "Printing same timestamp should yield same result...");
test bool testDates() = expectEqual(todaysDate(), todayWithCapital(), "Printing expects YYYY, wo shy doesn\'t parsing?");
test bool testParsing() = expectEqual("$2017-04-25$", "<todaysDate()>", "When printing a dateTime as literal, the date encosed by $ should appear");
test bool testDefaultDate() = expectEqual("2017-04-25", printDate(todaysDate()), "Printing to default timestamp should give this date");

// some date offset test routines, also a month off
test bool testOffset0() = expectEqual(todaysDate(), incrementMonths(todaysDate(), 0), "Incrementing by 0: same date");
test bool testOffset1() = expectEqual(inOneMonth(), incrementMonths(todaysDate(), 1), "Incrementing by 1: next month");
test bool testOffset() = expectEqual(inOneMonth(), incrementMonths(todaysDate()), "Default offset is 1 month");
test bool testNegativeOffset() = expectEqual(lastMonth(), incrementMonths(todaysDate(), -1), "Negative offset");

// simple dates
datetime todaysDate() = parseDate("2017-04-25");
datetime inOneMonth() = parseDate("2017-05-25"); 
datetime lastMonth() = parseDate("2017-03-25");
datetime todayWithCapital() = parseDate("2017-04-25", "YYYY-MM-dd"); // works in print, but not in parse
