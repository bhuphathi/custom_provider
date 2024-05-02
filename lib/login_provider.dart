import 'package:custom_provider/login_state.dart';
import 'package:flutter/material.dart';

class LoginProvider extends InheritedWidget {
  final LoginState loginState;

  const LoginProvider({super.key, required super.child, required this.loginState});

  static LoginProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<LoginProvider>();
  }

  @override
  bool updateShouldNotify(LoginProvider oldWidget) {
    return loginState != oldWidget.loginState;
  }
}
