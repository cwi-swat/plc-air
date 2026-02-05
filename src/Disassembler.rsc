module Disassembler

import Parser;
import PC20Syntax;
import String;

import utility::Debugging;
import utility::MathUtility;

private bool printDisassemblerInstructions = true ;

list[str] disassemble(str fileName)
{
  retrievedInstructions = [];
  visit(generateDisassembly(fileName))
  {
    case Instruction I:
    { 
      retrievedInstructions += explode("<I>");
    }
  }
  return retrievedInstructions;
}

str explode(str packedInput)
{
  int totalValue = toInt(packedInput, 16);
  int instruction = shiftRight(totalValue, 11); 
  int addressData = mask(totalValue, 0x7FF); 
  str address = "UNKNOWN_ADDRESS" ;   
 
  // default format = adress dot bitaddress
  int addressValue = mask(addressData, 0x7FF);
  int bitValue = shiftRight(addressData, 9);    
  address = "<addressValue>.<bitValue>" ;
  
  // exceptions
  if(isEmpty(instruction))
  {
    address = "";
  }         
  else if(isJump(instruction))
  {   
    address = "<addressValue>";   
  }
  str assemblyInfo = "<instruction> <address>";
  debugPrint("Disassembled to: <assemblyInfo>", printDisassemblerInstructions);
  return assemblyInfo;
}

bool isEmpty(int instruction) = isNop(instruction) || isRet(instruction);
bool isNop(int instruction) = (0 == instruction);
bool isRet(int instruction) = (26 == instruction);
bool isJump(int instruction) = inLimits(24, instruction, 25) || inLimits(29, instruction, 30);
