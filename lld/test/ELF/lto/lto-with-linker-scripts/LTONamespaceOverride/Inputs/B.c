static int *Bfun1(int x) {
  return 0;
}

int *Bfun2(int y) {
  return Bfun1(y);
}

extern int *Afun2(int x);

int main() {
  Afun2(0);
  Bfun2(0);
}

