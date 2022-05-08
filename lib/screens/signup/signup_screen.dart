import 'package:flutter/material.dart';
import 'package:teledentistry_app/screens/signup/components/body_signup_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BodySignUpScreen(),
    );
  }
}
