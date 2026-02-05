module SymbolTableParser

import utility::lang::symbol::Implode;
import utility::lang::symbol::Syntax;

import FileLocations;
import IO;

import ParseTree;

start[SymbolTable] parseSymbols() = parse(#start[SymbolTable], readFile(testFile("DR_TOT_3.SYM")));

public start[SymbolTable] symbolTree = parseSymbols();