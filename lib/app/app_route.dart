import 'package:flutter/material.dart';
import 'package:signin_and_signup/page/my_home_page.dart';
import 'package:signin_and_signup/page/sign_up.dart';

class MyRoutes {
  static const init = '/';
  static const home = '/home';
  static const register = 'register';

  Route? onGenerateRoute(RouteSettings settings, bool isRegister) {
    switch (settings.name) {
      case init:
        return MaterialPageRoute(
          builder: (_) => isRegister ? const MyHomePage() : SingUp(),
        );
      case home:
        return MaterialPageRoute(builder: (_) => const MyHomePage());
      case register:
        return MaterialPageRoute(builder: (_) => SingUp());
      default:
        return MaterialPageRoute(builder: (_) => SingUp());
    }
  }
}
