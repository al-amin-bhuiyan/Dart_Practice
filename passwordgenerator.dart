import 'dart:math';

class Passwordgenerator {
  static String generate() {
    List<String> alphabet = 'abcdefghijklmnopqrstuvwxyz'.split('');
    List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0];
    List<String> character = '!@#%^&*()_+'.split('');
    List<String> password = [];
    password.add(alphabet[Random().nextInt(alphabet.length)]);
    password.add(numbers[Random().nextInt(numbers.length)].toString());
    password.add(character[Random().nextInt(character.length)]);
    return password.join();
  }
}

void main() {
  Passwordgenerator ps = Passwordgenerator();
  print("heda");
  print(Passwordgenerator.generate());
}
