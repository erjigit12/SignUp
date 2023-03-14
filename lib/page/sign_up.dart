// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:signin_and_signup/page/my_home_page.dart';
import 'package:signin_and_signup/page/sign_in.dart';
import 'package:signin_and_signup/services/user_state_services.dart';

class SingUp extends StatelessWidget {
  SingUp({Key? key}) : super(key: key);

  final nameCtl = TextEditingController();
  final lastNameCtl = TextEditingController();
  final passwordCtl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SingUp'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextFormField(
              controller: nameCtl,
            ),
            TextFormField(
              controller: lastNameCtl,
            ),
            TextFormField(
              controller: passwordCtl,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignIn();
                    },
                  ),
                );
              },
              child: const Text(
                'Go to the Sign in',
                style: TextStyle(fontSize: 22),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                await services.SignUp(
                  name: nameCtl.text,
                  lastName: lastNameCtl.text,
                  password: passwordCtl.text,
                );
                await Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const MyHomePage();
                    },
                  ),
                  (route) => false,
                );
              },
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
