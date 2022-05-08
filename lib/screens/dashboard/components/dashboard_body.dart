import 'package:flutter/material.dart';
import 'package:teledentistry_app/screens/dashboard/widgets/camera/scanning_widget.dart';
import 'package:teledentistry_app/screens/dashboard/widgets/home/home_widget.dart';
import 'package:teledentistry_app/screens/dashboard/widgets/profile/profile.dart';
import 'package:teledentistry_app/screens/dashboard/widgets/schedule/schedule_widget.dart';
import 'package:teledentistry_app/utils/constants.dart';


// TODO 8 : Class Handle widget Home, Scanning, Schedule, Profile
// using bottomNavigation

class DashboardBody extends StatefulWidget {
  const DashboardBody({Key? key}) : super(key: key);

  @override
  State<DashboardBody> createState() => _DashboardBodyState();
}

class _DashboardBodyState extends State<DashboardBody> {
  int _currentIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  // static const TextStyle styleOption =
  //     TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  final List<Widget> _listWidget = <Widget>[
    const HomeWidget(),
    const ScanningWidget(),
    const ScheduleWidget(),
    const ProfileWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        },
        children: [
          _listWidget.elementAt(0),
          _listWidget.elementAt(1),
          _listWidget.elementAt(2),
          _listWidget.elementAt(3),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: kPrimaryColor,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.camera_outlined,
            ),
            label: 'Scanning',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.schedule_outlined,
            ),
            label: 'Schedule',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_rounded,
            ),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          _pageController.animateToPage(index,
              duration: const Duration(milliseconds: 500), curve: Curves.ease);
        },
        currentIndex: _currentIndex,
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: Colors.black54,
      ),
    );
  }
}
