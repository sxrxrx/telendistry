import 'package:flutter/material.dart';
import 'package:teledentistry_app/screens/login/components/body_login_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BodyLoginScreen(),
    );
  }
}
