module testModule::StringUtilityTests

import Map;
import String;

import utility::StringUtility;
import utility::TestUtility;

test bool testTrimAssumption() = expectEqual("Hallo", trim("\n\r\t   Hallo\n\r\t"));

test bool testStringToken() = expectEqual("Substring", stringToken("{Substring}", "{", "}"));
test bool testStringTokenOverLoad() = expectEqual("Substring", stringToken("{Substring}", "{", 10));
test bool testStringTokenOverLoad() = expectEqual("Substring", stringToken("bool Substring()", 5, "()"));
test bool testLargerStringToken() = expectEqual("Substring", stringToken("---\>Substring\<---", "---\>", "\<---"));
test bool testSubStringEquivalence() = expectEqual(substring("FailPass", 0,4), stringToken("FailPass", 0,4));
test bool testSubStringInt() = expectEqual("Pass", stringToken("FailPass", 4, ""));

str inlineCommentString = "Hello/*InlineComment*/GoodBye";

test bool testClipString() = expectEqual("HelloGoodBye", clipString(inlineCommentString, "/*", "*/"));
test bool testClipStringWithSplit() = expectEqual("Hello\r\nGoodBye", clipString(inlineCommentString, "/*", "*/", "\r\n")); 

test bool testParseInt() = expectEqual(-1, parseInt("hallo"));
test bool testParseInt() = expectEqual(30, parseInt("30"));

test bool testParseBlock() = expectEqual(133, parseInt("CodeBlock: 00133-00135 is Generic action block"), "Should find the first number");

test bool testFirstInt() = expectEqual(133, firstInteger("CodeBlock: 00133-00135 is Generic action block"), "Should find the first numeric token");
test bool testLastInt() = expectEqual(135, lastInteger("CodeBlock: 00133-00135 is Generic action block"), "Should find the last numeric token");

test bool testInvalidHex() = expectFalse(isHexaDecimal("CodeBlock: 00133-00135 is Generic action block"));
test bool testValidHex() = expectTrue(isHexaDecimal("CodeBlock: 0x00133-00135 is Generic action block"));

test bool testFirstNumericHex() = expectEqual(2, firstNumeric("0x10"), "Hex should ignore the 0x part");
test bool testFirstNumericNormal() = expectEqual(7, firstNumeric("Hello, 090"), "Normal ignores characters and spaces");

// Add some tests to make sure parseInt does not mistake input for binary, octal or hexadecimal
test bool testParseIntBinary() = expectEqual(10, parseInt("00010"), "Check that 10 is reported instead of 3");
test bool testParseIntOctal() = expectEqual(70, parseInt("00070"), "Check that 70 is reported instead of 56");
test bool testParseIntHexadecimal() = expectEqual(31, parseInt("0x0001F"), "Check that hex input is considered valid");
test bool testParseIntHexadecimal() = expectEqual(255, parseInt("0x000ff"), "Check that hex input is considered valid");
test bool testIntegers() = expectEqual([123,456,678], extractIntegers("00123,00456,00678"), "Automatically composes list of integers from string");
test bool testNumericList() = expectEqual([1,10,43,1234,100], extractIntegers("Any Str1ng conta10ning the data 43 will simply get it done1234. even hexadec0x64imals!"));
test bool testStripLeadingSingleChar() = expectEqual("400.1", stripLeading("00400.1", "0"), "stripLeading should remove all leading 0\'s");
test bool testStripLeadingNoChar() = expectEqual("00400.1", stripLeading("00400.1", "5"), "stripLeading should return original string");
test bool testLargeToken() = expectEqual("00.1", stripLeading("00400.1", "004"), "multiple characters are removed with similar syntax");

test bool testPaddedStrings() = expectEqual(332, parseInt("00332      "), "parseInt should be able to trim strings");
test bool testZeroValue() = expectEqual(0, parseInt("00000        "), "zero with trailing spaces should parse correctly");

// real formatting
test bool testFormatReal() = expectEqual("0.00", formatReal(0), "defaults to 2 digits");
test bool testFormatRealClipping() = expectEqual("0.12", formatReal(0.12335), "defaults to 2 digits, clipping the rest");
test bool testFormatRealSizeArgument() = expectEqual("45678.12335", formatReal(45678.12335, 5), "5 digits");
test bool testFormatRealPadding() = expectEqual("45678.12300", formatReal(45678.123, 5), "5 digits, padded with 0"); 