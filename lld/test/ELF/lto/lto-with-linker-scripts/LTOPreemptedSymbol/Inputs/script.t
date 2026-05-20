SECTIONS {
  .tcm : { KEEP (*(.tcm_static)) }
  .text : { *(.text*) }
}
