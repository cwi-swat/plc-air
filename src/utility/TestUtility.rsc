module utility::TestUtility

import FileLocations;
import IO;
import List;
import String;

import utility::FileUtility;
import utility::ListUtility;

bool expectFalse(bool testMe) = expectFalse(testMe, "");
bool expectTrue(bool testMe) = expectTrue(testMe, "");

bool expectFalse(bool testMe, str messageOnFailure) = expectEqual(false, testMe, messageOnFailure);
bool expectTrue(bool testMe, str messageOnFailure) = expectEqual(true, testMe, messageOnFailure);

bool expectEqual(list[&T] expected, list[&T] actual, loc fileToStore)
{
  bool result = expectEqual(expected, actual);
  writeFile(fileToStore, joinList(actual));
  return result;
}

bool expectEqual(&T expected, &T actual, loc fileToStore)
{
  bool result = expectEqual(expected, actual);
  writeFile(fileToStore, actual);
  return result;
}

bool expectEqual(list[&T] expected, list[&T] actual, str messageOnFailure)
{
  if(!expectEqual(size(expected), size(actual)))
  {
    println("<messageOnFailure> list differ in size" );    
    return false;
  }
  
  for(n <- [0.. size(actual)], !expectEqual(expected[n], actual[n]))
  {
    println("<messageOnFailure> list contents differ at position <n>.");
    return false;
  }
  return true;
}

bool expectEqual(str expected, str actual)
{
  if(expected != actual)
  {
    iprintln("Expected: --|<expected>|-- size: <size(expected)>, received --|<actual>|-- size: <size(actual)>");
    return false;
  }
  return true;
}

// Prints the resuls when they are not expected, faster debugging of tests
bool expectEqual(&T expected, &T actual) = expectEqual(expected, actual, "");
bool expectEqual(&T expected, &T actual, str messageOnFailure)
{
  strExpected = "<expected>";
  strActual = "<actual>";
  if(strExpected != strActual)
  {
    iprintln("Expected (<size(strExpected)>): <strExpected>");
    iprintln("Received (<size(strActual)>): <strActual>");
    iprintln(messageOnFailure);            
    return false;
  }
  return true;
}

bool expectNotEqual(&T expected, &T actual) = expectNotEqual(expected, actual, "");
bool expectNotEqual(&T expected, &T actual, str messageOnFailure)
{
  if(true == expectEqual(expected, actual, messageOnFailure))
  {
    iprintln("Equal values passed: <expected>!");
    iprintln(messageOnFailure);  
    return false;
  }
  return true;
}

bool expectEqualFiles(loc expectedFile, loc actualFile) = expectEqualFiles(expectedFile, readFileLines(actualFile));
bool expectEqualFiles(loc fileToScan, list[str] contentToCompare) = expectEqualFiles(readFileLines(fileToScan), contentToCompare);
bool expectEqualFiles(list[&T] fileToScan, list[&T] contentToCompare)
{
  if(false == expectEqual(fileToScan, contentToCompare))
  {
    addToFile(outputFile("test/FailedFileCompares.txt"), joinList(fileToScan-contentToCompare));
    return false;
  }
  return true;
}