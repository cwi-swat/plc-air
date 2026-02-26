module lang::plc::pc20::SymbolTableParser

import lang::symbol::Implode;
import lang::symbol::Syntax;

import lang::plc::pc20::FileLocations;
import IO;

import ParseTree;

start[SymbolTable] parseSymbols() = parse(#start[SymbolTable], readFile(testFile("DR_TOT_3.SYM")));

public start[SymbolTable] symbolTree = parseSymbols();