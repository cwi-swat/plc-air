module lang::plc::pc20::tests::FileUtilityTests

import lang::plc::pc20::util::FileUtility;
import lang::plc::pc20::util::TestUtility;

test bool testStrippingExtension() = expectEqual("Test", stripFileExtension("Test.txt"), "An existing extension should be clipped");
test bool testStrippingWithoutExtension() = expectEqual("Test", stripFileExtension("Test"), "Without extension, return the original");