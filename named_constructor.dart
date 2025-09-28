class NamedConstructor {
  school() {
    print("default constructor");
  }

  NamedConstructor.named() {
    print("from named constructor");
  }
}

class student extends NamedConstructor {
  student() : super.named() {
    print("subclass");
  }
}

void main() {
  student st = student();
}
