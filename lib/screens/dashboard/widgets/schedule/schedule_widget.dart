import 'package:flutter/material.dart';
import 'package:teledentistry_app/screens/dashboard/containers/schedule_card_container.dart';
import 'package:teledentistry_app/utils/constants.dart';

class ScheduleWidget extends StatelessWidget {
  const ScheduleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.red,
      margin: const EdgeInsets.only(left: 20, top: 6, right: 20),
      child: Column(
        children: const [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Semua Jadwal',
              style: TextStyle(
                fontSize: 24,
                fontFamily: "Nunito",
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          ScheduleCardContainer(
            doctorName: doctorMunifahName,
            doctorPhoto: doctorMunifahPhoto,
          ),
          SizedBox(
            height: 8,
          ),
          ScheduleCardContainer(
            doctorName: doctorHerwandaName,
            doctorPhoto: doctorHerwandaPhoto,
          ),
        ],
      ),
    );
  }
}
