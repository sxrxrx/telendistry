import 'package:flutter/material.dart';
import 'package:teledentistry_app/screens/dashboard/containers/schedule_card_container.dart';
import 'package:teledentistry_app/utils/constants.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(left: 20, top: 50, right: 20),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Row(
                children: [
                  GestureDetector(
                    child: const Icon(Icons.arrow_back),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(
                    width: 14,
                  ),
                  const Text(
                    'Semua Jadwal',
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: "Nunito",
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const ScheduleCardContainer(
              doctorName: doctorMunifahName,
              doctorPhoto: doctorMunifahPhoto,
            ),
            const SizedBox(
              width: 8,
            ),
            const ScheduleCardContainer(
              doctorName: doctorHerwandaName,
              doctorPhoto: doctorHerwandaPhoto,
            ),
          ],
        ),
      ),
    );
  }
}
