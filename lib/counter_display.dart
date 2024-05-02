import 'package:custom_provider/counter_provider.dart';
import 'package:flutter/material.dart';

class CounterDisplay extends StatelessWidget {
  const CounterDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    final counterProvider = CounterProvider.of(context);
    return Text('Counter: ${counterProvider.counterState.counter}');
  }
}
