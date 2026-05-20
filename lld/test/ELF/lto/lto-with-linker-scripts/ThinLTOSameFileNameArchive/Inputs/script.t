SECTIONS {
  .special : { *(.text.otherfun2) }
  .alltext : { *(.text.*) }
  .ARM.exidx : { *(.ARM.exidx*) }
}

