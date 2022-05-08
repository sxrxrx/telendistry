import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:io';
import 'package:teledentistry_app/components/already_have_account_check.dart';
import 'package:teledentistry_app/components/rounded_button.dart';
import 'package:teledentistry_app/components/rounded_input_field.dart';
import 'package:teledentistry_app/components/rounded_password_field.dart';
import 'package:teledentistry_app/data/register_model_result.dart';
import 'package:teledentistry_app/screens/login/login_screen.dart';
import 'package:teledentistry_app/screens/signup/components/background_signup_screen.dart';

import 'package:teledentistry_app/utils/helper.dart';

class BodySignUpScreen extends StatefulWidget {
  const BodySignUpScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<BodySignUpScreen> createState() => _BodySignUpScreenState();
}

class _BodySignUpScreenState extends State<BodySignUpScreen> {
  final formKey = GlobalKey<FormState>();
  late String _email;
  late dynamic _password;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
 
  var ActiveConnection = false;


  RegistResult? registResult;
  FToast? fToast;

  Future CheckUserConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');

      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        setState(() {
          ActiveConnection = true;
        });
      }
    } on SocketException catch (_) {
      setState(() {
        ActiveConnection = false;
    
      });
    }
  }

  @override
  void initState() {
    super.initState();

    fToast = FToast();
    fToast?.init(context);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundSignUpScreen(
      child: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          signUpText(),
          svgPicture(),
          emailField(),
          passwordField(),
          btnSignUp(),
          sizedBox(),
          alreadyHaveAccountCheck()
        ]),
      ),
    );
  }

  Text signUpText() {
    return const Text(
      'SIGN UP',
      style: TextStyle(fontWeight: FontWeight.bold),
    );
  }

  SvgPicture svgPicture() {
    Size size = MediaQuery.of(context).size;

    return SvgPicture.asset(
      'assets/icons/signup.svg',
      width: size.width * 0.70,
    );
  }

  RoundedInputField emailField() {
    return RoundedInputField(
        hintText: 'Your Email',
        controller: emailController,
        onChanged: (value) {
          _email = emailController.text.trim();
        });
  }

  RoundedPasswordField passwordField() {
    return RoundedPasswordField(
        hintText: 'Your Password',
        controller: passwordController,
        onChanged: (value) {
          _password = passwordController.text.trim();
        });
  }

  RoundedButton btnSignUp() => RoundedButton(
      text: 'SIGN UP',
      press: () {
        _doRegister();
      });

  SizedBox sizedBox() {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.02,
    );
  }

  AlreadyHaveAccountCheck alreadyHaveAccountCheck() {
    return AlreadyHaveAccountCheck(
      press: () {
        Navigator.of(context).push(_loginScreen());
      },
      login: false,
    );
  }


// TODO 7 : Register Logic
// Cek koneksi internet: ActiveConnection == false -> tampilkan error
  // Check "error" dari API response
  // Error = NULL -> DashBoardSCreen
  // ELSE -> Tampilkan kesalahan
  void _doRegister() {
    CheckUserConnection();

    if (ActiveConnection) {
      buildProgressndicator(context);
      RegistResult.register(_email, _password).then((value) {
        registResult = value;
        if (registResult?.error == null) {
          logger.d("${registResult?.message}, ${registResult?.data?.email}");

          _showToast("Pendaftaran berhasil", Colors.greenAccent, Icons.check);

          Navigator.of(context).push(_loginScreen());
        } else {
          Navigator.pop(context);
          _showToast("Ups, ada yang salah", Colors.red, Icons.cancel);
        }
      });
    } else {
      //Navigator.pop(context);
      _showToast("Ups, Koneksi bermasalah", Colors.red, Icons.error);
    }
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

  _showToast(String msg, Color color, IconData icon) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: color,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon),
          const SizedBox(
            width: 12.0,
          ),
          Text(msg),
        ],
      ),
    );

    fToast?.showToast(
      child: toast,
      gravity: ToastGravity.TOP,
      toastDuration: const Duration(seconds: 3),
    );
  }
}
