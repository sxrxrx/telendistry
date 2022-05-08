import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:teledentistry_app/utils/constants.dart';

class DoctorProfilePage extends StatelessWidget {
  final String? name;
  final String? photo;
  const DoctorProfilePage({Key? key, required this.name, required this.photo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            doctorProfileCard(size),
            const SizedBox(
              height: 12,
            ),
            Flexible(flex: 2, child: aboutDoctor(size)),
            const SizedBox(
              height: 12,
            ),
            Flexible(flex: 2, child: doctorSchedule(size))
          ],
        ),
      ),
    );
  }

  Container doctorProfileCard(Size size) {
    return Container(
      width: size.width,
      height: 170,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(0),
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
        color: kPrimaryColor,
      ),
      child: Container(
        //color: Colors.green,
        margin: const EdgeInsets.fromLTRB(15, 35, 15, 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            doctorProfile(),
            const SizedBox(
              height: 10,
            ),
            btnConsultation()
          ],
        ),
      ),
    );
  }

  Container doctorProfile() {
    return Container(
      //color: Colors.blue,
      margin: const EdgeInsets.only(top: 15),
      child: Row(
        children: [
          Flexible(
            child: Container(
              width: 44,
              height: 44,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: CircleAvatar(
                backgroundImage: AssetImage(photo!),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Flexible(
            flex: 2,
            child: Container(
              margin: const EdgeInsets.all(0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name!,
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
            ),
          )
        ],
      ),
    );
  }

  btnConsultation() {
    return ElevatedButton(
      onPressed: () {},
      child: const Text('Konsultasi'),
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        onPrimary: kSecondPrimaryColor,
      ),
    );
  }

  Container aboutDoctor(Size size) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 10, 20, 15),
      width: size.width,
      height: 63,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Flexible(
            child: AutoSizeText(
              "Tentang Dokter",
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: "Nunito",
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(height: 12),
          Flexible(
            flex: 2,
            child: AutoSizeText(
              "Drg. Anas Malik merupakan seorang dokter spesialis gigi yang sudah bekerja selama 10 tahun. ",
              style: TextStyle(
                color: Color(0xff9e9d9d),
                fontSize: 13,
              ),
              minFontSize: 10,
            ),
          ),
        ],
      ),
    );
  }

  Container doctorSchedule(Size size) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 10, 20, 15),
      width: size.width,
      height: 63,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Flexible(
            child: AutoSizeText(
              "Jadwal Dokter",
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: "Nunito",
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Flexible(
            flex: 2,
            child: Container(
              margin: const EdgeInsets.all(0),
              width: size.width,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Flexible(
                    flex: 2,
                    child: AutoSizeText(
                      "12 Maret 2021 Pukul 09.00 - 10.00 WIB",
                      style: TextStyle(
                        color: Color(0xff9e9d9d),
                        fontSize: 13,
                        fontFamily: "Nunito",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(height: 3),
                  Flexible(
                    flex: 2,
                    child: AutoSizeText(
                      "Klinik Gigi, Jl. Lingkar kampus",
                      style: TextStyle(
                        color: Color(0xff9e9d9d),
                        fontSize: 11,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
