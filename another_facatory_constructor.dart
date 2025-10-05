class Person {
  final String name;
  Person._internal(this.name);

  static final Map<String, Person> _cache = <String, Person>{};

  factory Person.named(String name) {
    if (_cache.containsKey(name)) {
      return _cache[name]!;
    } else {
      final person = Person._internal(name);
      _cache[name] = person;
      return person;
    }
  }
}

void main() {
  Person obj1 = Person.named("Shobuj");
  Person obj2 = Person.named("Bhuiyan");
  Person obj4 = Person.named("Shobuj");
  print("${obj1.name} and the hascode is ${obj1.hashCode}");
  print("${obj2.name} and the hascode is ${obj2.hashCode}");
  print("${obj4.name} and the hascode is ${obj4.hashCode}");
}
