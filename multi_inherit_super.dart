import 'dart:io';

class MultiInheritSuper {
  MultiInheritSuper.named() {
    print("parent class");
  }
}

class Student extends MultiInheritSuper {
  Student.named() : super.named() {
    print("sub class");
  }
}

class Book extends Student {
  Book.named() : super.named() {
    print("from sub sub class");
  }
}

void main() {
  Book bs = Book.named();
}
