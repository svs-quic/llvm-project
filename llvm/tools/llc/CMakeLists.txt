set(LLVM_LINK_COMPONENTS
  AllTargetsAsmParsers
  AllTargetsCodeGens
  AllTargetsDescs
  AllTargetsInfos
  Analysis
  AsmPrinter
  CodeGen
  CodeGenTypes
  Core
  IRPrinter
  IRReader
  MC
  MIRParser
  Passes
  Remarks
  ScalarOpts
  SelectionDAG
  Support
  Target
  TargetParser
  TransformUtils
  Vectorize
  )

add_llvm_tool(llc
  llc.cpp
  NewPMDriver.cpp

  DEPENDS
  intrinsics_gen
  SUPPORT_PLUGINS
  EXPORT_SYMBOLS_FOR_PLUGINS
  )
