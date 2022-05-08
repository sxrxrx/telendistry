import 'package:flutter/material.dart';
import 'package:teledentistry_app/screens/dashboard/containers/schedule_card_container.dart';
import 'package:teledentistry_app/screens/dashboard/containers/text_row_schedule_container.dart';
import 'package:teledentistry_app/utils/constants.dart';

class ScheduleDashboardWidget extends StatelessWidget {
  const ScheduleDashboardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.amber,
      width: double.infinity,
      margin: const EdgeInsets.all(0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Flexible(
            flex: 1,
            child: TextRowScheduleContainer(
              title: 'Jadwal Dokter',
              textClicked: 'Lihat semua >',
            ),
          ),
          const SizedBox(height: 7),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: const [
                ScheduleCardContainer(
                  doctorName: doctorMunifahName,
                  doctorPhoto: doctorMunifahPhoto,
                ),
                SizedBox(
                  width: 16,
                ),
                ScheduleCardContainer(
                  doctorName: doctorHerwandaName,
                  doctorPhoto: doctorHerwandaPhoto,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
