void main() {
  print("Start");
  getdata();
  print("END");
}

void getdata() async {
  try {
    String data = await middlename();
    print(data);
  } catch (e) {
    print("Error: $e");
  }
}

Future<String> middlename() async {
  return Future.delayed(Duration(seconds: 5), () => 'Mark');
}
