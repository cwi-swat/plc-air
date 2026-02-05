module Decorator

import DataTypes;
import FileLocations;
import IO;
import List;
import String;

import vis::Figure;
import vis::Render;

import utility::Debugging;
import utility::FileUtility;
import utility::MathUtility;
import utility::StringUtility;

Figure generateLineFigure(str colorName, str fontColorName, str sourceInfo) = box(getText(fontColorName, sourceInfo), [size(50), fillColor(color(colorName))]); 
Figure getText(str fontColorName, str textToDisplay) = text("  <textToDisplay>", align(0,0), fontSize(20), fontColor(fontColorName));

void lastStats() = printStats(readPatterns());

void printStats(PatternMap patterns)
{
  boxes = [];
  maxCount = 0 ;
  for(pattern <- patterns)
  {
    maxCount = max(patterns[pattern], maxCount);    
  }
  for(<count, pattern> <- toList(patterns))
  { 
    scaling = (count * 1.00) / maxCount ;
    debugPrint("Pattern: ", "<pattern> : <count> =\> Scale: <scaling>");
    boxes += box(text(" <pattern> (<count>)"), hshrink(scaling), vsize(20), fillColor("Lime"));
  }
  render(vcat(boxes, std(left())));
  storePatterns(patterns);
}

void storePatterns(PatternMap patterns) = writeToFile(generatedFile("patterns.plist"), [ "<pattern>,<patterns[pattern]>" | pattern <- patterns ]);

PatternMap readPatterns()
{
  patterns = ();
  for(line <- readFileLines(generatedFile("patterns.plist")))
  {
    lineContent = split(",", line);
    patterns[lineContent[0]] = parseInt(lineContent[1]);
  }
  return patterns;
}

