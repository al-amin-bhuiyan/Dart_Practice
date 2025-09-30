abstract class Shape {
  double dim1, dim2;
  Shape(this.dim1, this.dim2);
  void area();
}

class Rectangle extends Shape {
  Rectangle(double dim1, double dim2) : super(dim1, dim2);

  void area() {
    print("Area of the Rectangle ${dim1 * dim2}");
  }
}

class Triangle extends Shape {
  Triangle(double dim1, double dim2) : super(dim1, dim2);
  void area() {
    print("The Area of the Triangle is ${0.5 * dim1 * dim2}");
  }
}

void main() {
  print("sdfdsfsdfsdfsdafsdf");
  Rectangle rectangle = Rectangle(10.54, 234.323);
  rectangle.area();

  Triangle triangle = Triangle(33.332, 324.324);
  triangle.area();
}
