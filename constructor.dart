class Constructor {
  Constructor() {
    print("Constructor");
  }
}

class Default_Constructor extends Constructor {
  Default_Constructor() : super() {
    print("Default Constructor");
  }
}

void main() {
  Default_Constructor c = Default_Constructor();
}
