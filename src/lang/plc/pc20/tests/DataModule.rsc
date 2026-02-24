module lang::plc::pc20::tests::DataModule

// Holds data used for testing
import lang::plc::pc20::Environment;

public SymbolTable symbols = loadSymbols("DR_TOT_3.SYM");

public void reloadSymbols()
{
  symbols = loadSymbols("DR_TOT_3.SYM");
}