module ParserBase

import analysis::grammars::Ambiguity;
import IO;
import FileLocations;
import ParseTree;
import vis::ParseTree;
import String;

import utility::Debugging;
import utility::FileUtility;

alias sourceLine = tuple[int line, str text] ; 

public int parseFile(str fileName, &T syntaxType) = parseFile(testFile(fileName), syntaxType);
public int parseFile(loc fileName, &T syntaxType)  
{
  int parseResult = 0;
  try 
  {
    if(/amb(_) := doParse(fileName, syntaxType))
    {
      parseResult = 1;      
      list[sourceLine] ambiguousLines = findAmbiguousLines(fileName, syntaxType);
      loc ambiguityFile = generatedFile("lastAmbiguity");
      writeFile(ambiguityFile, "");      
      for(line <- ambiguousLines)
      {
        addToFile(ambiguityFile, "<line.text>\r\n"); 
        debugPrint("<line.line>:<line.text>");        
        iprintln(diagnose(parseText(line.text, syntaxType)));
      }   
    }
    else
    {
      debugPrint("--- SUCCESS on parsing <fileName> ---");
    }     
  }
  catch: 
  {
    debugPrint("--- ERROR while parsing <fileName> ---");
    parseResult = 2 ;        
  }  
  return parseResult;
}

// file utilities
list[sourceLine] findAmbiguousLines(str fileName, &T syntaxType) = [ n | n <- readFile(fileName), isAmbiguous(n.text, syntaxType)];
list[sourceLine] readFile(str fileName) = [ <n, fileLines(fileName)[n-1]> | n <- [0 .. fileSize(fileName)]];
int fileSize(str fileName) = size(fileLines(fileName));
list[str] fileLines(str fileName) = readFileLines(testFile(fileName));

public bool isCorrect(loc file, &T syntaxType) = 0 == parseFile(file, syntaxType);
public bool isCorrect(str textLine, &T syntaxType) = isParseable(textLine, syntaxType) && isUnAmbiguous(textLine, syntaxType);
public bool isParseable(str textLine, &T syntaxType)
{
  try
  {
    parseText(textLine, syntaxType);    
  }
  catch:
  {
    return false;
  }
  return true;
}

public bool isUnAmbiguous(Tree inputTree) = false == isAmbiguous(inputTree);
public bool isAmbiguous(Tree inputTree) = /amb() := inputTree ; 
public bool isUnAmbiguous(str textLine, &T syntaxType) = false == isAmbiguous(textLine, syntaxType);
public bool isAmbiguous(str textLine, &T syntaxType)
{
  try
  {
    return /amb(_) := parseText(textLine, syntaxType);
  }
  catch:
  {
    return false;
  }  
}

// render functions (trees)
void renderFile(str fileToRender, &T syntaxType) = renderParsetree(doParse(fileToRender, syntaxType));

Tree doParse(str fileName, &T syntaxType) = doParse(testFile(fileName), syntaxType);
Tree doParse(loc fileLoc, &T syntaxType) = parseText(readFile(fileLoc), syntaxType);
Tree parseText(str textLine, &T syntaxType) = parse(syntaxType, textLine);
