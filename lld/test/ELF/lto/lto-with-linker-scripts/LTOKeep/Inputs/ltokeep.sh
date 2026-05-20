cat > foo.c << \!
int foo() {
  return bar();
}
!

cat > main.c << \!
int main() {
  return 0;
}

int bar() {
  return 0;
}
!

cat > script.t << \!
SECTIONS {
  .text.foo : { KEEP(*(.text.foo)) }
  .text.others : { *(.text.*) }
}
!

hexagon-clang -c foo.c  -ffunction-sections -flto
hexagon-clang -c main.c   -ffunction-sections
hexagon-link  foo.o main.o  --trace=lto  -T script.t -flto-options=optimal-preservelist
