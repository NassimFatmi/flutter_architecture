import 'package:flutter/material.dart';
import 'package:mvvm/widgets/widgets.dart';
import '../home/home_screen.dart';

class Login extends StatelessWidget {
  static const route = "/login";
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GacelaButton(
            onPressed: () {
              Navigator.pushNamed(context, Home.route);
            },
            child: const Text("Login")),
      ),
    );
  }
}
