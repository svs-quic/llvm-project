static int foo(int x) { return x * 10; }

int bar(int y) { return foo(y * 10); }

int baz(int z) { return foo(z * 20); }

int main(int argc) { return bar(argc) + baz(argc); }
