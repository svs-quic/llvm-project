SECTIONS {
  .text.foo : { KEEP(*(.text.foo)) }
  .text.others : { *(.text.*) }
}
