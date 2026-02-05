module testModule::PowIssue

import IO;

import utility::TestUtility;
import utility::MathUtility;

// Always zero decimals, not sure if the . is there intentional? 
test bool testPositiveInt1() = expectEqual("2.", "<pow(2, 1)>", "2^1=2, Integer input for both arguments always results in zero decimals");
test bool testPositiveInt2() = expectEqual("4.", "<pow(2, 2)>", "2^2=4, Still zero decimals");
test bool testPositiveInt3() = expectEqual("32.", "<pow(2, 5)>", "2^5=32, even with 5, the amount of decimals remains zero");

// Always in one decimal
test bool testNegativeInt1() = expectEqual("0.5", "<pow(2, -1)>", "Divide 1 by 2 returns the correct result");
test bool testNegativeInt2() = expectEqual("0.25", "<pow(2, -2)>", "At this point precision is lost");
test bool testNegativeInt3() = expectEqual("0.03125", "<pow(2, -5)>", "At this point the result reaches 0");

// Now with 'real' input, the interpreter expands the precision based on input precision and exponent size
test bool testPositiveReal1() = expectEqual("2.0", "<pow(2.0, 1)>", "When passing a real and 1, the precision is increased to 1 decimal");
test bool testPositiveReal2() = expectEqual("4.00", "<pow(2.0, 2)>", "Passing a real and 2 yields 2");
test bool testPositiveReal3() = expectEqual("32.00000", "<pow(2.0, 5)>", "Passing a real and 5 increases it to 5");

// However, when using negative values for the exponent, the same precision is not achieved. The precision always remains 2 decimals
test bool testNegativeReal1() = expectEqual("0.5", "<pow(2.0, -1)>", "Passing real with negative exponent returns 2 decimals");
test bool testNegativeReal2() = expectEqual("0.25", "<pow(2.0, -2)>", "Increasing should increase the result to 2 decimals");
test bool testNegativeReal3() = expectEqual("0.03125", "<pow(2.0, -5)>", "Increasing to 5 should also increase precision to 5 secimals");

