import 'package:flutter/material.dart';
import 'package:teledentistry_app/screens/dashboard/containers/doctorCardContainer.dart';
import 'package:teledentistry_app/utils/constants.dart';

class ConsultationPage extends StatelessWidget {
  const ConsultationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(left: 20, top: 12, right: 20),
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
                      'Dokter Tersedia',
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
              const DoctorCardContainer(
                doctorName: doctorMunifahName,
                doctorPhoto: doctorMunifahPhoto,
              ),
              const SizedBox(
                height: 8,
              ),
              const DoctorCardContainer(
                doctorName: doctorHerwandaName,
                doctorPhoto: doctorHerwandaPhoto,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
