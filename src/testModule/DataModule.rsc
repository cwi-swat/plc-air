module testModule::DataModule

// Holds data used for testing
import Environment;

public SymbolTable symbols = loadSymbols("DR_TOT_3.SYM");

public void reloadSymbols()
{
  symbols = loadSymbols("DR_TOT_3.SYM");
}