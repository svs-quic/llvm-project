SECTIONS {
  .text.main : { *1.o(.text.main) }
  .text.bar : { *1.o(.text.bar) }
  .myrodata : { *1.o(.rodata*)  }
  .mydata : { *1.o(.data.s) }
  .unrecognized : { *1.o(*) }
}
