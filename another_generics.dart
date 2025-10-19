class Person {
  double named<T extends num>(T value1, T value2) {
    return (value1 + value2) / 2;
  }
}

void main() {
  Person p = Person();
  final time = DateTime.now();
  print("${time.day} ${time.hour} ${time.minute} ${time.second} ${time.month}");
  print("The average is ${p.named<int>(3, 5)}");
  print("The average is ${p.named<double>(3.5, 5.5)}");
}
