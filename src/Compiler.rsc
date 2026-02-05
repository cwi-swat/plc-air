module Compiler

import FileLocations;
import IO;
import LabelHandler;
import List;
import Parser;
import PC20Syntax;
import Prelude;
import String;
import Environment;

import utility::Debugging;
import utility::FileUtility;
import utility::ListUtility;
import utility::MathUtility;
import utility::StringUtility;

alias CompiledData = tuple[list[str] compiledLines, LabelList labels];
alias CompiledSourceData = tuple[CompiledData compiledData, list[str] sourceInfo];
alias InstructionList = tuple[list[str] compiledLines, list[str] sourceInfo];

void compilePds() = compileToFile("DR_TOT_3");
void compileToFile(str file) = writeToFile(generatedFile("<file>.compiled"),compile(file).compiledLines);

private bool printCompileInfo = true;
private bool printHandlingStatements = false;
private int nopLength = 15;
private int compiledStringLength = 24;

// Compile and glue back original input
CompiledData compileWithSourcesToFile(str sourceFile, SymbolTable symbols)
{ 
  compiledData = compileWithSources(sourceFile, symbols) ;
  writeToFile(generatedFile("<sourceFile>.compiled"), compiledData.compiledLines);
  return compiledData;
}

// Compile with storing of original input
CompiledData compileWithSources(str sourceFile, SymbolTable symbols)
{
  totalData = compile(sourceFile, symbols);
  totalData.compiledLines = insertSources(totalData.compiledLines, sourceFile, symbols);  
  return totalData;
}

list[str] insertSources(list[str] compiledLines, str inputFile, SymbolTable symbols)
{
  inputData = readFileLines(testFile(inputFile));
  processedLine = -1;
  for(n <- [0..size(compiledLines)])
  {
    compiledLine = getSourceLineNumber(compiledLines[n]);
    if(processedLine != compiledLine)
    {
      str sourceLine = composeSourceLine(inputData[compiledLine-1], symbols);
      compiledLines[n] += sourceLine;      
      processedLine = compiledLine;
    } 
  }
  return compiledLines;  
}

str composeSourceLine(str sourceLine, SymbolTable symbols)
{
  if(-1 == findFirst(sourceLine, "!"))
  {    
    comment = retrieveComment(jumpDestination(sourceLine), symbols);
    if(("UNKNOWN_IDENTIFIER" != comment) && (false == isEmpty(comment)))
    {
      sourceLine += "\t<comment>";
    } 
  }
  return sourceLine;
}

// Compile without storing orignal input
CompiledData compile(str file) = compile("<file>", "DR_TOT_3.SYM");
CompiledData compile(str sourceFile, str symbolTableFile) = compile(sourceFile, loadSymbols(symbolTableFile));
CompiledData compile(str sourceFile, SymbolTable symbols)
{  
  LabelList labels = [];
  progCounter = 0;
  lineCounter = 1;
  lastLine = 1;
  compiledLines = [];
  debugPrint("Visiting ast");
  visit(generateSourceTree(sourceFile))
  {
    case NewLine N:
    {
      lineNumber = getLineNumber(N);
      if(lastLine == getLineNumber(N))
      {
        debugPrint("Handling newline", printHandlingStatements);  
        compiledLines += formatLine(lineCounter);
        lineCounter += 1;  
        lastLine = lineCounter;
      }
      else
      {
        debugPrint("Skipping newline @ line <lineNumber>", printHandlingStatements);
      }      
    }
    case SingleLabel L:
    {
      debugPrint("Handling single label <L>", printHandlingStatements);
      labels += composeLabel("<L>", progCounter); 
    }
    case Instruction I:
    {     
      debugPrint("Handling <I>, line count <lineCounter>, prog count <progCounter>", printHandlingStatements); 
      instructions = handleInstruction(I, lineCounter, progCounter, symbols);
      progCounter += size(instructions);
      lineCounter += 1;
      compiledLines += instructions;         
      lastLine = lineCounter;
    }
    case PdsComment C:
    {
      lineNumber = getLineNumber(C);
      if(lastLine == lineNumber)
      {
        debugPrint("Handling pds comment <C>, line count <lineCounter>, prog count <progCounter>", printHandlingStatements);
        compiledLines += formatLine(lineCounter);        
        lineCounter+=1;
        lastLine = lineCounter;
      }
      else
      {
        debugPrint("Skipping comment, line number <lineNumber> already occupied", printHandlingStatements);              
      }      
    }  
      
  }  
  debugPrint("First compilation stage completed", printCompileInfo);  
  return insertJumps(<compiledLines, sort(labels)>);  
}

CompiledData insertJumps(CompiledData firstStageData)
{
  compiledLines = firstStageData.compiledLines;  
  for(n <- [0 .. size(compiledLines)], isJump(compiledLines[n]))
  {
    programLine = getProgramLine(compiledLines[n]);    
    str label = labelName(compiledLines[n]);
    labelLine = getProgramLine(firstStageData.labels, label);
    if(startsWith(label, "L"))
    {
      switch(instructionNumber(compiledLines[n]))
      {
        case 24:
        {
          compiledLines[n] = replaceLabel(compiledLines[n], format(labelLine));
        }
        case 25:
        {
          compiledLines[n] = replaceLabel(compiledLines[n], format(labelLine));
        }
        case 29:
        {
          compiledLines[n] = replaceLabel(compiledLines[n], format(programLine - labelLine));
        }
        case 30:
        {
          compiledLines[n] = replaceLabel(compiledLines[n], format(labelLine - programLine));
        }   
      }
    }    
  }
  return <compiledLines, firstStageData.labels>;
}

bool isJump(str compiledLine) = isRelativeJump(compiledLine) || isAbsoluteJump(compiledLine);

bool isRelativeJump(str compiledLine) = inLimits(29, instructionNumber(compiledLine), 30);
bool isAbsoluteJump(str compiledLine) = inLimits(24, instructionNumber(compiledLine), 25);

int instructionNumber(str compiledLine)
{
  if(14 < size(compiledLine)) 
  {
    return parseInt(substring(compiledLine, 12,14));    
  }
  return -1;
}

int getProgramLine(str compiledLine)
{
  if(11 < size(compiledLine))
  {
    return parseInt(substring(compiledLine,6,11));    
  }
  return -1;
}

int getSourceLineNumber(str compiledLine)
{
  spacePos = findFirst(compiledLine, " ");
  if(-1 != spacePos)
  {
    return parseInt(substring(compiledLine, 0, spacePos));
  }
  return parseInt(compiledLine);
}

int getLineNumber(&T item) = item@\loc.begin.line;

list[str] handleNop(Tree I, int lineNumber, int progCounter)
{
  visit(I)
  {
    case Amount A:
    {
      debugPrint("Found <A> Nops", printCompileInfo);
      return handleNop(toInt(trim("<A>")), lineNumber, progCounter);      
    }
  }
  return handleNop(1, lineNumber, progCounter);  
}

str replaceLabel(str compiledLine, str replacedJump) = padLength(substring(compiledLine, 0, 15) + replacedJump, compiledStringLength); 

str labelName(str compiledLine)
{
  characterPos = findLast(compiledLine, "L");
  if(0 < characterPos)
  {
    return trim(substring(compiledLine, characterPos));
  }
  return jumpDestination(compiledLine);      
}

str jumpDestination(str compiledLine)
{
  compiledLine = trim(replaceAll(compiledLine, "\t", " "));
  lastSpacePos = findLast(compiledLine, " ");
  if(0 < lastSpacePos)
  {
    return trim(substring(compiledLine, lastSpacePos));
  }
  return "ERROR";
}

list[str] handleNop(int amount, int lineNumber, int progCounter)
{
  list[str] instructions = [formatLine(lineNumber, progCounter, compiledStringLength)];  
  for(n <- [1 .. amount])
  {
    progCounter += 1;    
    instructions += formatLine(lineNumber, progCounter, nopLength);    
  }  
  return instructions;
}

list[str] handleInstruction(&T I, int lineNumber, int progCounter, SymbolTable table)
{
  instruction = -1;
  address = ""; 
  debugPrint("Handling line number <lineNumber>, Instruction <I>", printHandlingStatements);
  visit(I)
  {
    case IdentifierInstructionName I:
    { 
      instruction = instructionNumber(I);
    }          
    case AmountInstructionName A:
    { 
      debugPrint("Handling amount instruction <A>");
      instruction = instructionNumber(A);      
    }
    case LabelInstructionName L:
    {
      debugPrint("Handling label instruction <L>");      
      instruction = instructionNumber(L);      
    }
    case Label L:
    {
      address = "<L>";
    }
    case ProgramLine P:
    {
      address = "<P>";
    }
    case NopInstruction N:
    {
      return handleNop(I, lineNumber, progCounter);
    }
    case PlainInstruction P:
    {
      instruction = 26;
      return [formatLine(lineNumber, progCounter, instruction, "     ")];
    }
    case Variable V:
    {    
      address = convertVariable(V, table);
    }
    case Address A:
    {
      address = trim("<A>");
    }    
    case Amount A:
    {
      address = trim("<A>");
    }
  }  
  str returnLine = formatLine(lineNumber, progCounter, instruction, format(address, 5));
  debugPrint(returnLine);  
  return [returnLine];   
}

str formatLine(int lineNumber) = padLength(format(lineNumber), compiledStringLength);
str formatLine(int lineNumber, int progCounter, int desiredLength) = padLength("<format(lineNumber)> <format(progCounter)> 00", desiredLength);
str formatLine(int lineNumber, int progCounter, int instruction, str address) = padLength("<format(lineNumber)> <format(progCounter)> <format(instruction, 2)> <format(address,5)>", compiledStringLength);
str padLength(str inputString, int outputSize) = left(inputString, outputSize, " ");
str format(int numericValue) = format(numericValue, 5);
str format(int numericValue, int stringSize) = format("<numericValue>", stringSize);
str format(str stringValue, int stringSize) = contains(stringValue, ".") ? right(stringValue, stringSize+2, "0") : right(stringValue, stringSize, "0") ;

int instructionNumber((IdentifierInstructionName)`TRIG`) = 1 ;
int instructionNumber((IdentifierInstructionName)`EQL`) = 2 ;
int instructionNumber((IdentifierInstructionName)`EQLNT`) = 3 ;
int instructionNumber((IdentifierInstructionName)`SHFTL`) = 4 ;
int instructionNumber((IdentifierInstructionName)`SHFTR`) = 5 ;
int instructionNumber((IdentifierInstructionName)`CNTD`) = 6;
int instructionNumber((IdentifierInstructionName)`CNTU`) = 7;
int instructionNumber((IdentifierInstructionName)`SET0`) = 8;
int instructionNumber((IdentifierInstructionName)`SET1`) = 9;
int instructionNumber((IdentifierInstructionName)`STRB`) = 10;
int instructionNumber((IdentifierInstructionName)`FTCHB`) = 11;

int instructionNumber((AmountInstructionName)`FTCHC`) = 12;
 
int instructionNumber((IdentifierInstructionName)`FTCHD`) = 13;
int instructionNumber((IdentifierInstructionName)`STRD`) = 14;
int instructionNumber((IdentifierInstructionName)`COMP`) = 15;
int instructionNumber((IdentifierInstructionName)`AND`) = 16;
int instructionNumber((IdentifierInstructionName)`ANDNT`) = 17;
int instructionNumber((IdentifierInstructionName)`OR`) = 18;
int instructionNumber((IdentifierInstructionName)`ORNT`) = 19;
int instructionNumber((IdentifierInstructionName)`ADD`) = 20;
int instructionNumber((IdentifierInstructionName)`SUBTR`) = 21;
int instructionNumber((IdentifierInstructionName)`MULT`) = 22;
int instructionNumber((IdentifierInstructionName)`DIV`) = 23;

int instructionNumber((LabelInstructionName)`JSAF`) = 24;
int instructionNumber((LabelInstructionName)`JSAT`) = 25;

int instructionNumber((LabelInstructionName)`JBRF`) = 29;
int instructionNumber((LabelInstructionName)`JFRF`) = 30;
   
int instructionNumber((IdentifierInstructionName)`END`) = 27;    
int instructionNumber((IdentifierInstructionName)`LSTIO`) = 31;
