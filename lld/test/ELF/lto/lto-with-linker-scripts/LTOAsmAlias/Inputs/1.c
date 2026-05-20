__asm__(".global alias_foo\n.set alias_foo, foo");

int foo() {
  return 0;
}
