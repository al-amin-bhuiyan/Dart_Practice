class factory_constructor__ {
  String name = "default";
  int age = 0;
  factory_constructor__(this.name, this.age);

  factory factory_constructor__.named(Map<String, int> map) {
    final name = map.keys.first;
    final age = map.values.first;

    return factory_constructor__(name, age);
  }
}

void main() {
  print(" Factory Constructor Example");
  factory_constructor__ obj = factory_constructor__.named({"John": 25});
  print("Name: ${obj.name}, Age: ${obj.age}");
}
