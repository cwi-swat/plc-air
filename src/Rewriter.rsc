module Rewriter

import DataTypes;
import EcbHandler;
import ParseTree;
import PC20Syntax;
import String;

import utility::Debugging;
import utility::InstructionUtility;
import utility::StringUtility;

Tree rewrite(Tree tree) = innermost visit(tree)
{
  // Toss away empty lines
  case (CodeBlock) `<CompiledInstruction* pre><EmptyLine _><CompiledInstruction *post>`:
  {
    debugPrint("Removing empty line");
    insert (CodeBlock)`<CompiledInstruction* pre><CompiledInstruction* post>`;
  }

  /// ResetCondition is an unused part?
  case (CodeBlock) `<CompiledInstruction* pre><
    SourcePrefix prefix>17 00000.1<WhiteSpace _><NewLine _><
    SkipInstruction nop><
    CompiledInstruction *post>`:
  {
    blank = parse(#BlankAndNot, debugPrint("BlankAndNot:", "<composeEcbPrefix("Brown", composeSourceRange(prefix, nop))>BlankAndNot"));
    insert(CodeBlock)`<CompiledInstruction *pre><QuickJumpOut blank><CompiledInstruction *post>`;
  }
  
  /// Quick JumpOut is a Small Speed optimizaltion
  case (CodeBlock) `<CompiledInstruction* pre><
    SourcePrefix prefix>17 00000.1<WhiteSpace _><NewLine _><
    JumpInstruction jump><
    CompiledInstruction *post>`:
  {
    speed = parse(#QuickJumpOut, debugPrint("QuickJumpOut:", "<composeEcbPrefix("Brown", composeSourceRange(prefix, jump))>QuickJumpOut"));
    insert(CodeBlock)`<CompiledInstruction *pre><QuickJumpOut speed><CompiledInstruction *post>`;
  } 
  
  /// Initial IO Sync
  case (CodeBlock) `<CompiledInstruction* pre><
    JumpInstruction jump><
    SingleInstruction ret><
    CompiledInstruction *post>`:
  {
    jumpSubRoutine = parse(#IOJump, "<composeEcbPrefix("Brown", composeSourceRange(jump, ret))>IOJump");
    insert(CodeBlock)`<CompiledInstruction *pre><IOJump jumpSubRoutine><CompiledInstruction *post>`;
  }
  
  case (CodeBlock) `<CompiledInstruction* pre><
    SourcePrefix prefix>16 00000.1<WhiteSpace _><NewLine _><
    JumpInstruction _><
    JumpInstruction jump><
    CompiledInstruction *post>`:
  {
    jumpSubRoutine = parse(#IOJump, "<composeEcbPrefix("Brown", composeSourceRange(prefix, jump))>IOJump");
    insert(CodeBlock)`<CompiledInstruction *pre><IOJump jumpSubRoutine><CompiledInstruction *post>`;
  }
  
  /// CompareConstant
  case (CodeBlock) `<CompiledInstruction *pre><
    SourcePrefix first>12 <WordAddress constantValue><NewLine _><
    SourcePrefix _>15 <WordAddress compareValue><NewLine _><
    SourcePrefix last>10 <BitAddress result><NewLine _><
    CompiledInstruction *post>`:
    {
      compareConstant = parse(#CompareConstant, debugPrint("Compare Constant: ", "<composeEcbPrefix("Brown", composeSourceRange(first, last))>CompareConstant <trim("<constantValue>")> = <trim("<compareValue>")> =\> <trim("<result>")>"));
      insert(CodeBlock)`<CompiledInstruction* pre><CompareConstant compareConstant><CompiledInstruction *post>`;
    }
    

  /// NopBlock
  case (CodeBlock) `<CompiledInstruction* pre><SkipInstruction firstNop><CompiledInstruction* post>`:
  {
    firstInstruction = lastInstruction = firstNop;
    while((CodeBlock)`<SkipInstruction lastNop><CompiledInstruction* newPost>` := (CodeBlock)`<CompiledInstruction post>`)
    {
      lastInstruction = lastNop;
      post = newPost;
    }    
    nopBlock = composeNopBlock(composeSourceRange(firstInstruction, lastInstruction));
    insert(CodeBlock)`<CompiledInstruction* pre><NopBlock nopBlock><CompiledInstruction* post>`;    
  } 
 
  /// ComposeValue
  case (CodeBlock)`<CompiledInstruction* pre><
    SourcePrefix first>11 <BitAddress bitAddress><NewLine _><
    SourcePrefix last>14 <WordAddress wordAddress><NewLine _><
    CompiledInstruction* post>`:
    {
      debugPrint("First composeValue");
      bits = [bitAddress];      
      while((CodeBlock)`<CompiledInstruction* newPre><SourcePrefix current>11 <BitAddress bitAddress><NewLine _>` 
        := (CodeBlock)`<CompiledInstruction pre>`)
      {
        debugPrint("Found an additional FETCHBIT");
        first = current;
        bits = bitAddress + bits;
        pre = newPre;
      }
      bitString = "";
      for(bit <- bits)
      {
        bitString += "<trim("<bit>")> ";
      }
      composeValue = parse(#ComposeValue, debugPrint("Fetch grammar:", "<composeEcbPrefix("Brown", composeSourceRange(first, last))>ComposeValue <bitString>=\> <trim("<wordAddress>")> "));
      insert(CodeBlock)`<CompiledInstruction* pre><ComposeValue composeValue><CompiledInstruction* post>`;      
    } 
    
  
  /// ReadValue
  case (CodeBlock)`<CompiledInstruction* pre><FetchInstruction fetch><CompiledInstruction *post>`:
  {
    statements = ["<fetch>"];
    while((CodeBlock)`<FetchInstruction fetch><CompiledInstruction *newPost>`
      := (CodeBlock)`<CompiledInstruction *post>`) 
    {
      post = newPost;
      statements += ["<fetch>"];
    }      
    readValue = composeReadValue(statements);
    insert (CodeBlock)`<CompiledInstruction* pre><ReadValue readValue><CompiledInstruction *post>`;
  }
 
  /// ResetBit
  case (CodeBlock)`<CompiledInstruction* pre><
    SourcePrefix first>08 <BitAddress address><NewLine _><
    CompiledInstruction* post>`:
  {
    resetBitPattern = parse(#ResetBit, debugPrint("ResetBit", "<composeEcbPrefix("Brown", composeSourceRange(first, first))>ResetBit <trim("<address>")> "));
    insert (CodeBlock)`<CompiledInstruction* pre><ResetBit resetBitPattern><CompiledInstruction *post>`;
  }
 
  /// SetBit
  case (CodeBlock)`<CompiledInstruction* pre><
    SourcePrefix first>09 <BitAddress address><NewLine _><
    CompiledInstruction* post>`:
  {
    setBitPattern = parse(#SetBit, debugPrint("SetBit", "<composeEcbPrefix("Brown", composeSourceRange(first, first))>SetBit <trim("<address>")> "));
    insert (CodeBlock)`<CompiledInstruction* pre><SetBit setBitPattern><CompiledInstruction *post>`;
  }
 
  /// IOSynchronization
  case (CodeBlock)`<CompiledInstruction* pre><IOInstruction lstio><IOInstruction endio><CompiledInstruction *post>`:
  {
    debugPrint("Found an IO sync");
    ioSynchronization = composeIOSynchronization(["<lstio>", "<endio>"]);
    insert (CodeBlock)`<CompiledInstruction* pre><IOSynchronization ioSynchronization><CompiledInstruction *post>`;
  }
 
  /// FetchConstant
  case (CodeBlock)`<CompiledInstruction* pre><
  FetchConstantInstruction fetch><
  CompiledInstruction* post>`:
  {
    firstFetch = lastFetch = fetch;
    constantValues = [];
    visit(fetch)
    {
      case WordAddress WA:
      {
        constantValues += "<trim("<WA>")>";
      }
    }
  
     while((CodeBlock)`<FetchConstantInstruction fetch><CompiledInstruction *newPost>`
      := (CodeBlock)`<CompiledInstruction *post>`)
    {
      post = newPost;
      lastFetch = fetch;      
      visit(lastFetch)
      {
        case WordAddress WA:
        {
          constantValues += "<trim("<WA>")>";
        }
      }
    }
    constantString = "";
    for(constant <- constantValues)
    {
      constantString += "<trim("<constant>")>,";      
    }
    constantString = replaceLast(constantString, ",", "");
    readConstant = parse(#ReadConstant, debugPrint("<composeEcbPrefix("Lime", composeSourceRange(firstFetch, lastFetch))>ReadConstant <constantString>"));
    insert(CodeBlock)`<CompiledInstruction* pre><ReadConstant readConstant><CompiledInstruction* post>`;     
  }
 
  /// AssignConstant
  case (CodeBlock)`<CompiledInstruction* pre><
  ReadConstant readConstant><
  WriteValue writeValue><
  CompiledInstruction *post>`:
  {
    constantString = "" ;
    visit(readConstant)
    {
      case ConstantValues CV:
      {
        constantString = "<CV>";
      }
    }
  
    try
    {
      assignConstant = parse(#AssignConstant, "<composeEcbPrefix("Lime", composeSourceRange(readConstant, writeValue))>AssignConstant <constantString> to <addressRange(writeValue)>");
      insert(CodeBlock)`<CompiledInstruction* pre><AssignConstant assignConstant><CompiledInstruction* post>`;
    }
    catch:
    {
      handleError("failed to compose <readConstant> <writeValue>");
      fail;
    }    
  }
    
  /// WriteValue
  case (CodeBlock)`<CompiledInstruction* pre><StoreValue store><CompiledInstruction *post>`:
  {
    statements = ["<store>"];
    while((CodeBlock)`<StoreValue store><CompiledInstruction *newPost>`
      := (CodeBlock)`<CompiledInstruction *post>`)
    {
      post = newPost;
      statements += ["<store>"];
    }      
    writeValue = composeWriteValue(statements);
    insert (CodeBlock)`<CompiledInstruction* pre><WriteValue writeValue><CompiledInstruction *post>`;
  }
  
  /// Compare
  case (CodeBlock)`<CompiledInstruction* pre><CompareInstruction compare><CompiledInstruction *post>`:
  {
    statements = ["<compare>"];
    while((CodeBlock)`<CompareInstruction compare><CompiledInstruction *newPost>`
      := (CodeBlock)`<CompiledInstruction *post>`)
    {
      post = newPost;
      statements += ["<compare>"];
    }      
    compareValue = composeCompareValue(statements);
    insert (CodeBlock)`<CompiledInstruction* pre><CompareValue compareValue><CompiledInstruction *post>`;
  }  
  
  /// Compare
  case (CodeBlock)`<CompiledInstruction* pre><ReadValue read><CompareValue compare><CompiledInstruction *post>`:
  {
    compareValue = composeCompareValue(read, compare);
    insert (CodeBlock)`<CompiledInstruction* pre><CompareValue compareValue><CompiledInstruction *post>`;
  }
  
    /// Compare to Result
  case (CodeBlock)`<CompiledInstruction* pre><
    EcbPrefix first>CompareValue <CompareStatement compare><
    EcbPrefix last>WriteValue <AddressRange target><
    CompiledInstruction* post>`:
  {
    compareWithResult = parse(#CompareWithResult, debugPrint("CompareWithResult: ", "<composeEcbPrefix("Lime", composeSourceRange(first, last))>CompareWithResult <compare> =\> <target> "));
    insert (CodeBlock)`<CompiledInstruction* pre><CompareWithResult compareWithResult><CompiledInstruction* post>`; 
  }
  
  // AndEqual => Rename to ' Bit Assign' 
  case (CodeBlock)`<CompiledInstruction* pre><
    LogicCondition logic><
    CompareValue compare><
    StoreBit store><    
    CompiledInstruction *post>`:
  {
    debugPrint("Found Assign Bit statement");
    if("00000.1" == bitAddress(logic))
    {
      andEqual = composeAndEqual(composeSourceRange(logic, store), compare, store);
      insert((CodeBlock)`<CompiledInstruction* pre><AndEqual andEqual><CompiledInstruction *post>`);
    }
    else
    {
      fail;
    }
  }
  
  /// LogicCondition
  case (CodeBlock) `<CompiledInstruction* pre><LogicInstruction logic><CompiledInstruction* post>`:
  {
    statements = [logic];
    while((CodeBlock)`<LogicInstruction logic><CompiledInstruction* newPost>`
    := (CodeBlock)`<CompiledInstruction* post>`)
    {
      post = newPost;
      statements += [logic];      
    }
    logicBlock = composeLogicCondition(statements);
    insert((CodeBlock)`<CompiledInstruction* pre><LogicCondition logicBlock><CompiledInstruction *post>`);
  }
  
  /// DecrementMinuteCounter
  case (CodeBlock) `<CompiledInstruction* pre><
    LogicCondition logic><
    SourcePrefix first>06 <WordAddress ones><NewLine _><
    SourcePrefix _>06 <WordAddress tens><NewLine _><
    SourcePrefix last>10 <BitAddress target><NewLine _><
    CompiledInstruction* post>`:
    {
     decrementCounter = parse(#DecrementCounter, debugPrint("Counter", "<composeEcbPrefix("Lime", composeSourceRange(first, last))>DecrementCounter <trim("<ones>")>,<trim("<tens>")> =\> <trim("<target>")> "));
     insert((CodeBlock)`<CompiledInstruction* pre><LogicCondition logic><DecrementCounter decrementCounter><CompiledInstruction *post>`);
    }

  
  /// DecrementSecondCounter
  case (CodeBlock) `<CompiledInstruction* pre><
  	LogicCondition logic><
  	SourcePrefix first>06 <WordAddress ones><NewLine _><
  	SourcePrefix _>06 <WordAddress tens><NewLine _><
  	SourcePrefix _>06 <WordAddress hundreds><NewLine _><
  	SourcePrefix _>06 <WordAddress thousands><NewLine _><
  	SourcePrefix last>10 <BitAddress target><NewLine _><
  	CompiledInstruction* post>`:
  	{
  		decrementCounter = parse(#DecrementCounter, debugPrint("Counter", "<composeEcbPrefix("Lime", composeSourceRange(first, last))>DecrementCounter <trim("<ones>")>,<trim("<tens>")>,<trim("<hundreds>")>,<trim("<thousands>")> =\> <trim("<target>")> "));
  		insert((CodeBlock)`<CompiledInstruction* pre><LogicCondition logic><DecrementCounter decrementCounter><CompiledInstruction *post>`);  	
  	}
  
  // TriggeredTimer
  case (CodeBlock) `<CompiledInstruction* pre><
    TriggerBlock triggerBlock><
    SourcePrefix first>06 <WordAddress ones><NewLine _><
    SourcePrefix _>06 <WordAddress tens><NewLine _><
    SourcePrefix _>06 <WordAddress hundreds><NewLine _><
    SourcePrefix _>06 <WordAddress thousands><NewLine _><
    SourcePrefix last>10 <BitAddress target><NewLine _><
    CompiledInstruction* post>`:
  {
    triggerExp = "";
    visit(triggerBlock)
    {
      case TriggerExpression TE:
      {
        triggerExp = "<TE>";
      }      
    }
    triggeredTimer = parse(#TriggeredTimer, debugPrint("TriggeredTimer", "<composeEcbPrefix("Lime", composeSourceRange(triggerBlock, last))>TriggeredTimer <triggerExp>counts <trim("<ones>")>,<trim("<tens>")>,<trim("<hundreds>")>,<trim("<thousands>")> =\> <trim("<target>")> "));
    insert((CodeBlock)`<CompiledInstruction* pre><TriggeredTimer triggeredTimer><CompiledInstruction *post>`);
  }
  /// Trigger
  case (CodeBlock) `<CompiledInstruction* pre><LogicCondition condition><EventInstruction trigger><CompiledInstruction* post>`:
  {
    triggerBlock = composeTrigger(condition, trigger);
    insert((CodeBlock)`<CompiledInstruction* pre><TriggerBlock triggerBlock><CompiledInstruction *post>`);
  }
  
  /// BitTrigger
  case (CodeBlock) `<CompiledInstruction* pre><TriggerBlock triggerBlock><AssignBit assignBit><CompiledInstruction* post>`:
  {
    // Make sure to include multiple assigns as well!
    bitTrigger = composeBitTrigger(triggerBlock, assignBit);
    debugPrint("inserting trigger: <bitTrigger>");
    insert((CodeBlock)`<CompiledInstruction* pre><BitTrigger bitTrigger><CompiledInstruction *post>`);
  } 
  
  /// AssignValue
  case (CodeBlock)`<CompiledInstruction *pre><ReadValue read><WriteValue write><CompiledInstruction *post>`:
  {
    assignValue = composeAssign(read, write);
    insert((CodeBlock)`<CompiledInstruction* pre><AssignValue assignValue><CompiledInstruction *post>`);  
  }
  
  /// AssignBooleanExpression
  case (CodeBlock)`<CompiledInstruction *pre><LogicCondition condition><AssignBit bit><CompiledInstruction *post>`:
  {
    debugPrint("Found a boolean assign using EQL");
    bits = [bit] ;
    while((CodeBlock)`<AssignBit bit><CompiledInstruction *newPost>` 
      := (CodeBlock)`<CompiledInstruction *post>`)
    {
      debugPrint("Total: <size(bits)> bits");
      bits += bit;
      post = newPost;
    }
    boolExpression = composeBooleanExpression(condition, bits);
    insert((CodeBlock)`<CompiledInstruction* pre><AssignBooleanExpression boolExpression><CompiledInstruction *post>`);
  }
  
  /// Trigger + Assign
  case (CodeBlock)`<CompiledInstruction* pre><
    TriggerBlock trigger><
    AssignBooleanExpression assign><
    CompiledInstruction* post>`:
    {
      debugPrint("Trigger + Assign:", "<trigger>, <assign>");
      triggerExp = "";
      
      visit(trigger)
      {
        case TriggerExpression TE:
        {
          debugPrint("Trigger: ", TE);
          triggerExp = "<TE>";
        }        
      }
      logicExp = "";
      targetRange = "" ;
      visit(assign)      
      {
        case LogicExpression LE:
        {
          debugPrint("Logic: ", LE);
          logicExp = "<LE>";
        }
        case BitAddressRange BAR:
        {
          debugPrint("Range: ", BAR);
          targetRange = "<BAR>";
        }
      }
      debugPrint("Data:", "<triggerExp>, <logicExp>, <targetRange>");
      triggeredAssignBoolean = parse(#TriggeredAssignBoolean, debugPrint("TriggeredAssignBoolean", "<composeEcbPrefix("Brown", composeSourceRange(trigger, assign))>TriggeredAssignBoolean <triggerExp>=\> <logicExp>to <targetRange>"));
      insert(CodeBlock)`<CompiledInstruction* pre><TriggeredAssignBoolean triggeredAssignBoolean><CompiledInstruction* post>`; 
    }
    
  /// IfBlock => Condition with a JUMP 
  case (CodeBlock)`<CompiledInstruction *pre><
    LogicCondition logic><
    SourcePrefix prefix>30<WhiteSpace _><WordAddress size><NewLine _><
    CompiledInstruction *post>`:
  {
    ifBlock = parse(#IfBlock, debugPrint("If Block:", "<composeEcbPrefix("Brown", composeSourceRange(logic, prefix))>IfBlock <logicExpression(logic)>size <trim("<size>")>"));
    insert((CodeBlock)`<CompiledInstruction* pre><IfBlock ifBlock><CompiledInstruction *post>`);
  } 
  
  /// Special patterns => Matched to specific implementations not matched by any of the generic parts
 
  /// PartialTrigger
  case (CodeBlock)`<CompiledInstruction* pre><
    EventInstruction trigger><
    AssignBit bitTarget><
    CompiledInstruction* post>`:
  {
    result = bitAddress(debugPrint("Trigger: ",trigger));
    target = bitAddress(debugPrint("Result: ", bitTarget));
    partialTrigger = parse(#PartialTrigger, debugPrint("Partial trigger:", "<composeEcbPrefix("Brown", composeSourceRange(trigger, bitTarget))>PartialTrigger <result> and <target> "));
    insert (CodeBlock)`<CompiledInstruction* pre><PartialTrigger partialTrigger><CompiledInstruction* post>`;
  }
  
  // Initial IO Sync
  case (CodeBlock)`<CompiledInstruction* pre><
    SourcePrefix prefix>25 <WordAddress address><NewLine _><    
    CompiledInstruction* post>`:
  {
    initCall = parse(#InitCall, debugPrint("InitCall: ", "<composeEcbPrefix("Brown", composeSourceRange(prefix))>InitCall at <trim("<address>")>"));
    insert (CodeBlock)`<CompiledInstruction* pre><InitCall initCall><CompiledInstruction* post>`;
  }
  
  /// Start of Temporal Storage
  case (CodeBlock)`<CompiledInstruction *pre><
    IfBlock ifBlock><
    ReadValue read><
    CompiledInstruction* post>`:
  {
    logicExp = "";
    readValue = "";
    visit(ifBlock)
    {
      case LogicExpression LE:
      {
        logicExp = "<LE>";
      }
    }
    visit(read)
    {
      case AddressRange AR:
      {
        readValue = "<AR>";
      }
    }
      
    if(isEmpty(readValue) || isEmpty(logicExp))
    {
      handleError("Invalid storage. read: <readValue> by Trigger: <logicExp>");
    }   
    partialRead = parse(#PartialRead, debugPrint("PartialRead:", "<composeEcbPrefix("Brown", composeSourceRange(ifBlock,read))>PartialRead <readValue> by <logicExp>"));
    insert (CodeBlock)`<CompiledInstruction* pre><PartialRead partialRead><CompiledInstruction* post>`; 
  }
     
  /// Partial Read
  case (CodeBlock)`<CompiledInstruction *pre><
    TriggerBlock trigger><
    JumpInstruction _><
    ReadValue read><
    CompiledInstruction* post>`:
  {
    triggerExp = "";
    readValue = "";
    visit(trigger)
    {
      case TriggerExpression TE:
      {
        triggerExp = "<TE>";
      }
    }
    visit(read)
    {
      case AddressRange AR:
      {
        readValue = "<AR>";
      }
    }     
      
    if(isEmpty(readValue) || isEmpty(triggerExp))
    {
      handleError("Invalid storage. read: <readValue> by Trigger: <triggerExp>");
    }
    partialRead = parse(#PartialRead, debugPrint("PartialRead:", "<composeEcbPrefix("Brown", composeSourceRange(trigger,read))>PartialRead <readValue> by <triggerExp>"));
    insert (CodeBlock)`<CompiledInstruction* pre><PartialRead partialRead><CompiledInstruction* post>`;
  }
    
  /// Start of Temporal Storage
  case (CodeBlock)`<CompiledInstruction *pre><
    LogicCondition logic><
    WriteValue write><
    CompiledInstruction* post>`:
  {
    logicExp = "";
    writeValue = "";
    visit(logic)
    {
      case LogicExpression LE:
      {
        logicExp ="<LE>";
      }
    }
    visit(write)
    {
      case AddressRange AR:
      {
        writeValue = "<AR>";
      }
    }
    if(isEmpty(writeValue) || isEmpty(logicExp))
    {
      handleError("Invalid storage. read: <writeValue> by Trigger: <logicExp>");
    }  
    partialWrite = parse(#PartialWrite, debugPrint("PartialWrite:", "<composeEcbPrefix("Brown", composeSourceRange(logic,write))>PartialWrite <writeValue> by <logicExp>"));
    insert (CodeBlock)`<CompiledInstruction* pre><PartialWrite partialWrite><CompiledInstruction* post>`;
  } 
    
  case (CodeBlock)`<CompiledInstruction* pre><
  PartialRead lastRead><
  PartialWrite write><
  CompiledInstruction* post>`:
  {
    // BackTrack for all combines reads
    debugPrint("Examining ComposedWrite");
    reads = "";
    visit(lastRead)
    {
      case PartialReadContent PRC:
      {
        reads = "<PRC>|";
      }
    }
    
    partialWrite = "";
    visit(write)
    {
      case PartialWriteContent PWC:
      {
        partialWrite = "<PWC>";
      }
    }        
     
    firstRead = lastRead;
    while( (CodeBlock)`<CompiledInstruction* newPre><PartialRead read>` 
      := (CodeBlock)`<CompiledInstruction* pre>`)
    {
      visit(read)
      {
        case PartialReadContent PRC:
        {
          reads = "<PRC>|<reads>";
        }
      }
      firstRead = read;            
      pre = newPre;      
    }     
    debugPrint("Total reads: <reads>");
    composedWrite = parse(#ComposedWrite, debugPrint("ComposedWrite:", "<composeEcbPrefix("Brown", composeSourceRange(firstRead,write))>ComposedWrite <reads> to <partialWrite>"));
    insert (CodeBlock)`<CompiledInstruction* pre><ComposedWrite composedWrite><CompiledInstruction* post>`;
  }
      
  
};

// (partial) model representations
ReadValue composeReadValue(list[str] statements) = parse(#ReadValue, "<composeEcbPrefix("Chocolate", statements)>ReadValue <addressRange(statements)>");
WriteValue composeWriteValue(list[str] statements) = parse(#WriteValue, "<composeEcbPrefix("Lime", statements)>WriteValue <addressRange(statements)>");
CompareValue composeCompareValue(list[str] statements) = parse(#CompareValue, "<composeEcbPrefix("LightSeaGreen", statements)>CompareValue <addressRange(statements)>");
IOSynchronization composeIOSynchronization(list[str] statements) = parse(#IOSynchronization, debugPrint("Composed IO sync: ", "<composeEcbPrefix("Brown", statements)>IOSynchronization <ioRange(statements)>"));
CompareValue composeCompareValue(ReadValue readValue, CompareValue compareValue) = parse(#CompareValue, "<composeEcbPrefix("LightSeaGreen", composeSourceRange(readValue, compareValue))>CompareValue <addressRange(readValue, compareValue)>");
AssignValue composeAssign(ReadValue readValue, WriteValue writeValue) = parse(#AssignValue, "<composeEcbPrefix("Lime", composeSourceRange(readValue, writeValue))>AssignValue <addressRange(readValue, writeValue)>");
AndEqual composeAndEqual(SourceRange programLines, CompareValue compare, StoreBit result) = parse(#AndEqual, debugPrint("AndEqual:", "<composeEcbPrefix("Tomato", programLines)>AndEqual <compareRange(compare)> =\> <bitAddress(result)> ")); 
NopBlock composeNopBlock(SourceRange programLines) = parse(#NopBlock, "<composeEcbPrefix("LightGrey", programLines)>NopBlock");
LogicCondition composeLogicCondition(list[LogicInstruction] statements) = parse(#LogicCondition, "<composeEcbPrefix("Tomato", statements)>LogicCondition <formatLogic(statements)>");
TriggerBlock composeTrigger(LogicCondition condition, EventInstruction trigger) = parse(#TriggerBlock, "<composeEcbPrefix("OliveDrab", composeSourceRange(condition, trigger))>TriggerBlock <bitAddress(trigger)> =\> <extractCondition(condition)>");
BitTrigger composeBitTrigger(TriggerBlock trigger, AssignBit triggerBit) = parse(#BitTrigger, "<composeEcbPrefix("Cyan", composeSourceRange(trigger, triggerBit))>BitTrigger <composeBitTrigger(trigger, bitAddress(triggerBit))>");
AssignBooleanExpression composeBooleanExpression(LogicCondition condition, list[AssignBit] bits )
{
  sourceRange = debugPrint(composeSourceRange(condition, last(bits)));
  condition = debugPrint(extractCondition(condition));
  bitInfo = "";
  for(bit <- bits)
  {
    visit(bit)
    {
      case BitAddress BA:
      {
        bitInfo += "<trim("<BA>")> ";
      }
    }
  }
  total = debugPrint("<trim("<composeEcbPrefix("Yellow", sourceRange)>AssignBooleanExpression <condition>")> to <bitInfo>");
  return parse(#AssignBooleanExpression, total);
}

str logicExpression(&T logicItem)
{
  visit(logicItem)
  {
    case LogicExpression LE:
    {
      return "<LE>";
    } 
  }
  return "NO_LOGIC_EXPRESSION";
}

str jumpSize(&T jumpInstruction)
{
  visit(jumpInstruction)
  {
    case WordAddress WA:
    {
      return "<WA>";
    }
  }
  handleError("No size found");
  return "NO_SIZE_IN_JUMP";
}

str compareRange(CompareValue compareValue)
{
  visit(compareValue)
  {
    case CompareStatement CS:
    {
      return "<CS>";
    }    
  }
  return handleError("Unable to find info for comparison");
}

str composeBitTrigger(TriggerBlock trigger, str address)
{
  debugPrint("Composing: <address> and <trigger>");
  expression = "";
  visit(trigger)
  {
    case TriggerExpression LE:
    {
      return "<address> by <LE>";
    }    
  }
  return "UNKNOWN_TRIGGER_EXPRESSION"; 
}


str extractCondition(LogicCondition logic)
{
  visit(logic)
  {
    case LogicExpression L:
    {
      debugPrint("-|<L>|-");
      return "<L>";
    }
  }  
  return handleError("Invalid logic whilst evaluating expressin: <logic>");
}

str formatLogic(list[LogicInstruction] statements)
{
  firstStatement = true;
  totalCondition = "" ;
  for(statement <- statements)
  {
    localCondition = "";
    debugPrint("visiting <statement>");    
    visit(statement)
    {
      case (LogicInstruction)`<SourcePrefix prefix>16 <BitAddress address><NewLine nl>`:
      {
        if(false == firstStatement)
        {
          localCondition += "AND ";
        } 
        localCondition += "<trim("<address>")> ";
        firstStatement = false;
      }
      case (LogicInstruction)`<SourcePrefix prefix>17 <BitAddress address><NewLine nl>`:
      {
        if(false == firstStatement)
        {
          localCondition += "AND ";
        } 
        localCondition += "NOT <trim("<address>")> ";
        firstStatement = false;   
      }
      case (LogicInstruction)`<SourcePrefix prefix>18 <BitAddress address><NewLine nl>`:
      {
        if(false == firstStatement)
        {
          localCondition += "OR ";          
        }
        localCondition += "<trim("<address>")> ";
        firstStatement = false;
      }
      case (LogicInstruction)`<SourcePrefix prefix>19 <BitAddress address><NewLine nl>`:
      {
        if(false == firstStatement)
        {
          localCondition += "OR ";
        }
        localCondition += "NOT <trim("<address>")> ";
        firstStatement = false;      
      }
            
      default:
        ;
    }  
    totalCondition += localCondition;  
  }
  debugPrint("total condition: <totalCondition>");
  return totalCondition;
}

str ioRange(list[str] statements) = "00000 to 12345";