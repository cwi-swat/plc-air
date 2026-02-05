module testModule::InstructionUtilityTests

import ParseTree;
import PC20Syntax;

import utility::InstructionUtility;
import utility::TestUtility;

str expectedRange = "02120,02121,02122,02123";

str expectedComposedRange = "<expectedRange> to 12345,67890,87654,00000";

list[str] sampleInput = [ "12569 10778 13 02120 \r\n",   
                          "12570 10779 13 02121 \r\n",    
                          "12571 10780 13 02122 \r\n",    
                          "12572 10781 13 02123 \r\n"];
                            
list[str] writeRange = [ "12569 10778 13 12345 \r\n",   
                         "12570 10779 13 67890 \r\n",    
                         "12571 10780 13 87654 \r\n",    
                         "12572 10781 13 00000 \r\n"];


test bool testSingleAddress() = expectEqual("00100", addressRange(["00045 00019 01 00100  \r\n"]));
test bool testAddressRange() = expectEqual(expectedRange, addressRange(sampleInput));

test bool testSplittedAddressRange() = expectEqual(expectedComposedRange, addressRange(sampleInput, writeRange));

public FetchConstantInstruction sampleFetch = parse(#FetchConstantInstruction, "00051 00024 12 02340 \r\n");

test bool testAddressValue() = expectEqual("02340", getAddress(sampleFetch), "Fetching data from parsed types should work");