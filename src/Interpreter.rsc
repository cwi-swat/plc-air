module Interpreter

import Boolean;
import FileLocations;
import IO;
import List;
import String;

import util::Math;

import utility::Debugging;
import utility::ListUtility;
import utility::MathUtility;
import utility::StringUtility;

alias Address = tuple[int index, int bit];
alias Register = tuple[list[bool] bit, int index];

int memorySize = 3000;

list[int] initScratchPad() = generateList(memorySize, 0);
int lastFetch = -10;
int lastLogic = -10;
public int programCounter = 0 ;
list[str] instructionList = readFileLines(generatedFile("DR_TOT_3.instructions"));
list[int] scratchPad = initScratchPad();
list[int] triggerScratchPad = initScratchPad();
list[int] stack = [];
bool condition = true;
Register register = <generateList(16,false), 0>;

int LastAddress = 0;
int FirstAddress = 0;

list[int] physicalIO = initScratchPad();

bool showInstructions = false;

void reset()
{
 lastFetch = -10;
 lastLogic = -10;
 programCounter = 0;
 condition = true;
 resetScratchPad();
 clearRegisters();
 SETBIT(<0,1>);
}

void clearRegisters()
{
  register = <generateList(16,false), 0>;
}
  

void resetScratchPad()
{
  scratchPad = initScratchPad();
  triggerScratchPad = initScratchPad();
}

void NOP()
{
  handlePrint("NOP");
}

void TRIGGER(Address address)
{
  isTrue = GETBIT(address);
  wasTrue = getBit(triggerScratchPad[address.index], address.bit);
  triggerScratchPad[address.index] = isBit(triggerScratchPad[address.index], address.bit, isTrue);
  condition = isTrue && !wasTrue;
  handlePrint("TRIG", address, wasTrue, isTrue);  
}

void EQUALS(Address address)
{
  wasTrue = GETBIT(address);
  ISBIT(address, condition);
  isTrue = GETBIT(address);
  handlePrint("EQL", address, wasTrue, isTrue);
}

void EQUALS_NOT(Address address)
{
  wasTrue = GETBIT(address);
  ISBIT(address, !condition);
  isTrue = GETBIT(address);
  handlePrint("EQLNT", address, wasTrue, isTrue);
}

void COMPARE(Address address)
{
  wasTrue = condition;
  isTrue = GETBIT(address);
  condition = wasTrue == isTrue;
  handlePrint("COMP", address, wasTrue, isTrue);  
}

void SET0(Address address)
{
  wasTrue = GETBIT(address);  
  RESETBIT(address);
  isTrue = GETBIT(address);
  handlePrint("SET0", address, wasTrue, isTrue);    
}

void SET1(Address address)
{
  wasTrue = GETBIT(address);  
  RESETBIT(address);
  isTrue = GETBIT(address);
  handlePrint("SET1", address, wasTrue, isTrue);  
}

void FETCH_BIT(Address address)
{
  wasTrue = register.bit[register.index];
  if(1 > abs(lastFetch - programCounter))
  {
    clearRegisters();
  }
  isTrue = GETBIT(address);
  register.bit[register.index] = isTrue;
  register.index = (register.index + 1) % 16;
  
  handlePrint("FTCHB", address, wasTrue, isTrue);
  lastFetch = programCounter;    
}

void FETCH_DIGIT(Address address)
{
  int previous = shiftLeft(register.bit[register.index],3) + shiftLeft(register.bit[register.index],2) + shiftLeft(register.bit[register.index],1) + toInt(register.bit[register.index]);
  if(1 > abs(lastFetch - programCounter))
  {
    clearRegisters();
  }
  int current = GETWORD(address);
  WRITE_REGISTER(current);
  handlePrint("FTCHD", address, previous, current);
  lastFetch = programCounter;
}

int GETWORD(address) = scratchPad[address.index];

void FETCH_CONSTANT(Address address)
{  
  int previous = READ_REGISTER();
  int current = address.index;
  clearRegisters();
  WRITE_REGISTER(current);
  handlePrint("FTCHC", address, previous, current);  
}

void STORE_DIGIT(Address address)
{
  int previous = scratchPad[address.index];
  int current = READ_REGISTER();
  scratchPad[address.index] = previous;
  handlePrint("STRD", address, previous, current);  
}


// A read and write should have it's own registers??
int READ_REGISTER() = shiftLeft(register.bit[register.index+3],3) 
                    + shiftLeft(register.bit[register.index+2],2) 
                    + shiftLeft(register.bit[register.index+1],1) 
                    + toInt(register.bit[register.index]); 
  
void WRITE_REGISTER(int current)
{
  register.bit[register.index] = 0 < mask(current, 0);
  register.bit[register.index+1] = 0 < mask(current, 1);
  register.bit[register.index+2] = 0 < mask(current, 2);
  register.bit[register.index+3] = 0 < mask(current, 3);
  register.index = (register.index + 4) % 16;  
}  

void AND(Address address)
{
  isTrue = GETBIT(address);
  wasTrue = hasCondition();
  condition = isTrue && wasTrue; 
  handlePrint("AND", address, wasTrue, isTrue);
}

void ANDNT(Address address)
{
  isTrue = GETBIT(address);
  wasTrue = condition;
  condition = wasTrue && !isTrue;
  handlePrint("ANDNT", address, wasTrue, isTrue);
}

void OR(Address address)
{
  isTrue = GETBIT(address);
  wasTrue = condition;
  if(startOfLogicChain())
  {
    condition = isTrue;
  }
  else
  {
    condition = wasTrue || isTrue;
  }
  handlePrint("OR", address, wasTrue, isTrue);
}

void ORNT(Address address)
{
  isTrue = (false == GETBIT(address));
  wasTrue = condition;
  if(startOfLogicChain())
  {
    condition = isTrue;
  }
  else
  {
    condition = wasTrue || isTrue;
  }  
  handlePrint("ORNT", address, wasTrue, isTrue);
}

bool hasCondition() = (condition || startOfLogicChain());

bool startOfLogicChain()
{
  bool isStart = 1 < abs(programCounter-lastLogic);
  lastLogic = programCounter;  
  return isStart;
}

void JUMP_SUBROUTINE_FALSE(Address address)
{
  int previous = programCounter;
  int current = address.index;
  handlePrint("JSAF", address, previous, current);
  programCounter = current;
  stack += previous;
}

void JUMP_SUBROUTINE_TRUE(Address address)
{
  int previous = programCounter;  
  int current = address.index;
  handlePrint("JSAT", address, previous, current);
  programCounter = current;  
  stack += previous;
}

void JUMP_FORWARD_RELATIVE_FALSE(Address address)
{
  previous = programCounter;
  current = programCounter + address.index;  
  handlePrint("JFRF", address, previous, current);
  programCounter = current;
}

void JUMP_BACKWARD_RELATIVE_FALSE(Address address)
{
  previous = programCounter;
  current = programCounter - address.index;  
  handlePrint("JBRF", address, previous, current);
  programCounter = current;
}

bool GETBIT(Address address) = getBit(scratchPad[address.index], address.bit);

void ISBIT(Address address, bool newValue) = (true == newValue) ? SETBIT(address) : RESETBIT(address);

void SETBIT(Address address)
{
  scratchPad[address.index] = setBit(scratchPad[address.index], address.bit); 
}

void RESETBIT(Address address)
{
  scratchPad[address.index] = resetBit(scratchPad[address.index], address.bit);
}

void LAST_IO(Address address)
{
  previous = LastAddress;
  current = address.index;
  LastAddress = address.index;
  handlePrint("LSTIO", address, previous, current);
}

void END(Address address)
{
  previous = FirstAddress;
  current = address.index;
  FirstAddress = address.index;
  handlePrint("END", address, previous, last(stack));
  for(n <- [FirstAddress .. LastAddress+1])
  {
    scratchPad[n] = physicalIO[n];
  }
  programCounter = 0;
  condition = false;   
}

void RET()
{
  previous = programCounter;
  try
  {
    current = last(stack);
  }
  catch:
  {
    debugPrint("Returning with an empty stack.... resetting PLC");
    reset();
    return;
  }
  handlePrint("RET", <0,0>, previous, last(stack));
  stack = take(size(stack)-1, stack);
  programCounter = current;  
}

Address generateAddress(str stringAddress)
{
  tokens = split(".", stringAddress);
  int index = parseInt(tokens[0]);
  int bit = size(tokens) > 1 ? parseInt(tokens[1]) : 0 ; 
  return <index, bit>; 
}

void randomizeInputs()
{
  for(n <- [1000..1100])
  {
    scratchPad[n] = arbInt() % 16;
  }
}

void goHandle()
{
  while(1 > 0)
  {
    handleInstruction();
  }
}

void handlePrint(str instruction, Address address, bool wasTrue, bool isTrue)
{
  debugPrint("<printHeader(instruction)> <right("<address.index>",6, " ")>.<address.bit> was <left("<wasTrue>",5)>, is <left("<isTrue>",5)> condition: <condition>");
}

void handlePrint(str instruction, Address address, int previous, int current)
{
  debugPrint("<printHeader(instruction)> <right("<address.index>",6, " ")> was <previous>, is <current>");
}

void handlePrint(str instruction)
{
  debugPrint(printHeader(instruction));
}

str printHeader(str instruction) = "<right("<programCounter>", 6, " ")> : <right(instruction, 6, " ")> :";


void handleInstruction()
{
  currentInstruction = "";
  try
  {
    currentInstruction = instructionList[programCounter];
  }
  catch:
  {
    debugPrint("End of program, randomizing input and restarting");
    randomizeInputs();
    programCounter = 0;
    return;
  }
  
  instructionNumber = parseInt(substring(currentInstruction, 0, 2));
  address = generateAddress(trim(substring(currentInstruction, 2)));
  debugPrint("<programCounter> : Handling instruction <instructionNumber> with data: <address>", showInstructions);  
  switch(instructionNumber)
  {
       case 0:
    {
      NOP();
    }
    case 1:
    {
      TRIGGER(address);
    }
    case 2:
    {
      EQUALS(address);
    }
    case 3:
    {
      EQUALS_NOT(address);
    }
    case 4:
    {
      if(true == condition)
      {
        SHIFT_LEFT(address);
      }
    }
    case 5:
    {
      if(true == condition)
      {
        SHIFT_RIGHT(address);
      }
    }
    case 6:
    {
      if(true == condition)
      {
        COUNT_DOWN(address);
      }
    }
    case 7:
    {
      if(true == condition)
      {
        COUNT_UP(address);
      }
    }
    case 8:
    {
      if(true == condition)
      {
        SET0(address);
      }
    }
    case 9:
    {
      if(true == condition)
      {
        SET1(address);
      }
    }
    case 10:
    {
      if(true == condition)
      {
        STORE_BIT(address);
      }
    }
    case 11:
    {
      if(true == condition)
      {
        FETCH_BIT(address);
      }
    }
    case 12:
    {
      if(true == condition)
      {
        FETCH_CONSTANT(address);
      }
    }
    case 13:
    {
      if(true == condition)
      {
        FETCH_DIGIT(address);
      }
    }
    case 14:
    {
      if(true == condition)
      {
        STORE_DIGIT(address);
      }
    }
    case 15:
    {
      if(true == condition)
      {
        COMPARE(address);
      }
    }
    case 16:
    {
      AND(address);
    }
    case 17:
    {
      ANDNT(address);
    }
    case 18:
    {
      OR(address);        
    }
    case 19:
    {
      ORNT(address);
    }
    case 20:
    {
      if(true == condition)
      {
        ADD(address);
      }
    }
    case 21:
    {
      if(true == condition)
      {
        SUBTRACT(address);
      }
    }
    case 22:
    {
      if(true == condition)
      {
        MULTIPLY(address);
      }
    }
    case 23:
    {
      if(true == condition)
      {
        DIVIDE(address);
      }
    }
    case 24:
    {
      if(false == condition)
      {
        JUMP_SUBROUTINE_FALSE(address);
        return;
      }
    }
    case 25:
    {
      if(true == condition)
      {
        JUMP_SUBROUTINE_TRUE(address);
        return;
      }
    }
    case 26:
    {
      RET();      
    }
    case 27:
    {
      END(address);      
    }
    case 28:
    {
      ;
    }
    case 29:
    {
      if(false == condition)
      {
        JUMP_BACK_RELATIVE_FALSE(address);
        return;
      }
    }
    case 30:
    {
      if(false == condition)
      {
        JUMP_FORWARD_RELATIVE_FALSE(address);
        return;
      }
    }
    case 31:
    {
      LAST_IO(address);
    }    
  }
  programCounter += 1;
}