import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:teledentistry_app/screens/dashboard/dashboard_screen.dart';
import 'package:teledentistry_app/screens/welcome/welcome_screen.dart';
import 'package:teledentistry_app/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? _token;

  @override
  void initState() {
    super.initState();
    isLoggedIn();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Teledentistry',
        theme: ThemeData(
            primaryColor: kPrimaryColor, scaffoldBackgroundColor: Colors.white),
        home:
        // TODO 3 : isLoggedIn ? TRUE -> DashboardScreen, FALSE -> WelcomeScreen
            _token != null ? const DashboardScreen() : const WelcomeScreen(),
        );
  }

// TODO 2 : Cek User pernah login atau belum
  isLoggedIn() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      _token = prefs.getString("token_access");
    });
  }
}
