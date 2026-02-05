module utility::InstructionUtility

// Simple utility to extract information from (compiled) instructions

import List;
import ParseTree;
import PC20Syntax;
import String;

import utility::Debugging;
import utility::StringUtility;

str addressRange(list[str] statements)
{
  str range = getAddress(head(statements));
  for(statement <- tail(statements))
  {
    range += ",<getAddress(statement)>";
  }
  return range;
} 

str addressRange(&T firstPart, &T secondPart) = "<addressRange(firstPart)> to <addressRange(secondPart)>";

str addressRange(&T ECB)
{
  visit(ECB)
  {
    case AddressRange A:
    {
      return "<A>";
    }
  }
  handleError("No addressrange found in block: <ECB>");
  return "";
} 

str getAddress(str lineToCheck)
{
  try
  {
    return substring(lineToCheck, 15,20);
  }
  catch:
  {
    return "99999";
  }
}

str bitAddress(&T instruction)
{
  visit(instruction)
  {
    case BitAddress B:
    {
      return trim("<B>");
    }
  }
  handleError("No bitaddress present: <instruction>");
  return "99999.9";
}

int getProgramCounter(str lineToCheck)
{
  try
  {
    return parseInt(substring(lineToCheck, 6,11));
  }
  catch:
  {
    return -1;
  }  
}

int getLineNumber(&T item)
{
  try
  {
    return item@\loc.begin.line;
  }
  catch:
  {
    return -1 ;
  }
}

str getAddress(&T instruction)
{
  visit(instruction)
  {
    case WordAddress W:
    {
      return trim("<W>");
    }
  }
  return "99999";
}
