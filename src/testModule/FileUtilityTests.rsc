module testModule::FileUtilityTests

import utility::FileUtility;
import utility::TestUtility;

test bool testStrippingExtension() = expectEqual("Test", stripFileExtension("Test.txt"), "An existing extension should be clipped");
test bool testStrippingWithoutExtension() = expectEqual("Test", stripFileExtension("Test"), "Without extension, return the original");