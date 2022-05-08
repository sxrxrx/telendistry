import 'package:flutter/material.dart';

class BackgroundSignUpScreen extends StatelessWidget {
  final Widget child;

  const BackgroundSignUpScreen({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(0),
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            child: Image.asset(
              'assets/images/signup_top.png',
              width: size.width * 0.35,
            ),
            top: 0,
            left: 0,
          ),
          Positioned(
              bottom: 0,
              left: 0,
              child: Image.asset(
                'assets/images/main_bottom.png',
                width: size.width * 0.25,
              )),
          child,
        ],
      ),
    );
  }
}
