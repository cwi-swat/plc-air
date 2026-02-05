module testModule::CodeSysTests

extend ParserBase;

import CodeSysChecker;
import CodeSysGenerator;
import CodesysSyntax;
import CodesysTypes;
import FileLocations;
import IO;
import List;
import ParseTree;
import Parser;
import ParserBase;
import Rewriter;
import PC20Syntax;
import Environment;
import String;

import utility::Debugging;
import utility::FileUtility;
import utility::TestUtility;

list[str] emptyProgram = ["PROGRAM PC20_CYCLE", "VAR", "END_VAR", "END_PROGRAM"];

PlcProgram emptyModel = <[], []>;

test bool testGeneratingEmptyProgram() = expectEqual(emptyProgram, generateOutput(emptyModel));

str sampleBool = "  theBool : BOOL ; (* 0.1 !IAmBool *)";
Symbol boolean = <"theBool", "0.1", "!IAmBool", "">;

str sampleInt = "  numeric : INT ; (* 100 !Numeric *)";
Symbol integer = <"numeric", "100", "!Numeric", "">;

test bool testBooleanVariable() = expectEqual(sampleBool, extractVariable(boolean), "boolean types are distinguished based on the .");
test bool testIntegerVariable() = expectEqual(sampleInt, extractVariable(integer), "int values are converted based on the missing int");

Symbol faultyName = <"S_0,1SEC","511.0","!triggerpuls 0,1 sec.", "">;
str expectedResult = "  S_0_1SEC : BOOL ; (* 511.0 !triggerpuls 0,1 sec. *)";

test bool testInvalidChars() = expectEqual(expectedResult, extractVariable(faultyName), "Invalid chars are replaced by underscores");

str valueString = "++Lime++CodeBlock: 00143-00150 is AssignValue 00106,00107,00108,00109 to 02000,02001,02002,02003";
public AssignValue assignValue = parse(#AssignValue, valueString);

Statements expectedAssignStatements = ["(* <valueString> *)",
                                      "STP00_0 := SETP_0; (* !ingevoerde setpoint eenheden ==\>\> !setpoint 00 eenheden *)",
                                      "STP00_1 := SETP_1; (* !ingevoerde setpoint tientallen ==\>\> !setpoint 00 tientallen *)",
                                      "STP00_2 := SETP_2; (* !ingevoerde setpoint honderdtallen ==\>\> !setpoint 00 honderdtallen *)",
                                      "STP00_3 := SETP_3; (* !ingevoerde setpoint duizendtallen ==\>\> !setpoint 00 duizendtallen *)"];
                                      
test bool testAssignValues() = expectEqual(expectedAssignStatements, extractStatements(assignValue, symbols), "Checking if assign value correcty generates the code.");


str constantString = "++Lime++CodeBlock: 00024-00038 is AssignConstant 00000 to 00320,00321,00322,00323,00324,00325,00326,00327,00328,00329,00330,00331,00332,00333";
public AssignConstant constant = parse(#AssignConstant, constantString);

public SymbolTable symbols = loadSymbols("DR_TOT_3");

list[str] expectedResetBitStatements = ["ALARM01 := FALSE ; (* !spoeldruk te hoog *)",
                                        "ALARM02 := FALSE ; (* !stuurlucht gestoord *)",
                                        "ALARM03 := FALSE ; (* !stuurspanning gestoord *)",
                                        "ALARM04 := FALSE ; (* !vuilwatertank bijna leeg *)"];
                                    
list[str] expectedResetValidStatements = ["ALARM05 := TRUE ; (* !vuilwatertank leeg *)",
                                          "ALARM06 := FALSE ; (* !geleidbaarheid na spoelen *)",
                                          "ALARM07 := TRUE ; (* !filtercapaciteit te laag *)",
                                          "ALARM08 := FALSE ; (* !concentraat afvoer gestoord *)"];
                                         
test bool testBitConversionWithZero() = expectEqual(expectedResetBitStatements, evaluateAssign(symbols, "00320", 0), "resetting bits word-wise must expand to bitwyse addressing");
test bool testBitConversionWithValue() = expectEqual(expectedResetValidStatements, evaluateAssign(symbols, "00321", 5), "setting this value should set bit .1 and bit .3");

test bool allSymbolDeclarations()
{
  generateProgram("AllSymbols.EXP", <convertSymbols(symbols), extractStatements(constant, symbols)>);
  return true;
}

Symbol triggerSymbol = <"TRIGGER_510.1", "00123.0", "- BDR0B23", "R_TRIG">;

// Specific snippets
test bool testTriggerGeneration() = testGenerating("trigger.compiled");
test bool testTimerGeneration() = testGenerating("timer.compiled");

bool testSnippet(str snippetName)
{
  testGenerating("<snippetName>.compiled");
  testLoc = testFile("<snippetName>.EXP");
  generatedLoc = generatedFile("<snippetName>.EXP");
  
  //generatedLines = readFileLines(generatedLoc);  
  //targetLines = drop(indexOf(generatedLines, "END_VAR")+2, generatedLines);
  //writeToFile(generatedFile("checkResult.EXP"), targetLines);
  //generatedLoc = generatedFile("checkResult.EXP");
  return expectEqualFiles(testLoc, generatedLoc);
}

// SKIP

// Small parts
test bool testFirstOneHundred() = testGenerating("first100.compiled");
test bool testFirstTwoHundred() = testGenerating("first200.compiled");
test bool testFirstFiveHundred() = testGenerating("first500.compiled");
test bool testFirstOneThousand() = testGenerating("first1000.compiled");
test bool testFirstTwoThousand() = testGenerating("first2000.compiled");
test bool testFirstFiveThousand() = testGenerating("first5000.compiled");
test bool testFirstTenThousand() = testGenerating("first10000.compiled");
test bool testLastFiveThousand() = testGenerating("last5000.compiled");

// Complete program
test bool testCompleteProgram() = testGenerating("DR_TOT_3.compiled");

// UNSKIP

public bool useCachedFile = false ; ///< Flag bit which enables / disables the caching mechanism

bool testGenerating(str inputFile)
{
  exportedFile = generateCodesysExport(inputFile);
  return (size(exportedFile.programLines) > 0) && (size(exportedFile.declarations) > 0);
}


list[str] addedSymbols = [];
// This part should move to the CodeSysGenerator module.
// Because it used the system variable list and handles all the processing steps


/// Generates the program into the file specified and returns the Declarations and source code lines
PlcProgram generateCodesysExport(str inputFile)
{
  Tree processedTree;  
  startDuration(); 
  if(!endsWith(inputFile,".compiled"))
  {
    inputFile += ".compiled";
  } 
  procFile = generatedFile("<inputFile>.PreProc"); 
  if(exists(procFile) && true == useCachedFile)
  {
    debugPrint("Using cached file");
    processedTree = parse(#start[PC20_Compiled], readFile(procFile));
  }
  else
  {
    debugPrint("Parsing input file...");
    parsedData = parseCompiledFile(inputFile);   
    
    debugPrint("Adding system variables");
    symbols = addSystemVariables(symbols);
    debugPrint("Adding symbols");
    symbols = addUndeclaredVariables(symbols, parsedData);
    addedSymbols = unnamedSymbols(symbols);
    debugPrint("Preprocessing");
    processedTree = rewrite(parsedData);
    debugPrint("Storing result");
    writeFile(procFile, unparse(processedTree));
  }
  str outputFile = "<stripFileExtension(inputFile)>.EXP";
  program = generateFile(outputFile, processedTree, symbols);
  validateAndReport(program, inputFile);  
  printDuration("Total runtime of the tool: ");
  return program;  
}

// Simple patterns 
test bool testConvertingTrigger() = expectEqual("  TRIGGER_510_1 : R_TRIG ; (* 00123.0 - BDR0B23 *)", extractVariable(triggerSymbol), "Converting symbol with pre-filled in datatype should yield that type");
test bool testRTrigGeneration() = testSnippet("trigger");

// Symbol parsing
test bool testParsingSymbols()
{
  variables = convertSymbols(symbols);
  simplified = parseVariables(variables); 
  return true;
}

test bool testVariable() = isCorrect("unreferenced_1:BOOL;(* 1.0 !0.1 sec. puls *)", #PlcVariable);
test bool testComment() = isCorrect("(* 1.0 !0.1 sec. puls *)", #Comment);

test bool testEmptyData()
{
  SymbolTable table = [];
  return expectEqual("UNKNOWN_IDENTIFIER", retrieveVariableName("00000.1", table), "Querying an unnamed variable yields Unknown");
}

test bool testGeneratingBooleanData()
{
  SymbolTable table = [composeUnnamedDeclaration("00000.1", "BOOL")];
  return expectEqual("unnamed_0_1", retrieveVariableName("00.1", table), "Composing data results in data being added variable yields Unknown");
}

test bool testGeneratingIntegerData()
{
  SymbolTable table = [composeUnnamedDeclaration("00035", "INT")];
  return expectEqual("unnamed_35", retrieveVariableName("035", table), "Composing data results in data being added variable yields Unknown");
}  
