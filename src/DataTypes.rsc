module DataTypes

import List;

alias PatternMap = map[str patternName, int patternCount]; 
alias PatternList = list[tuple[int patternCount, str patternName]]; /// (sorted) list of patterns

PatternList toList(PatternMap patternMap)
{
  patternList = [];
  for(pattern <- patternMap)
  {
    patternList += [<patternMap[pattern], pattern>];    
  }
  return reverse(sort(patternList));
}

alias SourceRange = tuple[int firstLine, int lastLine];
alias Statement = str;