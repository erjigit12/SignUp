import 'package:flutter/material.dart';
import 'package:signin_and_signup/app/app.dart';
import 'package:signin_and_signup/services/user_state_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final isRegistered = await services.isRegister();
  runApp(MyApp(route: isRegistered));
}
