class CounterState {
  int _counter = 0;

  int get counter => _counter;

  void increment() {
    _counter++;
    //create login screen
    print("count plus");
  }

  void decrement() {
    _counter--;
    print("count minus");
  }
}
