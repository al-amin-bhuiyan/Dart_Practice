class school {
  int x = 4;
  String? name;
  int? age;
  List<String> name_of_the_student = [];
  void display() {
    print(x);
  }

  school() {
    name_of_the_student.add("Shobuj");
    name_of_the_student.add("al-amin");
    name_of_the_student.addAll(["kuddus", "ali "]);
    name_of_the_student =
        name_of_the_student.map((e) => e + " bhuiyan").toList();
    print(name_of_the_student);
  }
}

class student extends school {
  student() {
    print(x);
  }
}

void main() {
  student st = student();
}
