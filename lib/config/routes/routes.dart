import 'package:flutter/material.dart';
import '../../views/screens.dart';

class Routes {
  static final Map<String, Widget Function(BuildContext)> routes = {
    Home.route: (_) => const Home(),
    Register.route: (_) => const Register(),
    Login.route: (_) => const Login(),
  };
}
