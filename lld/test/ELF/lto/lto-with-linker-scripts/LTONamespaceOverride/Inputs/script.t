SECTIONS {
  .foo : {
     __foo_A = .;
     *A.o(.text.*)
     __foo_B = .;
     *B.o(.text.*)
     __foo_end = .;
     }
}
