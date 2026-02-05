module EcbHandler

import DataTypes;
import PC20Syntax;
import ParseTree;
import List;
import String;

import utility::Debugging;
import utility::InstructionUtility;
import utility::ListUtility;
import utility::StringUtility;

EcbPrefix EcbError = parse(#EcbPrefix,"++Red++CodeBlock: 99999-00000 is ");

// Module handles the specific insertion of code blocks back into the model tree
default EcbPrefix composeEcbPrefix(str colorName, list[&T] statements) = composeEcbPrefix(colorName, convertToString(statements));
EcbPrefix composeEcbPrefix(str colorName, list[str] statements) = composeEcbPrefix(colorName, <getProgramCounter(first(statements)), getProgramCounter(last(statements))>);
EcbPrefix composeEcbPrefix(str colorName, SourceRange range)
{
  try
  {
    lineColor = parse(#ColorName, "++<colorName>++");  
    sourceRange = composeSourceLineRange(range);
    return (EcbPrefix)`<ColorName lineColor>CodeBlock: <SourceLineRange sourceRange> is `;
  }
  catch:
  {
    handleError("Unable to generate prefix: <colorName> with range: <range>");
    return EcbError;
  } 
}

SourceLineRange composeSourceLineRange(SourceRange sourceRange) = parse(#SourceLineRange, "<right("<sourceRange.firstLine>", 5, "0")>-<right("<sourceRange.lastLine>", 5, "0")>");
SourceRange composeSourceRange(&T firstBlock, &T secondBlock) = <composeSourceRange(firstBlock).firstLine, composeSourceRange(secondBlock).lastLine>;
SourceRange composeSourceRange(&T codeBlock) 
{
  visit(codeBlock)
  {
    case(SourceLineRange)`<FiveDigits firstLine>-<FiveDigits lastLine>`:
    {
      return <parseInt(firstLine), parseInt(lastLine)>;
    }
    case(ProgramLineNumber)`<FiveDigits programCount><WhiteSpace ws>`:
    {
      lineNumber = parseInt(programCount);
      return <lineNumber,lineNumber>;
    }        
    default:
    {
      ; // Required in order to make concrete syntax match
    }
  }  
  return <-1,-1>;
}

