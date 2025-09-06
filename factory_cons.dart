class factory_ {
  void f() {
    print("hello");
  }
  void get get g => print("getter");
  
}


void main() {
  factory_ fac = factory_();
  fac.f();
}
