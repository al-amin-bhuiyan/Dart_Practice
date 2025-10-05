enum Factorytype { car, bike, truck }

abstract class vehicle {
  factory vehicle(Factorytype type) {
    switch (type) {
      case Factorytype.car:
        return car();
      case Factorytype.bike:
        return bike();
      case Factorytype.truck:
        return truck();
    }
  }
}

class car implements vehicle {
  car() {
    print("car method is called");
  }
}

class bike implements vehicle {
  bike() {
    print("bike method is called");
  }
}

class truck implements vehicle {
  truck() {
    print("truck method is called");
  }
}

void main() {
  vehicle obj = vehicle(Factorytype.car);
  vehicle obj2 = vehicle(Factorytype.bike);
  vehicle obj3 = vehicle(Factorytype.truck);
}
