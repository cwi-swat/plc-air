module lang::plc::pc20::tests::DisassemblerTest

import lang::plc::pc20::Disassembler;

test bool testSmallSample() = [] != disassemble("sample.obj");