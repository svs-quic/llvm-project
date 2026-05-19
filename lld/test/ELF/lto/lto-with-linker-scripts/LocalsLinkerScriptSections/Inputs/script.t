SECTIONS {
  .myfoo : { *(.text.foo)}
  .mybar : { *1.o(.text.bar)}
  .mybaz : { *1.o(.text.baz)}
}
