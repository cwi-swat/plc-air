module utility::lang::symbol::AST


data SymbolTable
  = symbolTable(list[Label] addrs);
  
data Label(str comment = "")
  = named(str name, Address addr)
  | unnamed(Address addr)
  ;
  
data Address
  = bit(int address, int bitOffset)
  | full(int address)
  ;