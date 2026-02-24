module testModule::TestUtilityTests


import IO;

import \utility::TestUtility;

import vis::Figure;

// tests the testUtility, since it's our own library, it must be tested
test bool expectEqualIntTest() = expectEqual(5,5);
test bool expectFalseIsEqualIntTest() = !expectEqual(4,5);

test bool expectNotEqualintTest() = expectNotEqual(4,5);
test bool expectFalseIsNotEqualintTest() = !expectNotEqual(5,5);

test bool expectTrueTestTrue() = expectTrue(true);
test bool expectTrueTestFalse()= !expectTrue(false);

test bool expectFalseTestTrue() = expectFalse(false);
test bool expectFalseTestTrue() = !expectFalse(true);

test bool expectDetectionOfDifferentSizeFirst() = expectFalse(expectEqual([], [""]));
test bool expectDetectionOfDifferentSizeSecond() = expectFalse(expectEqual([""], []));
test bool expectDetectionOfDifferentContent() = expectFalse(expectEqual(["A"], ["B"]));
test bool expectDetectionOfEqualContent() = expectTrue(expectEqual(["A"], ["A"]));

list[str] sampleList = ["A", "B", "C"];
list[str] identicalList = ["A", "B", "C"];
list[str] differentSize = ["A", "B", "C", "D"];
list[str] differentContent = ["A", "B", "D"];

test bool testEqualLists() = expectEqual(sampleList, identicalList, "Identical lists return true");
test bool testListDifferentSize() = expectNotEqual(sampleList, differentSize, "Different size returns false");
test bool testListDifferentContent() = expectNotEqual(sampleList, differentContent, "Different content returns error");
