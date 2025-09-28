class Super_key {
  Super_key(String name, int age) {
    print((name));
    print("I am from parent class");
  }
}

class subclass extends Super_key {
  subclass() : super("Shobuj", 25) {
    print("from subclass");
  }
}

void main() {
  subclass sub = subclass();
}
