module utility::lang::symbol::Syntax

layout LS = [\ \t \n \r]* !>> [\ \t \n \r];

start syntax NewSymbolTable = NewSymbolDeclaration* symbols;

syntax NewSymbolDeclaration
  = named: NewLabel name "=" NewAddress addr NewComment? comment 
  | unnamed: "=" NewAddress addr NewComment? comment
  ;
  
lexical NewLabel = [a-zA-Z_] [a-zA-Z0-9_,]* !>> [a-zA-Z0-9_,];

lexical NewAddress
  = bit: [0-9]+ "." [0-3]
  | integer: [0-9]+ !>> [0-9]
  ;
  
lexical NewComment
  = "!" ![\n]* $;