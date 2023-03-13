import 'package:flutter/material.dart';
import 'package:signin_and_signup/app/app_route.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.route});

  final bool route;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: false,
      ),
      onGenerateRoute: (settings) => MyRoutes().onGenerateRoute(
        settings,
        route,
      ),
    );
  }
}
