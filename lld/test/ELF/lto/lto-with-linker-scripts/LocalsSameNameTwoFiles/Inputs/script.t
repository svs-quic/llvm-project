SECTIONS {
  .text.foo : { *1.o(.text.foo) }
  .text.baz : { *1.o(.text.baz) }
  .mydata1 : { *1.o(.data.bar) }
  .mydata2 : { *2.o(.data.bar) }
}
