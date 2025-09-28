class Super_key {
  Super_key({required String name, required int age}) {
    print((name));
    print("I am from parent class");
  }
}

class subclass extends Super_key {
  subclass({required String name, required int age})
    : super(name: name, age: age) {
    print("from subclass");
  }
}

void main() {
  subclass sub = subclass(name: 'Shobuj', age: 25);
}
