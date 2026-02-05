module \utility::HtmlUtility

import List;
import String;

// table items
public str openTable() = "\<Table border\>";
public str caption(str caption) = "\<Caption\>" + caption + "\</Caption\>";
public str closeTable() = "\</Table\>";

// table formatting
public str openRow() = "\<tr\>";
public str openColumn() = "\<td\>";
public str closeColumn() = "\</td\>";
public str closeRow() = "\</tr\>\r\n"; // Newline added for Html reading convenience

public str htmlPrint(str input) = replaceAll(input, "\r\n", "\<br\>");

// composed functions
public str rowWithValue(str name, str valueToken) = rowWithValues([name, valueToken]);
public str rowWithValues(list[str] Values)
{
  totalHtml = openRow();
  for(int n <- [0 .. size(Values)])
  {
    totalHtml += tableCell(Values[n]);
  }
  totalHtml += closeRow();
  return totalHtml;
}

public str tableCell(str valueToken) = openColumn() + valueToken + closeColumn();
public str testRow(str moduleName, str testName, bool testResult) = openRow() + testCell(testResult) + tableCell(moduleName) + tableCell(testName) + closeRow();

public str testCell(bool testPassed) = testPassed ? greenCell() : redCell();
public str greenCell() = "\<td width=25 bgcolor=\"#00FF00\"\><closeColumn()>";
public str redCell() = "\<td width=25 bgcolor=\"#FF0000\"\><closeColumn()>";

public str createLink(str path) = openLink(Path) + "\"\>" + path + closeLinkTag();
public str openLink(str relativePath) = "\<a href=\".<relativePath>";
public str closeLinkTag() = "\</a\"";