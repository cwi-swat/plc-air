module utility::StringUtility

import List;
import String;

import utility::Debugging;
import utility::ListUtility;
import utility::MathUtility;


int parseInt(&T inputObject)
{
  inputString = "<inputObject>";
  try
  { 
    return firstInteger(inputString);
  }
  catch:
  {     
    return -1;
  }
}

public int firstInteger(str inputString) = first(extractIntegers(inputString));
public int lastInteger(str inputString) = last(extractIntegers(inputString));

list[int] extractIntegers(str inputString)
{
  list[int] integers = [];  
  try
  {
    while(1 > 0)
    { 
      firstItem = firstIntegerString(inputString);   
      integers += toInt(firstItem);
      inputString = stringToken(inputString, firstItem, "");
    }
  }
  catch:
  {
    ; // Will throw exception when handling exceptional toInt(), thus stopping the loop
  }
  return integers;  
}

public str firstIntegerString(str inputString)
{ 
  isHex = isHexaDecimal(inputString);
  newString = "";
  for(n <- [firstNumeric(inputString) .. size(inputString)])
  {
    char = toLowerCase(inputString[n]);
    if((inLimits("0", char, "9"))
      || (isHex && inLimits("a", char, "f")))
    {
      newString += char;
      continue;
    }
    break;
  }
  newString = stripLeading(newString, "0");
  return isHex ? "0x" + newString : newString;
}

bool isHexaDecimal(str stringToCheck) = -1 == firstHex(stringToCheck) ? false : firstNumeric(stringToCheck) - 2 == firstHex(stringToCheck);
int firstNumeric(str stringToCheck) = findDecimal(stringToCheck, firstHex(stringToCheck));
int firstHex(str stringToCheck) = findFirst(stringToCheck, "0x"); 

int findDecimal(str stringToCheck, int firstHexPos)
{
  for(n <- [0 .. size(stringToCheck)], inLimits("0", stringToCheck[n], "9") && n != firstHexPos)
  {
    return n;
  }
  return -1;
}

public str stripLeading(str inputString, str tokenToRemove)
{
  while(size(tokenToRemove) < size(inputString) && startsWith(inputString, tokenToRemove))
  {
    inputString = substring(inputString,size(tokenToRemove));
  }
  return inputString;
}

public str formatReal(real valueToPrint) = formatReal(valueToPrint, 2);
public str formatReal(int valueToPrint) = formatReal(1.0 * valueToPrint, 2);
public str formatReal(int valueToPrint, int digits) = formatReal(1.0 * valueToPrint, digits);
public str formatReal(real valueToPrint, int digits)
{
  tokens = split(".", "<valueToPrint>");
  if(2 != size(tokens))
  {
    handleError("Invalid real value passed: <valueToPrint>");
    return "0.0";
  }
  digitText = substring(left(tokens[1], digits, "0"), 0, digits);  
  return "<tokens[0]>.<digitText>";    
}

public str stringToken(str stringToCheck, str firstOccurrence, str lastOccurrence) = stringToken(stringToCheck, firstOccurrence, findLast(stringToCheck, lastOccurrence));
public str stringToken(str stringToCheck, int firstPosition, str lastOccurrence) = stringToken(stringToCheck, firstPosition, findLast(stringToCheck, lastOccurrence));
public str stringToken(str stringToCheck, str firstOccurrence, int lastPosition) = stringToken(stringToCheck, findFirst(stringToCheck, firstOccurrence)+size(firstOccurrence), lastPosition);
public str stringToken(str stringToCheck, int firstPosition, int lastPosition) = substring(stringToCheck, firstPosition, lastPosition); // only provided for convenience

public str clipString(str stringToClip, str startToken, str endToken) = clipString(stringToClip, findFirst(stringToClip, startToken), findFirst(stringToClip, endToken) + size(endToken), "");
public str clipString(str stringToClip, str startToken, str endToken, str splitToken) = clipString(stringToClip, findFirst(stringToClip, startToken), findFirst(stringToClip, endToken) + size(endToken), splitToken);
public str clipString(str stringToClip, int startPos, int endPos) = clipString(stringToClip, startPos, endPos, ""); 
public str clipString(str stringToClip, int startPos, int endPos, str split) = substring(stringToClip, 0, startPos) + split + substring(stringToClip, endPos);