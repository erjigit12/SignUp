// ignore_for_file: library_private_types_in_public_api, non_constant_identifier_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:signin_and_signup/models/user_model.dart';
import 'package:signin_and_signup/page/sign_up.dart';
import 'package:signin_and_signup/services/user_state_services.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  UserModel? user;

  @override
  void initState() {
    super.initState();
    GetUser();
  }

  Future<void> GetUser() async {
    user = await services.GetUser();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyHomePage'),
      ),
      body: Column(
        children: [
          Card(
            child: ListTile(
              leading: Text(user?.id ?? ''),
              title: Text(user?.name ?? ''),
              subtitle: Text(user?.lastName ?? ''),
              trailing: Text(user?.password ?? ''),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              await services.SignOut();
              await Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SingUp();
                  },
                ),
                (route) => false,
              );
            },
            child: const Text('Sign out'),
          ),
          ElevatedButton(
            onPressed: () async {
              await services.Delete();
              await Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SingUp();
                  },
                ),
                (route) => false,
              );
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
