import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teledentistry_app/screens/dashboard/components/dashboard_body.dart';
import 'package:teledentistry_app/utils/helper.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    token();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: DashboardBody(),
      ),
    );
  }


  // Get token access
  token() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token_access');
    logger.d(token);

    setState(() {
      //_token = prefs.getString('token_access');
    });
  }

  
}
