module utility::FileUtility

import FileLocations;
import IO;
import List;
import String;

import utility::Debugging;
import utility::ListUtility;
import utility::StringUtility;

list[loc] enumerateDirFiles(str dir, str extension) = [ file | file <- enumerateDirFiles(toLocation(dir)), endsWith(file.path, extension)];
list[loc] enumerateDirFiles(str sampleSubDir) = enumerateDirFiles(toLocation("<sampleDir><sampleSubDir>"));
list[loc] enumerateDirFiles(loc folderLoc)
{
  list [loc] locationList = [];
  if(true == exists(folderLoc))
  {
    try
    {
      list[loc] filesFolders = folderLoc.ls;
      for (int n <- [0 .. size(filesFolders)])
      {
        if (isDirectory(filesFolders[n]))
        {
          locationList += enumerateDirFiles(filesFolders[n]);
        }        
  	    else
  	    {
  	      locationList += filesFolders[n];
  	    }  
      }
    }
    catch:
    {
      handleError("unable to query .ls on <folderLoc>, please add an extension to prevent this error");
    }
    return locationList;
  }
  handleError("no such location <folderLoc>");
  return [];
}

bool isDirectory(loc path) = (-1 == findLast(path.path, "."));

list[str] stripFileExtension(list[str] files) = [ stripFileExtension(file) | file <- files];
str stripFileExtension(str file)
{
  dotPos = findLast(file, ".") ;
  if(0 < dotPos)
  {
    return substring(file, 0, dotPos);    
  }
  return file;
}

list[str] fileName(list[loc] Files) = [ fileName(file.path) | file <- Files];
list[str] fileName(list[str] files) = [ FileName(name) | name <- Files] ;
str fileName(loc fileToCheck) = fileName(fileToCheck.path);
str fileName(str totalPath)
{
  int lastSlash = findLast(totalPath, "/");
  if(-1 != lastSlash)
  {
    return substring(totalPath, lastSlash+1);
  }
  return totalPath;
}

void resetFile(loc file)
{
  if(exists(file))
  {
    writeFile(file, "");
  }
}

void writeToFile(loc file, list[&T] items)
{
  resetFile(file);
  addToFile(file, items);
}

void addToFile(loc file, list[&T] items)
{
  str totalText = "";
  for(line <- [0..size(items)])
  {
    if(0 == line % 100)
    {
      println("<100.0 * line/size(items)>%");  
    }
    totalText += "<items[line]>\r\n";
  }
  addToFile(file, totalText);
}

void addToFile(loc file, str text) = exists(file) ? appendToFile(file, text) : writeFile(file, text);


