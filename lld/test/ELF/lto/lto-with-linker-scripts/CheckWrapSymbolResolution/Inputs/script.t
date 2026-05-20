SECTIONS {
 .near : {
    *(.text.main)
    *(.text.foo)
    *(.text.bar)
    *(.text.b1)
    *(.text.b2)
  }

  . = 0xF000000;
  .wrap : {
    *(.text.__wrap_foo)
  }
}
