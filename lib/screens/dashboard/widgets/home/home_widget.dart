import 'package:flutter/material.dart';
import 'package:teledentistry_app/screens/dashboard/widgets/home/articel_home_widget.dart';
import 'package:teledentistry_app/screens/dashboard/widgets/home/schedule_home_widget.dart';
import 'package:teledentistry_app/screens/dashboard/widgets/home/service_home_widget.dart';
import 'package:teledentistry_app/screens/dashboard/widgets/home/title_home_widget.dart';


// TODO 9: Class handle semua komponen di HomeWddget
class HomeWidget extends StatelessWidget {
  const HomeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(top: 12),
      width: 0,
      height: size.height,
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: Column(
            children: const [
              TitleDashboardWidget(),
              SizedBox(
                height: 24,
              ),
              ServiceDashboardWidget(),
              SizedBox(
                height: 24,
              ),
              ScheduleDashboardWidget(),
              SizedBox(
                height: 24,
              ),
              ArticelDashboardWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
