module testModule::CompilerTests

import Compiler;
import DateTime;
import FileLocations;
import IO;
import List;
import Parser;
import PC20Syntax;
import String;
import Stripper;
import Environment;

import utility::Debugging;
import utility::StringUtility;
import utility::TestUtility;

import testModule::DataModule;

test bool testEmptyInstruction() = expectEqual("00000                   ", formatLine(0));
test bool testIntAddressFormat() = expectEqual("12345 54321 99 67890    ", formatLine(12345, 54321, 99, "67890")); 
test bool testRealAddressFormat() = expectEqual("00010 00000 15 00023.1  ", formatLine(10, 0, 15, "23.1"));
test bool testFormatSize() = expectEqual(24, size(formatLine(0,0,0,"0")));

test bool testSingleNop() = expectEqual([padLength("00000 00000 00", 24)], handleNop(1, 0, 0));

list[str] multipleNop = [padLength("00010 00005 00",24), padLength("00010 00006 00", 15), padLength("00010 00007 00",15)];

test bool testMultipleNop() = expectEqual(multipleNop, handleNop(3, 10, 5));
test bool testMultipleNopParsed() = expectEqual(multipleNop, handleNop(parseText("NOP 3", #Expression), 10, 5));

test bool testSimplePair()
{
  compile("Sample.PRG", symbols);
  return true;
}

test bool testSimpleLabel() = handleCompare(compile("SimpleLabel.PRG", symbols).compiledLines);
test bool testComparing() = handleCompare(compile("LabelOffset.PRG", symbols).compiledLines);
test bool testFirstOneHundred() = handleCompare(compile("FirstOneHundred.PRG", symbols).compiledLines);
test bool testNopBlankLine() = expectEqual(readFileLines(testFile("BlankLineComparison.PRN")), compile("BlankLineIssue.PRG", symbols).compiledLines);   

// SKIP

test bool testCompileFull()
{  
  startDuration();
  result = handleCompare(compile("DR_TOT_3.PRG", symbols).compiledLines);
  printDuration("Compiling of total file.");
  return result;  
}

test bool testFirstOneHundredWithSources() = handleCompareWithSources(compileWithSourcesToFile("FirstOneHundred.PRG", symbols).compiledLines);
test bool testSampleSuite() = expectEqual(readFileLines(testFile("compileWithSource.PRN")), compileWithSourcesToFile("compileWithSource.PRG", symbols).compiledLines);

test bool testCompileFullWithSources()
{
  startDuration();
  result = handleCompareWithSources(compileWithSources("DR_TOT_3.PRG", symbols).compiledLines);
  printDuration("Compiling including original sources.");
  return result;
}

// UNSKIP

list[str] fetchResult = ["00001 00000 12 00001    ", "00002 00001 12 00002    "];

test bool testFetching() = expectEqual(fetchResult, compile("FetchConstant.PRG", symbols).compiledLines);

bool handleCompare(list[str] compiledLines)
{
  referenceData = take(size(compiledLines), clipAndSave(testFile("DR_TOT_3.PRN")));
  return expectEqual(referenceData, compiledLines);
}

bool handleCompareWithSources(list[str] compiledLines)
{
  referenceData = take(size(compiledLines), readFileLines(testFile("DR_TOT_3.PRN")));
  return expectEqual(referenceData, compiledLines);
}

test bool testRelativeJumpJFRF() = expectTrue(isRelativeJump("00196 00200 30 00013    "), "JFRF is a relative jump forward");
test bool testRelativeJumpJBRF() = expectTrue(isRelativeJump("00196 00200 29 00013    "), "JBRF is a relative jump forward");
test bool testRelativeJumpSTRB() = expectFalse(isRelativeJump("12999 11201 10 00374.3  "), "STRB is no relative jump");  
test bool testRelativeJumpNop() = expectFalse(isRelativeJump("13000 11206 00 "), "NOP is no relative jump");

test bool testProgramLine0() = expectEqual(0, getProgramLine("00008 00000 31 00003    "), "Should return 0");
test bool testProgramLine200() = expectEqual(200, getProgramLine("00196 00200 29 00013    "), "Should return 200");

test bool testReplaceJump() = expectEqual("00196 00200 29 00013    ", replaceLabel("00196 00200 29 L00213 ", "00013"), "Label should be replaced by jump size");

test bool testLabelName() = expectEqual("L00213", labelName("00196 00200 29 L00213 "), "labelName should extract a trimmed label");

test bool testInstructionNumber29() = expectEqual(29, instructionNumber("00196 00200 29 L00213 "));
test bool testInstructionNumber31() = expectEqual(31, instructionNumber("00008 00000 31 00003    "));

list[str] expectedJumpResult = ["00001 00000 29 00013    ", "00002 00001 30 01234    ","00003 00002 24 00100    ", "00004 00003 25 00008    "];

test bool testUnlabeledJump() = expectEqual(expectedJumpResult, compile("unlabeledJumps.PRG").compiledLines); 

test bool testSampleJumpDestination() = expectEqual("00013", jumpDestination("00001 00000 29 00013    "));
test bool testAnotherSampleJumpDestination() = expectEqual("84562", jumpDestination("00004 00003 25 84562    "));
test bool testInvalidJumpDestination() = expectEqual("ERROR", jumpDestination("Nonsense"));

str sourceLine = "\tOR\tREG0B61";

str expectedComposition = "\tOR\tREG0B61\t!regeneratie fase 61";
str compiledLine = "06730 05817 18 00400.1  ";

test bool testJumpDestination() = expectEqual("00400.1", jumpDestination(compiledLine), "jumpDestination filters address from line");
test bool testSymbolComments() = expectEqual(expectedComposition, composeSourceLine(sourceLine, symbols), "Composing sources should yield compiled line with comment obtained from sybmol table");

test bool testJumpDestinationSource() = expectEqual("REG0B61", jumpDestination(sourceLine), "Source line should return REG0B61");

str compositionNoComment = "\tAND\tKNIPPER" ;
str singleSource = "\tAND\tKNIPPER";

test bool testSymbolWithoutComment() = expectEqual(compositionNoComment, composeSourceLine(singleSource, symbols), "Composing without comment should yield the same input");

str nopSource = "\tNOP\t110";

test bool testNopComment() = expectEqual(nopSource, composeSourceLine(nopSource, symbols));


