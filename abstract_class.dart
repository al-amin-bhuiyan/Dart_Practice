abstract class Animal {
  String? sound;
  makesound(); //abstract method

  void display(String sound) {
    //concreate method
    this.sound = sound;

    print("Animal sound $sound");
  }
}

class Dog extends Animal {
  makesound() {
    print("DOG");
  }
}

void main() {
  Dog dog = Dog();
  dog.makesound();
  dog.display("Aa Aa");
}
