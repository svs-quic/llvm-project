/* Identical to script.t except for this comment */
SECTIONS {
  .special : { *.2.o(.text.otherfun2) }
  .alltext : { *(.text.*) }
}
