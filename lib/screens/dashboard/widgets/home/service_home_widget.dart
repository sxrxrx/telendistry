import 'package:flutter/material.dart';
import 'package:teledentistry_app/screens/dashboard/containers/service_card_container.dart';
import 'package:teledentistry_app/screens/dashboard/pages/consultation_page.dart';
import 'package:teledentistry_app/screens/dashboard/pages/self_scanning_page.dart';

import 'package:teledentistry_app/utils/constants.dart';

class ServiceDashboardWidget extends StatelessWidget {
  const ServiceDashboardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      //color: Colors.green,
      margin: const EdgeInsets.all(0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const SelfScanningPage())));
              },
              child: const ServiceCardContainer(
                title: 'Deteksi Gigi',
                description: 'Cek diri anda',
                imgResource: screeningImgResource,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const ConsultationPage())));
              },
              child: const ServiceCardContainer(
                imgResource: consultationImgResource,
                title: 'Konsultasi',
                description: "Tanya dokter",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
