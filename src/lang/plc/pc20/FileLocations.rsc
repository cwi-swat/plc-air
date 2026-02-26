module lang::plc::pc20::FileLocations

import String;

// location definitions
public loc projectRoot = |project://plc-air|;
public loc outputDir = projectRoot + "target" + "output";
public loc sampleDir = projectRoot + "examples";
public loc sourceDir = projectRoot + "src";
public loc outputFilePath = projectRoot + "target" + "outputFiles";
public loc testFilePath = sampleDir + "testFiles";
public loc compiledFilePath = projectRoot + "target" + "compiledFiles";

// GeneratedPath
public loc generatedFilePath = projectRoot + "target" + "generated";

// directory calls
public loc testDir = projectRoot + "lang/plc/pc20/tests";

// test file calls
public loc outputFile(str forFile) = outputFilePath + forFile;
public loc sampleFile(str forFile) = sampleDir + forFile;
public loc testFile(str forFile) = testFilePath + forFile;
public loc generatedFile(str forFile) = generatedFilePath + forFile;
public loc compiledFile(str forFile) = compiledFilePath + forFile;
