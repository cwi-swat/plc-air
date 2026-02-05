module testModule::LabelHandlerTests

import Compiler;
import FileLocations;
import LabelHandler;
import List;
import Parser;
import PC20Syntax;

import utility::TestUtility;

LabelDeclaration expectedDeclaration = <"L12456", "1234">;

test bool testComposing() = expectEqual(expectedDeclaration, composeLabel("L12456", 1234));

LabelList labels = [ <"L00004", "4">,<"L00006", "6">, <"L00008", "8">];

test bool testLabels() = expectEqual(labels, compile("LabelSamples.PRG").labels);

test bool testLabelFile() = compareLabels(compile("SmallPart.PRG").labels);

bool compareTotalFile() = compareLabels(compile("DR_TOT_3.PRG").labels);

bool compareLabels(LabelList labels)
{ 
  comparedList = take(size(labels), extractLabelList("DR_TOT_3.PRN"));
  return expectEqual(comparedList, labels);
}

str expectedString = "L00004:4\r\nL00006:6\r\nL00008:8";

test bool testExtractString() = expectEqual(expectedString, extractLabelString(testFile("simpleLabel.lbl")));
test bool testParsing() = isUnAmbiguous(expectedString, #start[LabelFile]);
test bool testReading() = expectEqual(labels, smallLabels(), "Reading this file should yield this list");

LabelList smallLabels() = extractLabelList(testFile("simpleLabel.lbl"));

test bool testKnownLabelLine() = expectEqual(4, getProgramLine(labels, "L00004"), "L00004 corresponds to program line 4");
test bool testUnknownLabelLine() = expectEqual(-1, getProgramLine(labels, "Non-existing"), "non-existing label returns -1");
test bool testUnlabeledLine() = expectEqual(8, getProgramLine(labels, "00008"), "label without L should be passed without replacing");
