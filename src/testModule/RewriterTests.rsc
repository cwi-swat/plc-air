module testModule::RewriterTests

import EcbHandler;
import Parser;
import ParseTree;
import PC20Syntax;
import Rewriter;

import utility::InstructionUtility;
import utility::TestUtility;

str expectedPrefix = "++Lime++CodeBlock: 00024-00038 is " ;
str expectedBlock = "<expectedPrefix>AssignConstant 00000 to 00320,00321,00322,00323,00324,00325,00326,00327,00328,00329,00330,00331,00332,00333";

public LogicExpression someLogic = parse(#LogicExpression, "00220.0 OR 00220.1 ");

str sampleBooleanExpression = 
"++Blue++CodeBlock: 00039-00042 is AssignBooleanExpression NOT 00000.1 to 12345.1 ";

str sampleMultipleBooleanExpression = 
"++Blue++CodeBlock: 00039-00042 is AssignBooleanExpression NOT 00000.1 to 12345.1 43234.3 ";

str sampleLargeBooleanExpression = 
"++Yellow++CodeBlock: 04824-04902 is AssignBooleanExpression 00220.0 OR 00220.1 OR 00220.2 OR 00220.3 OR 00221.0 OR 00221.1 OR 00221.2 OR 00221.3 OR 00222.0 OR 00222.1 OR 00222.2 OR 00222.3 OR 00223.0 OR 00223.1 OR 00223.2 OR 00223.3 OR 00224.0 OR 00224.1 OR 00224.2 OR 00224.3 OR 00225.0 OR 00225.1 OR 00225.2 OR 00225.3 OR 00226.0 OR 00226.1 OR 00226.2 OR 00226.3 OR 00227.0 OR 00227.1 OR 00227.2 OR 00227.3 OR 00228.0 OR 00228.1 OR 00228.2 OR 00228.3 OR 00229.0 OR 00229.1 OR 00229.2 OR 00229.3 OR 00230.0 OR 00230.1 OR 00230.2 OR 00230.3 OR 00231.0 OR 00231.1 OR 00231.2 OR 00231.3 OR 00232.0 OR 00232.1 OR 00232.2 OR 00232.3 OR 00233.0 OR 00233.1 OR 00233.2 OR 00233.3 OR 00234.0 OR 00234.1 OR 00234.2 OR 00234.3 OR 00235.0 OR 00235.1 OR 00235.2 OR 00235.3 OR 00236.0 OR 00236.1 OR 00236.2 OR 00236.3 OR 00237.0 OR 00237.1 OR 00237.2 OR 00237.3 OR 00238.0 OR 00238.1 OR 00238.2 OR 00238.3 OR 00239.0 OR 00239.1 to 00076.1 ";  

public AssignBooleanExpression booleanExpression = parse(#AssignBooleanExpression, sampleBooleanExpression);
public AssignBooleanExpression multipleBooleanExpression = parse(#AssignBooleanExpression, sampleMultipleBooleanExpression);
public AssignBooleanExpression largeBooleanExpression = parse(#AssignBooleanExpression, sampleLargeBooleanExpression);

public FetchConstantInstruction sampleFetch = parse(#FetchConstantInstruction, "00051 00024 12 00000 \r\n");
public WriteValue sampleWrite = parse(#WriteValue, "++++CodeBlock: 00025-00038 is WriteValue 00320,00321,00322,00323,00324,00325,00326,00327,00328,00329,00330,00331,00332,00333");

test bool testComposingPrefix() = expectEqual(expectedPrefix, composeEcbPrefix("Lime", composeSourceRange(sampleFetch, sampleWrite)));

test bool testComposingRange() = expectEqual(<24, 38>, composeSourceRange(sampleFetch, sampleWrite));
test bool testComposingValue() = expectEqual("00000", getAddress(sampleFetch));



//public LogicCondition logicCondition = parse(#LogicCondition, "++++CodeBlock: 00025-00027 is LogicCondition ");
test bool testLogicBlock()
{
  logicTree = parseCompiledFile("logicCondition.compiled");
  logicTree = rewrite(logicTree);
  return true;
}


