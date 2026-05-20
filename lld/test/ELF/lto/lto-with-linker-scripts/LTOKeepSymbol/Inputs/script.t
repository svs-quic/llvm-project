SECTIONS {
  .baz : { KEEP(*(.text.baz*)) }
  .keeprodata : { KEEP(*(.rodata*)) }
  .mytext : { *(.text*) }
}
