import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teledentistry_app/screens/dashboard/widgets/profile/components/profile_picture.dart';
import 'package:teledentistry_app/screens/login/login_screen.dart';
import 'package:teledentistry_app/utils/helper.dart';

import 'components/profile_menu.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(left: 20, top: 35, right: 20),
      width: double.infinity,
      height: double.infinity,
      //color: Colors.blue,
      child: Column(
        children: [
          const ProfilePicture(),
          const SizedBox(height: 20),
          ProfileMenu(
            text: "My Account",
            icon: "assets/icons/user_icon.svg",
            press: () => {},
          ),
          ProfileMenu(
            text: "Settings",
            icon: "assets/icons/settings.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Help Center",
            icon: "assets/icons/question_mark.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/icons/log_out.svg",
            //debug this
            press: () {
              buildAlertDialog(context);
            },
          ),
        ],
      ),
    );
  }

  buildAlertDialog(BuildContext context) {
    bool isLoading = false;
    final cancelBtn = TextButton(
        onPressed: () {
          Navigator.pop(context, "Cancel");
        },
        child: const Text("Tidak"));
    final okBtn = TextButton(
        onPressed: () async {
          try {
            await logout();
          } catch (e) {}

          setState(() {});
        },
        child: const Text("Ya"));

    final alertDialog = AlertDialog(
      //title: const Text("Alert Dialog"),
      content: const Text("Apakah anda ingin keluar?"),
      actions: [cancelBtn, okBtn],
    );

    showDialog(context: context, builder: (context) => alertDialog);
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

  Future logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    Navigator.pushReplacement(context, _loginScreen());

    setState(() {
      prefs.remove("token_access");
      logger.d("login token: ");
    });
  }
}
