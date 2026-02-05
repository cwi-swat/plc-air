module Parser

extend ParserBase;

import PC20Syntax;
import Stripper;

import utility::ListUtility;


public int parseSourceFile() = parsePdsSource("DR_TOT_3.PRG");
public int parseSymbolTable() = parsePdsSymbols("DR_TOT_3.SYM");

public int parsePdsSource(str fileName) = parseFile(fileName, #start[PC20]);
public int parsePdsSymbols(str fileName) = parseFile(fileName, #start[PlcSymbols]);

public Tree generateSourceTree(str fileName) = doParse(fileName, #start[PC20]);
public Tree generateSymbolTree(str fileName) = doParse(fileName, #start[PlcSymbols]);

public Tree generateDisassembly(str fileName) = doParse(fileName, #start[PC20_Assembled]);

Tree parseCompiledFile(str fileName) = parseText(joinList(clipAndSave(compiledFile(fileName)))+"\r\n", #start[PC20_Compiled]);