module testModule::SyntaxFailure

import List;
import ParseTree;
import String;
import IO;

public layout LS = [\ \t]* !>> [\ \t] ;

lexical ReadValue = ColorName "CodeBlock: " SourceLineRange " is ReadValue " AddressRange;
lexical SourceLineRange = FiveDigits "-" FiveDigits ;
lexical ColorName = "++" [A-Za-z]* "++" ;
lexical AddressRange = FiveDigits | (FiveDigits ",")+ FiveDigits ; 
lexical FiveDigits = [0-9][0-9][0-9][0-9][0-9];

public ReadValue sampleRead = parse(#ReadValue, "++Blue++CodeBlock: 00431-00432 is ReadValue 12345,12345");
public SourceRange expectedRange = <431,432>;

// SKIP
test bool testWithOnlyConcreteSyntax() = expectEqual(expectedRange, composeWithoutExtraCaseLabel(sampleRead), "With only concrete syntax, I fail");
test bool testWithDuplicateLabel() = expectEqual(expectedRange, composeWithItself(sampleRead), "Duplicate case labels will fail");
test bool testWithMultipleConcrete() = expectEqual(expectedRange, composeWithMultipleConcrete(sampleRead), "Multiple concrete syntax labels labels will fail");
// UNSKIP
test bool testWithConcreteAndExtraCaseLabel() = expectEqual(expectedRange, composeWithExtraCaseLabel(sampleRead), "With a sensible (unreachable) label, I will work just fine");
test bool testWithAnyExtraLabel() = expectEqual(expectedRange, composeWithAnything(sampleRead), "With any other label, things also work");
test bool testWithDefaultLabel() = expectEqual(expectedRange, composeWithDefault(sampleRead), "Even the default case is enough!");



alias SourceRange = tuple[int firstLine, int lastLine];

SourceRange composeWithoutExtraCaseLabel(&T codeBlock)
{
  visit(codeBlock)
  {
    case(SourceLineRange)`<FiveDigits firstLine>-<FiveDigits lastLine>`:
    {
      return <parseInt(firstLine), parseInt(lastLine)>;
    }    
  }
  return <-1, -1>;
}

SourceRange composeWithExtraCaseLabel(&T codeBlock) 
{
  visit(codeBlock)
  {
    case(SourceLineRange)`<FiveDigits firstLine>-<FiveDigits lastLine>`:
    {
      return <parseInt(firstLine), parseInt(lastLine)>;
    }
    case SourceLineRange S:
    {
      println("I will never be triggered, but without me, the concrete syntax will not work");
    }
  }  
  return <-1,-1>;
}

SourceRange composeWithAnything(&T codeBlock)
{
  visit(codeBlock)
  {
    case(SourceLineRange)`<FiveDigits firstLine>-<FiveDigits lastLine>`:
    {
      return <parseInt(firstLine), parseInt(lastLine)>;
    }  
    case "SomeAdditionalCase":
    {
      ; 
    }  
  }
  return <-1, -1>;
}

SourceRange composeWithDefault(&T codeBlock)
{
  visit(codeBlock)
  {
    case(SourceLineRange)`<FiveDigits firstLine>-<FiveDigits lastLine>`:
    {
      return <parseInt(firstLine), parseInt(lastLine)>;
    }  
    default:
    {
      ; 
    }  
  }
  return <-1, -1>;
}

SourceRange composeWithMultipleConcrete(&T codeBlock)
{
  visit(codeBlock)
  {
    case(SourceLineRange)`<FiveDigits firstLine>-<FiveDigits lastLine>`:
    {
      return <parseInt(firstLine), parseInt(lastLine)>;
    }  
    case(ColorName)`++Blue++`:
    {
      println("Blue!");
    }
  }
  return <-1, -1>;
}

SourceRange composeWithItself(&T codeBlock)
{
  visit(codeBlock)
  {
    case(SourceLineRange)`<FiveDigits firstLine>-<FiveDigits lastLine>`:
    {
      return <parseInt(firstLine), parseInt(lastLine)>;
    }  
    case(SourceLineRange)`<FiveDigits firstLine>-<FiveDigits lastLine>`:
    {
      return <parseInt(firstLine), parseInt(lastLine)>;
    } 
  }
  return <-1, -1>;
}

// IGNORE THE CODE BELOW, It's only present to make the module 'runnable' as separate module

// Test helpers
bool expectEqual(&T expected, &T actual, str messageOnFailure)
{
  if(expected != actual)
  {
    iprintln("");
    iprintln("Expected: <expected>");
    iprintln("Received: <actual>");
    iprintln(messageOnFailure);            
    return false;
  }
  return true;
}

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

// String conversion helpers 
public int firstInteger(str inputString) = head(extractIntegers(inputString));
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
  for(int charPosition <- [firstNumeric(inputString) .. size(inputString)])
  {
    str char = toLowerCase(inputString[charPosition]);
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

public str stringToken(str stringToCheck, str firstOccurrence, str lastOccurrence) = stringToken(stringToCheck, firstOccurrence, findLast(stringToCheck, lastOccurrence));
public str stringToken(str stringToCheck, int firstPosition, str lastOccurrence) = stringToken(stringToCheck, firstPosition, findLast(stringToCheck, lastOccurrence));
public str stringToken(str stringToCheck, str firstOccurrence, int lastPosition) = stringToken(stringToCheck, findFirst(stringToCheck, firstOccurrence)+size(firstOccurrence), lastPosition);
public str stringToken(str stringToCheck, int firstPosition, int lastPosition) = substring(stringToCheck, firstPosition, lastPosition); // only provided for convenience

bool inLimits(&T lowerBound, &T actualValue, &T upperBound) = actualValue == limit(lowerBound, actualValue, upperBound);
&T limit(&T lowerBound, &T actualValue, &T upperBound) = min(max(actualValue, lowerBound), upperBound);
&T max(&T first, &T second) = first == min(first,second) ? second : first;
&T min(&T first, &T second) = first < second ? first : second ;
