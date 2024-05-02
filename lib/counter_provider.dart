import 'package:custom_provider/counter_state.dart';
import 'package:flutter/material.dart';

class CounterProvider extends InheritedWidget {
  final CounterState counterState;

  const CounterProvider({super.key, required super.child, required this.counterState});
  static CounterProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CounterProvider>()!;
  }

  @override
  bool updateShouldNotify(CounterProvider oldWidget) {
    return counterState != oldWidget.counterState;
  }
}
