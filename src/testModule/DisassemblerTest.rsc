module testModule::DisassemblerTest

import Disassembler;

test bool testSmallSample() = [] != disassemble("sample.obj");