module \utility::ListUtility

import String;
import List;
import util::Math;

&T first(list[&T] items) = head(items);
&T last(list[&T] items) = head(reverse(items));

bool contains(list[&T] items, &T item) = -1 != indexOf(items, item);

list[&T] generateList(int listSize, &T defaultValue) = [ defaultValue | n <- [0 .. listSize]]; 

list[str] trimList(list[str] linesToTrim, str tokenToSplit)
{
  results = [];
  for(line <- linesToTrim, 1 < size(split(tokenToSplit, line)))
  {
    results += line; 
  }
  return results;
}

list[str] trimList(list[str] linesToTrim)
{
  list[str] results = [];
  for(line <- linesToTrim, "" != trim(line))
  {
    results += trim(line);
  }
  return results;
}

list[&T] mergeList(list[&T] first, list[&T] second) = [ first[n] + second[n] | n <- [0.. min(size(first), size(second))] ];

list[str] padList(str prefix, list[str] lines, str suffix) = ["<prefix><line><suffix>" | line <- lines];

list[str] convertToString(list[&T] items) = [ "<item>" | item <- items ] ;

// Join list to plain string
str joinList(list[&T] lines) = joinList(lines, "\r\n");
str joinList(list[&T] lines, str token)
{
  str result = "";
  for(line <- lines)
  {
    result += "<line><token>"; 
  }
  return replaceLast(result, token, "");
}