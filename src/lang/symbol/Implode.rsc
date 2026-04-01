@synopsis{Conversion from syntax tree to AST for symbol tables}
@pitfalls{
* this is not working at the moment; seems the grammar was improved but the imploder is not finished yet.  
}
module lang::symbol::Implode

import lang::symbol::AST;
import lang::symbol::Syntax;
import ParseTree;

SymbolTable implode(start[NewSymbolTable] source)
    = symbolTable([implode(d) | NewSymbolDeclaration d <- source.top.symbols]);

Label implode(
    (NewSymbolDeclaration)`<NewLabel name> = <NewAddress addr> <NewComment? comment>`) {
    nm = "<name>";
    addr = implode(addr);
    if (NewComment c <- comment) {
        return named(nm, addr, comment = "<c>");
    }
    return named(nm, addr);
}
