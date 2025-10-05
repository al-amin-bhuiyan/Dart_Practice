class use_of_genrics<T> {
  T data;
  use_of_genrics(this.data);
}

void main() {
  use_of_genrics<int> data1 = use_of_genrics<int>(33);
  use_of_genrics<double> data2 = use_of_genrics(434.434);
  print("${data1.data}");
  print("${data2.data}");
}
