import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:teledentistry_app/components/rounded_button.dart';
import 'package:teledentistry_app/screens/login/login_screen.dart';
import 'package:teledentistry_app/screens/signup/signup_screen.dart';
import 'package:teledentistry_app/screens/welcome/components/background_welcome_screen.dart';
import 'package:teledentistry_app/utils/constants.dart';

class BodyWelcomeScreen extends StatelessWidget {
  const BodyWelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundWelcomeScreen(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            textTitle(),
            pictureChat(context),
            sizedBox(context),
            btnLogin(context),
            btnSignup(context),
          ],
        ),
      ),
    );
  }

  Text textTitle() {
    return const Text(
      'WELCOME TO TELEDENTIST',
      style: TextStyle(fontWeight: FontWeight.bold),
    );
  }

  SvgPicture pictureChat(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SvgPicture.asset(
      'assets/icons/chat.svg',
      height: size.height * 0.4,
    );
  }

  SizedBox sizedBox(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.001,
    );
  }

  RoundedButton btnLogin(BuildContext context) {
    return RoundedButton(
      text: 'LOGIN',
      press: () {
        Navigator.of(context).push(_loginScreen());
      },
    );
  }

  RoundedButton btnSignup(BuildContext context) {
    return RoundedButton(
      text: 'SIGN UP',
      textColor: Colors.black,
      backgroundColor: kPrimaryLightColor,
      press: () {
        Navigator.of(context).push(_signupScreen());
      },
    );
  }

  Route _loginScreen() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const LoginScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 0.1);
        const end = Offset.zero;
        const curve = Curves.easeIn;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Route _signupScreen() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const SignUpScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 0.1);
        const end = Offset.zero;
        const curve = Curves.easeIn;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
