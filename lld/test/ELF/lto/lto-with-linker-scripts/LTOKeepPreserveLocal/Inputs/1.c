static int data = 10;
__attribute__((section(".text.foo"))) static int foo = 20;

int main() { return foo + data; }
