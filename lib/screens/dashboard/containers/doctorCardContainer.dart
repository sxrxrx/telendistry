import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:teledentistry_app/screens/dashboard/pages/doctor_profile_page.dart';
import 'package:teledentistry_app/utils/constants.dart';

class DoctorCardContainer extends StatelessWidget {
  final String? doctorName;
  final String? doctorPhoto;

  const DoctorCardContainer({
    Key? key,
    required this.doctorName,
    required this.doctorPhoto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(0),
      width: MediaQuery.of(context).size.width,
      height: 78,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 2,
            child: Container(
              //color: Colors.red,
              margin: const EdgeInsets.only(
                  left: 10, top: 15, bottom: 15, right: 10),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child:  CircleAvatar(
                      backgroundImage: AssetImage(doctorPhoto!),
                    ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Flexible(
                    flex: 2,
                    child: Container(
                      margin: const EdgeInsets.all(0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            flex: 2,
                            child: AutoSizeText(
                              doctorName!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontFamily: "Nunito",
                                fontWeight: FontWeight.w700,
                              ),
                              minFontSize: 9,
                            ),
                          ),
                          const SizedBox(height: 2),
                          const Flexible(
                            child: AutoSizeText(
                              "Dokter Gigi",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontFamily: "Nunito",
                                fontWeight: FontWeight.w600,
                              ),
                              minFontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(
              //color: Colors.green,
              margin: const EdgeInsets.all(15),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DoctorProfilePage(
                                name: doctorName,
                                photo: doctorPhoto,
                              )));
                },
                child: const AutoSizeText(
                  'Profil Dokter',
                  minFontSize: 10,
                  maxLines: 1,
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: kSecondPrimaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
