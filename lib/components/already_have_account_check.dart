import 'package:flutter/material.dart';
import 'package:teledentistry_app/utils/constants.dart';

class AlreadyHaveAccountCheck extends StatelessWidget {
  final bool login;
  final VoidCallback press;

  const AlreadyHaveAccountCheck({
    Key? key,
    this.login = true,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(login ? "Don't have an Account? " : "Already have an Account? ",
            style: const TextStyle(color: kPrimaryColor)),
        GestureDetector(
          onTap: press,
          child: Text(login ? "Sign Up" : "Sign In",
              style: const TextStyle(
                  color: kPrimaryColor, fontWeight: FontWeight.bold)),
        )
      ],
    );
  }
}
