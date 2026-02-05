module PC20Syntax

start syntax PC20_Assembled = AssembledInstruction+;

syntax AssembledInstruction = FileHeader
                            | InstructionLine
                            | FileEnd                           
                            ;
                            
lexical FileHeader = "S0030000FC" NewLine ;
lexical FileEnd = "S9030000FC" NewLine ;

lexical InstructionLine = LineHeader Instruction+ Checksum NewLine ; 
                        
lexical LineHeader = "S1" InstructionAmount PlcAddress "0" ;
lexical PlcAddress = HexChar HexChar HexChar ;
lexical InstructionAmount = HexChar HexChar ;  
                           
lexical Instruction = HexChar HexChar HexChar HexChar ;
lexical Checksum = HexChar HexChar ;

lexical HexChar = [0-9A-F];                         

start syntax PC20_Compiled = CodeBlock ;

syntax CodeBlock = CompiledInstruction*;

syntax CompiledInstruction = empty:EmptyLine
                           | ExecuteInstruction      
                           | AssignBit   
                           | AssignBitInverted                  
                           | ConditionInstruction                                                    
                           | SkipInstruction                            
                           | io:IOInstruction
                           | SingleInstruction // Instruction without address
                           | ComposedCodeBlock              
                           | Error            
                           ;
                           
lexical ComposedCodeBlock = ReadValue
                           | WriteValue
                           | CompareValue
                           | CompareWithResult
                           | NopBlock
                           | AssignValue
                           | AssignConstant
                           | CompareConstant
                           | OtherBlock
                           | AndEqual
                           | LogicCondition
                           | TriggerBlock
                           | TriggeredAssignBoolean
                           | BitTrigger
                           | AssignBooleanExpression
                           | IOSynchronization    
                           | IfBlock  
                           | QuickJumpOut     
                           | BlankAndNot    
                           | DecrementCounter 
                           | SetBit
                           | ResetBit
                           | ComposeValue
                           | IOJump
                           | ReadConstant
                           | PartialRead
                           | PartialWrite
                           | ComposedWrite
                           | PartialTrigger
                           | TriggeredTimer
                           | InitCall // End of the program, returns it back to ProgramCount N, where everything BEFORE N is only executed ONCE
                           ;

lexical Error = "ERROR-PARSING-BLOCK";               

// Speed optimizations, low level
// Will be added as a ; (* <Name> *) to the generated code
lexical QuickJumpOut = EcbPrefix "QuickJumpOut";
lexical BlankAndNot = EcbPrefix "BlankAndNot";

// Special lexicals
lexical ComposedWrite = EcbPrefix "ComposedWrite " (PartialReadContent"|")+ " to " PartialWriteContent;
lexical PartialRead = EcbPrefix "PartialRead " PartialReadContent;
lexical PartialWrite = EcbPrefix "PartialWrite " PartialWriteContent;
lexical PartialReadContent = AddressRange " by " (TriggerExpression | LogicExpression);
lexical PartialWriteContent = AddressRange " by " LogicExpression;

lexical PartialTrigger = EcbPrefix "PartialTrigger" TriggerTarget " and " TriggerResult;        
lexical TriggeredAssignBoolean = EcbPrefix "TriggeredAssignBoolean " TriggerExpression "=\> " LogicExpression "to " BitAddressRange ;
lexical TriggeredTimer = EcbPrefix "TriggeredTimer " TriggerExpression "counts " CounterContent ;

lexical DecrementCounter = EcbPrefix "DecrementCounter " CounterContent ;
lexical CounterContent = AddressRange " =\> " BitAddress;
lexical ComposeValue = EcbPrefix "ComposeValue" BitAddressRange " =\> " WordAddress;

lexical InitCall = EcbPrefix "InitCall at " FiveDigits;
                                  
lexical ReadValue = EcbPrefix "ReadValue " AddressRange ;
lexical WriteValue = EcbPrefix "WriteValue " AddressRange ;
lexical SetBit = EcbPrefix "SetBit " BitAddress;
lexical ResetBit = EcbPrefix "ResetBit " BitAddress;
lexical CompareValue = EcbPrefix "CompareValue " CompareStatement;
lexical CompareWithResult = EcbPrefix "CompareWithResult "CompareStatement " =\> " WordAddress;
lexical AssignValue = EcbPrefix "AssignValue " SourceAddressRange " to " TargetAddressRange ;
lexical ReadConstant = EcbPrefix "ReadConstant " ConstantValues ; 
lexical AssignBooleanExpression = EcbPrefix "AssignBooleanExpression " LogicExpression "to " BitAddressRange ;
lexical IOSynchronization = EcbPrefix "IOSynchronization " FiveDigits " to " FiveDigits;
lexical IOJump = EcbPrefix "IOJump";
lexical AssignConstant = EcbPrefix "AssignConstant " ConstantValues " to " AddressRange ;
lexical CompareConstant = EcbPrefix "CompareConstant " ConstantValue " = " WordAddress "=\>" BitAddress;
lexical AndEqual = EcbPrefix "AndEqual " SourceAddressRange " to " TargetAddressRange " =\> " BitAddress;
lexical IfBlock = EcbPrefix "IfBlock " LogicExpression "size " JumpSize;
lexical LogicCondition = EcbPrefix "LogicCondition " LogicExpression;
lexical OtherBlock = EcbPrefix Description;
lexical NopBlock = EcbPrefix "NopBlock" ;
lexical TriggerBlock = EcbPrefix "TriggerBlock " TriggerExpression;

lexical BitTrigger = EcbPrefix "BitTrigger" TriggerTarget " by " TriggerExpression ;
lexical TriggerTarget = BitAddress ;
lexical TriggerExpression = TriggerResult "=\> " LogicExpression ;
lexical TriggerResult = BitAddress;

lexical CompareStatement = (SourceAddressRange | (SourceAddressRange " to " TargetAddressRange));
lexical SourceAddressRange = AddressRange;
lexical TargetAddressRange = AddressRange;
lexical LogicExpression = LogicStatement+ ;
lexical LogicStatement = LogicOperation? BitAddress ;
lexical LogicOperation = "NOT " | "AND " | "OR " | "AND NOT " | "OR NOT " ;
lexical JumpSize = FiveDigits;

lexical EcbPrefix = ColorName "CodeBlock: " SourceLineRange " is ";
lexical SourceLineRange = FiveDigits "-" FiveDigits ; 
lexical ColorName = "++" [a-zA-Z0-9\ ]* !>> [a-zA-Z0-9\ ] "++" ; // * * added to remove ambiguity
lexical ConstantValue = FiveDigits ; 
lexical ConstantValues = FiveDigits | (FiveDigits ",")+ FiveDigits;
lexical AddressRange = FiveDigits | (FiveDigits ",")+ FiveDigits;
lexical BitAddressRange = BitAddress+ !>> BitAddress;
lexical Description = "--" [a-zA-Z0-9\ ]* !>> [a-zA-Z0-9\ ] "--"; // -- -- added to remove ambiguity

lexical ExecuteInstruction =  assign:AssignInstruction                            
                            | FetchInstruction
                            | FetchConstantInstruction 
                            | StoreInstruction    
                            | jump:JumpInstruction
                            | CountInstruction
                            | CalcInstruction                                                                                
                            ;

lexical ConditionInstruction = LogicInstruction
                             | EventInstruction
                             | CompareInstruction
                             ;

// Lowest level instructions
lexical EmptyLine = SourceLineNumber NewLine ;

// These must all be present in the switch case                      
lexical SkipInstruction = SourcePrefix "00" WhiteSpace NewLine;                        
lexical EventInstruction = SourcePrefix "01" WhiteSpace BitAddress NewLine ;                        
lexical AssignInstruction = SourcePrefix ( "08" | "09" ) WhiteSpace BitAddress NewLine ;
lexical AssignBit = SourcePrefix "02" WhiteSpace BitAddress NewLine;
lexical AssignBitInverted = SourcePrefix "03" WhiteSpace BitAddress NewLine;
lexical StoreInstruction = StoreBit | StoreValue ;
lexical StoreBit = SourcePrefix "10" WhiteSpace BitAddress NewLine;
lexical StoreValue = SourcePrefix "14" WhiteSpace WordAddress NewLine;
lexical CountInstruction = SourcePrefix ("06" | "07") WhiteSpace WordAddress NewLine;
lexical FetchInstruction = SourcePrefix ("11" | "13" ) WhiteSpace (BitAddress | WordAddress) NewLine;
lexical FetchConstantInstruction = SourcePrefix "12" WhiteSpace WordAddress NewLine;
lexical CompareInstruction = SourcePrefix "15" WhiteSpace WordAddress NewLine ;
lexical LogicInstruction = AndInstruction | SourcePrefix ( "17" | "18" | "19") WhiteSpace BitAddress NewLine;
lexical AndInstruction = SourcePrefix "16" WhiteSpace BitAddress NewLine;                                   
lexical CalcInstruction = SourcePrefix ("20" | "21" | "22" | "23" ) WhiteSpace (BitAddress | WordAddress) NewLine;
lexical JumpInstruction = SourcePrefix ("24" | "25" | "29" | "30") WhiteSpace WordAddress NewLine;
lexical IOInstruction = SourcePrefix ( "31" | "27" ) WhiteSpace WordAddress NewLine;
lexical SingleInstruction = SourcePrefix "26" WhiteSpace NewLine ;

lexical SourcePrefix = SourceLineNumber ProgramLineNumber ;

lexical ProgramLineNumber = FiveDigits WhiteSpace ;
lexical SourceLineNumber = FiveDigits WhiteSpace;

lexical BitAddress = FiveDigits BitValue WhiteSpace;
lexical BitValue = "." [0-3] ;
lexical WordAddress = FiveDigits WhiteSpace;

lexical FiveDigits = [0-9][0-9][0-9][0-9][0-9] ;


// This block defines the syntax for a labellist
start syntax LabelFile = LabelLocation+ ;

lexical LabelLocation = ComposedLabel
                      | NewLine
                      ;
                      
lexical ComposedLabel = Label ":" LineNumber NewLine? !>> "\r" ;

// This block defines the syntax for a symbol table

start syntax PlcSymbols = PlcSymbol+ ;

syntax PlcSymbol = Declaration
                 | UnnamedDeclaration
                 | PdsComment
                 | NewLine           
                  ; 

lexical Declaration = VariableName WhiteSpace+ "=" Address ;
lexical NewLine = "\r\n";
lexical UnnamedDeclaration = "=" Address ;

// This block defines the syntax for PDS5 source files

start syntax PC20 = Expression+ ;

syntax Expression = SingleLabel 
                    | Instruction 
                    | PdsComment                                     
                    | NewLine
                    ;
                    
public layout LS = [\ \t]* !>> [\ \t] ;
lexical PdsComment = "!" [*_a-zA-Z0-9=./,\ \t\"+?()\'|\>\<]* !>> [*_a-zA-Z0-9=./,\ \t\"+?()\'|\>\<] ;
lexical WhiteSpace = [\t\ ]+ !>> [\t\ ];

lexical SingleLabel = Label;
lexical Label = "L" + [0-9][0-9][0-9][0-9][0-9] ;
lexical ProgramLine = [0-9]+ !>> [0-9] ; 
                        
lexical Instruction = AmountInstruction
                    | IdentifierInstruction
                    | PlainInstruction 
                    | NopInstruction
                    | LabelInstruction
                    ;
                     
lexical AmountInstruction = AmountInstructionName + Amount;
lexical IdentifierInstruction = IdentifierInstructionName + Identifier ;

syntax LabelInstruction = LabelInstructionName + (Label | ProgramLine) ;

lexical PlainInstruction = ret:"RET" ;
lexical NopInstruction = noOperation:"NOP" + Amount?; // 00 No operation
                                     
lexical AmountInstructionName = fetchConstant:"FTCHC" ; // 12 Fetch Constant

lexical IdentifierInstructionName = risingEdge:"TRIG"   // 01 Rising Edge Detection
                                  | equal:"EQL"    // 02 "EQUALS"
                                  | notEqual:"EQLNT"  // 03 "NOT" Equal
                                  | shiftLeft:"SHFTL"  // 04 Shift "LEFT"
                                  | shiftRight:"SHFTR"  // 05 Shift "RIGHT"
                                  | countDown:"CNTD"   // 06 Count "DOWN" 
                                  | countUp:"CNTU"   // 07 Count "UP"
                                  | resetBit:"SET0"   // 08 Disable bit
                                  | setBit:"SET1"   // 09 Enable bit
                                  | storeBit:"STRB"   // 10 Store Bt
                                  | fetchBit:"FTCHB"  // 11 Fetch Bit                                  
                                  | fetchDigit:"FTCHD"  // 13 Fetch Digit
                                  | storeDigit:"STRD"   // 14 Store Digit
                                  | compare:"COMP"   // 15 Compare                 
                                  | and:"AND"    // 16 "AND"
                                  | andNot:"ANDNT"  // 17 "AND" "NOT"
                                  | or:"OR"     // 18 "OR"
                                  | orNot:"ORNT"   // 19 "OR" "NOT"
                                  | add:"ADD"    // 20 "ADD"
                                  | subtract:"SUBTR"  // 21 "SUBTRACT"
                                  | multiply:"MULT"   // 22 "MULTIPLY"
                                  | divide:"DIV"    // 23 "DIVIDE"    
                                  | end:"END"    // 27 End of "IO" handling
                                  | lastInputOutput:"LSTIO"  // 31 La"ST" Input or Output                                  
                                  ;

lexical LabelInstructionName = subRoutineAbsoluteFalse:"JSAF"   // 24 Jump to Subroutine, Absolute FALSE
                             | subRoutineAbsoluteTrue:"JSAT"   // 25 Jump to Subroutine, Absolute TRUE
                             | backwardRelativeFalse:"JBRF"   // 29 Jump Backwards, Relative FALSE
                             | forwardRelativeFalse:"JFRF"   // 30 Jump Forwards, Relative FALSE                             
                             ;
                                   
syntax Identifier = Address | Variable;
syntax Address = BitAddress | WordAddress ; 
lexical BitAddress = WhiteSpace+[0-9]+ !>> [0-9] "." [0-7];
lexical WordAddress = WhiteSpace+[0-9][0-9][0-9][0-9] ;
lexical Variable = WhiteSpace+ VariableName ;
lexical VariableName = [A-Z][A-Z_0-9,]* !>> [A-Z_0-9,]+ !>> [A-Z_0-9] ;
lexical Amount = WhiteSpace+[0-9]+ !>> [0-9]; 
lexical LineNumber = WhiteSpace* !>> WhiteSpace [0-9]+ !>> [0-9] ; 