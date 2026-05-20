extern int *Bfun2(int y);

static int *Afun1(int x) __attribute__((noinline));

static int *Afun1(int x) {
  return Bfun2(0);
}

int *Afun2(int y) {
  return Afun1(0);
}

