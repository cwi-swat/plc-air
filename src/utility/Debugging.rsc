module utility::Debugging

import DateTime;
import FileLocations;
import IO;
import List;
import String;

import utility::FileUtility;
import utility::StringUtility;

bool debuggingEnabled = true; 
int printIndex = 0;

public list[str] Errors = [];
str printFilter = "";

bool hasErrors() = 0 < size(Errors);

public void resetErrors()
{
 Errors = [];
}

public default &T debugPrint(str infoMessage, &T itemToPrint) = debugPrint(infoMessage, itemToPrint, true);
public &T debugPrint(str infoMessage, &T itemToPrint, bool printingEnabled)
{
  if(printingEnabled)
  {
    debugPrint("<infoMessage> <itemToPrint>");
  }
  return itemToPrint;
}

public &T debugPrint(&T itemToPrint, bool printingEnabled)
{
  if(printingEnabled)
  {
    debugPrint(itemToPrint);
  }
  return itemToPrint;
}

public &T debugPrint(&T itemToPrint)
{
  if(debuggingEnabled && (isEmpty(printFilter) || contains("<itemToPrint>", printFilter)))
  {
  	println("<printIndex> - <itemToPrint>");
   	printIndex += 1;
  }
  return itemToPrint;
}

datetime localDateTime = now(); 

public void startDuration() 
{
  debugPrint("Starting duration... (<timeStamp()>)");
  localDateTime = now();  
}

public &T handleError(&T errorToLog)
{
  currentError = "<timeStamp()>: <errorToLog>";
  debugPrint(errorToLog);
  Errors += currentError;
  addToFile(generatedFile("rascal.err"), "<currentError>\r\n");
  return errorToLog;
}


public str fileTimeStamp() = replaceAll(replaceAll(replaceAll(timeStamp(), ":", ""), "-", ""), " ", "_");
public str timeStamp() = printDateTime(now(), "YYYY-MM-dd HH:mm:ss");

public void printDuration() = printDuration("", localDateTime);
public void printDuration(str prefix) = printDuration(prefix, localDateTime); 

public void printDuration(datetime startTime) = printDuration("", startTime);
public void printDuration(str prefix, datetime startTime)
{
  debugPrint("<prefix> <formatDuration()>");
}

public str formatDuration()
{
  suffixes = ["d","h","m","s","ms"];
  counters = drop(2, extractIntegers("<createDuration(localDateTime, now())>"));
  firstValid = false;
  timeString = "";
  for(index <- [0..size(counters)])
  {
    countValue = counters[index];
    if((0 < countValue)
      || firstValid)
    {
      firstValid = true;
      timeString += "<countValue><suffixes[index]>";      
    }
  }
  return timeString;
}


