import 'package:flutter/material.dart';
import 'package:teledentistry_app/screens/dashboard/pages/doctor_profile_page.dart';
import 'package:teledentistry_app/utils/constants.dart';

class ScheduleCardContainer extends StatelessWidget {
  final String? doctorPhoto;
  final String? doctorName;

  const ScheduleCardContainer(
      {Key? key, required this.doctorPhoto, required this.doctorName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DoctorProfilePage(
                      name: doctorName,
                      photo: doctorPhoto,
                    )));
      },
      child: Container(
        margin: const EdgeInsets.all(0),
        width: 320,
        height: 137,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 10, top: 15),
              child: Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(doctorPhoto!),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    margin: const EdgeInsets.all(0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          doctorName!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: "Nunito",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 2),
                        const Text(
                          "Dokter Gigi",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontFamily: "Nunito",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            Container(
              width: 276,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: kSecondPrimaryColor,
              ),
              padding: const EdgeInsets.all(9),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "12 Maret 2021 Pukul 09.00 - 10.00 WIB",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: "Nunito",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    "Klinik Gigi, Jl. Lingkar kampus",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
