class Practice_factory {
  int x;
  int y;
  Practice_factory(this.x, this.y) {
    print("i am from constructor " + x.toString() + " " + y.toString());
  }
  factory Practice_factory.named({required int x, required int y}) {
    print("hi from named factory constructor");
    return Practice_factory(x, y);
  }
  factory Practice_factory.another() {
    print("hi from another factory constructor");
    return Practice_factory.named(x: 0, y: 0);
  }
}

void main() {
  Practice_factory p = Practice_factory.another();
}
