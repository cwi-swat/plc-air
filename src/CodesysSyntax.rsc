module CodesysSyntax

import CodesysTypes;
import ParseTree;

import utility::ListUtility;

start syntax CodesysVariables = PlcVariableList;

syntax PlcVariableList = PlcVariable* ;

public layout LS = [\ \t]* !>> [\ \t] ;

lexical PlcVariable = Name DeclarationAndComment | PlcArray;
lexical PlcArray = Name "_" Numeric "_" Numeric WS ":" WS "ARRAY[" Numeric ".." Numeric "] OF" WS Type WS ";" WS Comment NewLine?;
lexical DeclarationAndComment = WS ":" WS Type WS ";" WS Comment NewLine?;
lexical Name = TextualName
             | UnreferencedName
             | ValveInputs
             | ValveOutputs
             | PumpOutput
             | TimerPulse
             | IntegerName   
             | IndexedName                   
             ;

lexical UnreferencedName = "unreferenced_" Numeric ;
lexical TextualName = (( [A-Z][A-Z0-9]+ ) | ([A-Z]+ "_"[A-Z]+))  !>> [A-Za-z];
lexical IntegerName = IntName Numeric "_" [0-3] ;
lexical IntName = [A-Z][A-Z][A-Z]+ ;
lexical IndexedName = UpperCaseChars "_" Numeric;
lexical UpperCaseChars = [A-Z]+ ;
lexical Numeric = [0-9]+ !>> [0-9] ;
lexical ValveInputs = "V" Numeric "_" Numeric "_" ( "O" | "C" ) ;
lexical ValveOutputs = "V" Numeric "_" Numeric ("__" Numeric)?;
lexical PumpOutput = "POMP_P" Numeric ;
lexical TimerPulse = "S_" ( "0_1SEC" | "1SEC" | "10SEC" | "1MIN" ) ; 

lexical Type = [A-Z_]+ !>> [A-Z_];
lexical Comment = "(*" CommentContent "*)" ;
lexical CommentContent = [\ a-zA-Z0-9_.,!?=/()\'\"\<\>+-|]+ ;
lexical WS = [\ ]* !>> [\ ] ;
lexical NewLine = "\r\n" ;
