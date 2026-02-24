module utility::lang::symbol::Implode

import utility::lang::symbol::AST;
import utility::lang::symbol::Syntax;

SymbolTable implode(start[SymbolTable] source) 
  =  symbolTable([ implode(d) | SymbolDeclaration d <- source.top.symbols]);
  
 
Label implode((SymbolDeclaration)`<Label name> = <Address addr> <Comment? comment>`) {
  nm = "<name>";
  addr = implode(addr);
  if (Comment c <- comment) {
    return named(nm, addr, comment = "<c>");
  }
  return named(nm, addr);
}