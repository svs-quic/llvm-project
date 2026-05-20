int baz();
void baz3();
void baz2();
#define __NR_syscalls 2
void * const sys_call_table[__NR_syscalls] = {
        [0 ... __NR_syscalls - 1] = baz };
__attribute__((visibility("hidden"))) int foo() { return 0; }
__attribute__((weak)) int bar() { return 0; }
void baz1() { baz2(); }
void baz2() { baz3(); }
void baz3() { foo() + baz(); }
int baz() { return 0; }
