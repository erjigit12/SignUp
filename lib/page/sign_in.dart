// ignore_for_file: use_build_context_synchronously

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:signin_and_signup/page/my_home_page.dart';
import 'package:signin_and_signup/services/user_state_services.dart';

class SignIn extends StatelessWidget {
  SignIn({Key? key}) : super(key: key);

  final nameCtl = TextEditingController();
  final passwordCtl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SignIn'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextFormField(controller: nameCtl),
            TextFormField(controller: passwordCtl),
            ElevatedButton(
              onPressed: () async {
                final isTrue = await services.SignIn(
                  name: nameCtl.text,
                  password: passwordCtl.text,
                );
                if (isTrue) {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const MyHomePage();
                      },
                    ),
                    (route) => false,
                  );
                } else {
                  print('Login or password incorrect');
                }
              },
              child: const Text('Sign in'),
            ),
          ],
        ),
      ),
    );
  }
}
