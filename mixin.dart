mixin Drivable {
  void drive() {
    print('Driving to the destination');
  }
}
mixin locationUpdateable {
  void locationUpdate(String Location) {
    print('Location is updated to $Location');
  }
}

class Person with Drivable, locationUpdateable {
  String? name;
  Person(this.name);

  void StartDelivary() {
    print('Name of the person who delivery $name');
    drive();
    locationUpdate("japan");
  }
}

class Robot with Drivable, locationUpdateable {
  final String? id;
  Robot(this.id);

  void startDelivery() {
    print('Id of the Robot $id');
    drive();
    locationUpdate("Bangladesh");
  }
}

class Customer with locationUpdateable {
  String? name;

  Customer(this.name);

  void notifyCustomer(String location) {
    print('Name of the Customer $name');
    locationUpdate(location);
  }
}

void main() {
  Person person = Person("shobuj");
  person.StartDelivary();

  Robot robot = Robot("RX-010X02");
  robot.startDelivery();

  Customer customer = Customer("Bhuiyan");
  customer.notifyCustomer("arrived at the destination");
}
