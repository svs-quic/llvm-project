SECTIONS {
  .special : { *.2.o(.text.nomatch) }
  .alltext : { *(.text.*) }
}
