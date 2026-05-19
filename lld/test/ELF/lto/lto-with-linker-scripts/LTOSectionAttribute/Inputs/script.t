SECTIONS {
.myfoo : { *1.o*(.foo) }
.mybar : { *2.o*(.foo) }
.main : { *(.text) }
}
