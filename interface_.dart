abstract class interface_p {
  void run();
  void walk();
}

class Student implements interface_p {
  String? name;

  Student.named(this.name);

  void run() {
    print("${name} is running");
  }

  void walk() {
    print("${name} is walking ");
  }
}

void main() {
  Student st = Student.named("Al-Amin");
  st.run();
  st.walk();
}
