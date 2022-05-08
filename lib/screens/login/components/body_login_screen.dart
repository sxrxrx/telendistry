import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teledentistry_app/components/already_have_account_check.dart';
import 'package:teledentistry_app/components/rounded_button.dart';
import 'package:teledentistry_app/components/rounded_input_field.dart';
import 'package:teledentistry_app/components/rounded_password_field.dart';
import 'package:teledentistry_app/data/login_model_result.dart';
import 'package:teledentistry_app/screens/dashboard/dashboard_screen.dart';
import 'package:teledentistry_app/screens/login/components/background_login_screen.dart';
import 'package:teledentistry_app/screens/signup/signup_screen.dart';
import 'package:teledentistry_app/utils/constants.dart';
import 'package:teledentistry_app/utils/helper.dart';

class BodyLoginScreen extends StatefulWidget {
  const BodyLoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<BodyLoginScreen> createState() => _BodyLoginScreenState();
}

class _BodyLoginScreenState extends State<BodyLoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  late String _email;
  late String _password;
  LoginResult? loginResult;
  var ActiveConnection = false;

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
    return BackgroundLoginScreen(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            loginTitle(),
            sizedBox(),
            svgPicture(),
            sizedBox(),
            emailField(),
            passwordField(),
            btnLogin(),
            sizedBox(),
            alreadyHaveAccountCheck()
          ],
        ),
      ),
    );
  }

  Text loginTitle() {
    return const Text(
      'LOGIN',
      style: TextStyle(fontWeight: FontWeight.bold),
    );
  }

  SizedBox sizedBox() {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.03,
    );
  }

  SvgPicture svgPicture() {
    Size size = MediaQuery.of(context).size;
    return SvgPicture.asset(
      'assets/icons/login.svg',
      height: size.height * 0.25,
    );
  }

  RoundedInputField emailField() {
    return RoundedInputField(
      hintText: 'Your Email',
      controller: emailController,
      onChanged: (value) {
        _email = emailController.text.trim();
      },
    );
  }

  RoundedPasswordField passwordField() {
    return RoundedPasswordField(
      hintText: 'Password',
      controller: passwordController,
      onChanged: (value) {
        _password = passwordController.text.trim();
      },
    );
  }

  RoundedButton btnLogin() {
    return RoundedButton(
        text: 'LOGIN',
        press: () {
          //_startLoading();
          _doLogin();
        });
  }

  AlreadyHaveAccountCheck alreadyHaveAccountCheck() {
    return AlreadyHaveAccountCheck(
      press: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const SignUpScreen();
        }));
      },
    );
  }

  // TODO 6: Login Logic
  // Cek koneksi internet: ActiveConnection == false -> tampilkan error
  // Check "error" dari API response
  // NULL -> DashBoardSCreen
  // ELSE -> Tampilkan kesalahan
  void _doLogin() {
    CheckUserConnection();

    if (ActiveConnection) {
      LoginResult.login(_email, _password).then((value) {
        loginResult = value;
        if (loginResult?.error == null) {
          logger.d("login token: ${loginResult?.data?.access.toString()}");
          setToken(loginResult?.data?.access.toString());
          Navigator.of(context).push(_dashboardScreen());
        } else {
          Navigator.pop(context);
          _showToast("Email/password salah", Colors.red, Icons.cancel);
        }
      });

      buildProgressndicator(context);
    } else {
      //Navigator.pop(context);
      _showToast("Ups, Koneksi bermasalah", Colors.red, Icons.error);
    }
  }

  void setToken(String? token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token_access', token!);
  }

  Route _dashboardScreen() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const DashboardScreen(),
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
