import 'package:flutter/material.dart';
import 'package:teledentistry_app/utils/constants.dart';

class TitleDashboardWidget extends StatelessWidget {
  const TitleDashboardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.blue,
      width: MediaQuery.of(context).size.width,
      margin: null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Selamat Datang!',
            style: TextStyle(
              color: Color(0xff9e9d9d),
              fontSize: 12,
              fontFamily: 'Nunito',
              fontWeight: FontWeight.w600,
            ),
          ),
          textWithColor(),
        ],
      ),
    );
  }

  RichText textWithColor() {
    return RichText(
      text: TextSpan(
        children: [
          _textSpan('Deteksi ', Colors.black),
          _textSpan('Keluhanmu\n', kPrimaryColor),
          _textSpan('Sekarang', Colors.black),
        ],
      ),
    );
  }

  TextSpan _textSpan(String text, Color color) {
    return TextSpan(
      text: text,
      style: TextStyle(
        fontSize: 24,
        fontFamily: "Nunito",
        fontWeight: FontWeight.w700,
        color: color,
      ),
    );
  }
}
