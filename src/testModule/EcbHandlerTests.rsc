module testModule::EcbHandlerTests

import EcbHandler;
import Parser;
import ParseTree;
import PC20Syntax;

import utility::TestUtility;

str expectedLargeRange = "12345-67890";
str expectedSmallRange = "00000-00010";

test bool testLargeRange() = expectEqual(expectedLargeRange, "<composeSourceLineRange(<12345, 67890>)>", "Large range should yield 5 digit response");
test bool testSmallRange() = expectEqual(expectedSmallRange, "<composeSourceLineRange(<0, 10>)>", "Smaller range should automatically pad to 5 digits");

ReadValue sampleRead = parse(#ReadValue, "++Blue++CodeBlock: 00431-00432 is ReadValue 12345,12345");
WriteValue sampleWrite = parse(#WriteValue, "++Green++CodeBlock: 01254-78542 is WriteValue 00432,00543");

test bool testSourceRange() = expectEqual(<431,432>, composeSourceRange(sampleRead), "ReadValue should span exactly those 2 lines");
test bool testComposedRange() = expectEqual(<431, 78542>, composeSourceRange(sampleRead, sampleWrite), "Should compose to first line of read and last line of write");

SkipInstruction firstNop = parse(#SkipInstruction, "00071 00043 00           \r\n");
SkipInstruction lastNop = parse(#SkipInstruction, "00071 00052 00           \r\n");

test bool testRange() = expectEqual(<43,52>, composeSourceRange(firstNop, lastNop), "Composing with instruction should return correct numbers");

