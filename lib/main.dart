import 'package:custom_provider/counter_display.dart';
import 'package:custom_provider/counter_provider.dart';

import 'package:custom_provider/counter_state.dart';
import 'package:custom_provider/login_provider.dart';
import 'package:custom_provider/login_state.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Login State Example'),
        ),
        body: CounterProvider(
          counterState: CounterState(),
          child: LoginProvider(
            loginState: LoginState(),
            child: const Center(
              child: Column(
                children: [
                  LoginApp(),
                  Gap(50),
                  CounterApp(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LoginApp extends StatefulWidget {
  const LoginApp({super.key});

  @override
  State<LoginApp> createState() => _LoginAppState();
}

class _LoginAppState extends State<LoginApp> {
  @override
  Widget build(BuildContext context) {
    final loginState = LoginProvider.of(context)!.loginState;
    print("LoginApp widget build");

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Logged in: ${loginState.isLoggedIn}'),
        TextButton(
          onPressed: () {
            if (loginState.isLoggedIn) {
              loginState.logout();
              setState(() {});
            } else {
              loginState.login();
              setState(() {});
            }
          },
          child: Text(loginState.isLoggedIn ? 'Logout' : 'Login'),
        ),
      ],
    );
  }
}

class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  @override
  Widget build(BuildContext context) {
    print("CounterApp widget build");
    return Center(
      child: Column(
        children: [
          const CounterDisplay(),
          Text('Counter: ${CounterProvider.of(context).counterState.counter}'),
          // Other widgets that depend on the counter state

          FloatingActionButton(
            onPressed: () {
              CounterProvider.of(context).counterState.increment();
              setState(() {});
            },
            child: const Icon(Icons.add),
          ),
          Gap(20),
          FloatingActionButton(
            onPressed: () {
              CounterProvider.of(context).counterState.decrement();
              setState(() {});
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
