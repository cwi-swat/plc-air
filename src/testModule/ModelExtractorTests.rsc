module testModule::ModelExtractorTests

import FileLocations;
import ModelExtractor;
import Parser;
import Stripper;

import utility::Debugging;
import utility::FileUtility;
import utility::ListUtility;
import utility::TestUtility;

import IO;
import ParseTree;
import PC20Syntax;

import vis::Figure;
import vis::ParseTree;
import vis::Render;

bool showCommentTree() = renderParsetree(parseComments());
bool showCommentFigure() = highLightSources(parseComments());
bool showTotalFigure() = showFigure("DR_TOT_3.compiled");
bool showFirst50Figure() = showFigure("first50.compiled");
bool showFirst100Figure() = showFigure("first100.compiled");
bool showFirst200Figure() = showFigure("first200.compiled");
bool showFirst500Figure() = showFigure("first500.compiled");
bool show1kSample() = showFigure("first1000.compiled");
bool showSamples() = showFigure("sampleIssues.compiled");

test bool testSamples() = testFigures(true, "sampleIssues.compiled");
test bool testEventBug() = testFigures(false, "eventBug.compiled" );


// Specific implementation patterns
bool showTrigger() = showFigure("trigger.compiled");
bool showLogic() = showFigure("logicCondition.compiled");

bool testFigures(bool shouldBeEmpty, str fileName)
{
  displayExtractedBlocks = false;
  result = shouldBeEmpty == isEmpty(generateFigures(fileName));
  displayExtractedBlocks = true;
  if(false == result)
  {
    showFigures(generateFigures(fileName));    
  }  
  return result;
}

test bool testComments() = isUnAmbiguous(parseComments());
test bool testSample() = isUnAmbiguous(parseCompiledFile("first50.compiled"));

// SKIP
test bool testTotal() = isUnAmbiguous(parseTotalFile());
// UNSKIP
test bool testFirst500() = isUnAmbiguous(parseCompiledFile("first500.compiled"));
Tree parseComments() = parseCompiledFile("comments.compiled");
Tree parseTotalFile() = parseCompiledFile("DR_TOT_3.compiled");

void showTree(str fileName) = renderParsetree(parseCompiledFile(fileName));
bool showFigure(str fileName) = highLightSources(parseCompiledFile(fileName), readFileLines(compiledFile(fileName)));


void generateInstructions(str fileName)
{
  instructions = instructionList(readFileLines(compiledFile(fileName)));
  instructions = padList("", instructions, "\r\n");
  writeFile(generatedFile("<stripFileExtension(fileName)>.instructions"), instructions);
}

test bool testSmallModel() = expectTrue(validateModelFile("first100.compiled"), "Sample of original file is valid");
test bool testInvalidModel() = expectFalse(validateModelFile("sampleIssues.compiled"), "File with code snippets should result in several errors");

// SKIP

test bool testCompleteModel() = expectTrue(validateModelFile("DR_TOT_3.compiled"), "Total file check");

// UNSKIP
bool validateModelFile(str fileName) = examineModelCompleteness(generateFigures(parseCompiledFile(fileName), []));


