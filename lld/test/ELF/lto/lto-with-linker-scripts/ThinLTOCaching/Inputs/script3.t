/* Identical to script.t except for this comment */
SECTIONS {
  .special : { *.lib.a:(.text.otherfun2) }
  .alltext : { *(.text.*) }
}

