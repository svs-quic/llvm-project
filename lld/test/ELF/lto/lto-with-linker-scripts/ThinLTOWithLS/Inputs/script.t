SECTIONS {
  .special : { *.2.o(.text.otherfun2) }
  .alltext : { *(.text.*) }
  .ARM.exidx : { *(.ARM.exidx*) }
}

