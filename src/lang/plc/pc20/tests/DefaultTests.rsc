module lang::plc::pc20::tests::DefaultTests

import lang::plc::pc20::util::TestUtility;

test bool testForLoop() {
    bool result = true;
    for (_ <- [0..0]) {
        result = false;
    }
    return expectTrue(result, "A for loop from 0..0 should not be executed");
}

test bool testForLoopSingle() {
    count = 0;
    for (_ <- [0..1]) {
        count += 1;
    }
    return expectEqual(1, count, "0..1 should be exucted a single time");
}
