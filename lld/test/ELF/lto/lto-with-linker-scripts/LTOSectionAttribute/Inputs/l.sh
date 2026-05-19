cat > 1.c << \!
__attribute__((section(".foo"))) int foo() {
  return 0;
}
!

cat > 2.c << \!
__attribute__((section(".foo"))) int bar() {
  return 0;
}
!

cat > 3.c << \!
int main() { return foo() + bar(); }
!

cat > script.t << \!
SECTIONS {
.myfoo : { 1.o*(.foo) }
.mybar : { 2.o*(.foo) }
.main : { *(.text) }
}
!

hexagon-clang -c -flto 1.c
hexagon-clang -c -flto 2.c
hexagon-clang -c 3.c
# Bug
hexagon-link 1.o 2.o 3.o -T script.t --trace=lto
