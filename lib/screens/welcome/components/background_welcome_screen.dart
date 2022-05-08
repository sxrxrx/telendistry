import 'package:flutter/material.dart';

class BackgroundWelcomeScreen extends StatelessWidget {
  final Widget child;
  const BackgroundWelcomeScreen({
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
              top: 0,
              left: 0,
              child: Image.asset(
                'assets/images/main_top.png',
                width: size.width * 0.3,
              )),
          Positioned(
            child: Image.asset(
              'assets/images/main_bottom.png',
              width: size.width * 0.2,
            ),
            bottom: 0,
            left: 0,
          ),
          child,
        ],
      ),
    );
  }
}
