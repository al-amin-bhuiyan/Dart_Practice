class StaticKeyWord {
  static int x = 0;

  void counter() {
    x++;
  }

  void display() {
    print("value of x ${x}");
  }
}

void main() {
  StaticKeyWord st = StaticKeyWord();
  st.counter();
  st.display();
  StaticKeyWord st2 = StaticKeyWord();
  st2.counter();
  st2.display();
}
