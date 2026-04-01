module lang::plc::pc20::SymbolTableParser

import lang::symbol::Implode;
import lang::symbol::Syntax;

import lang::plc::pc20::FileLocations;
import IO;

import ParseTree;

start[NewSymbolTable] parseSymbols()
    = parse(#start[NewSymbolTable], readFile(testFile("DR_TOT_3.SYM")));

public start[NewSymbolTable] symbolTree = parseSymbols();
