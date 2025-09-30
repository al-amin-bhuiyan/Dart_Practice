mixin run {
  void running(String object) {
    print("the ${object} running");
  }
}
mixin walk {
  void walking(String object) {
    print("the ${object} is walking");
  }
}

class Animal with run, walk {
  String? name;
  Animal(this.name) {
    running(name!);
    walking(name!);
  }
}

void main() {
  Animal animal = Animal("Dog");
}
