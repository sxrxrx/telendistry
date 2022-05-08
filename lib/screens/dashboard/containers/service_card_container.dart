import 'package:flutter/material.dart';

class ServiceCardContainer extends StatelessWidget {
  final String? imgResource;
  final String? title;
  final String? description;

  const ServiceCardContainer({
    Key? key,
    required this.imgResource,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(0),
      width: 155,
      height: 144,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0x49c4c4c4),
          width: 1,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x146e34a5),
            blurRadius: 11,
            offset: Offset(0, 4),
          ),
        ],
        color: Colors.white,
      ),
      padding: const EdgeInsets.only(
        left: 14,
        right: 14,
        bottom: 14,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          iconContainer(),
          const SizedBox(height: 10),
          textContainer(
              title ?? '', const Color(0xff565656), 14, FontWeight.w700),
          const SizedBox(height: 8.50),
          textContainer(
              description ?? '', const Color(0xffccc0da), 10, FontWeight.w600),
        ],
      ),
    );
  }

  Text textContainer(String text, Color color, double? textFontSize,
      FontWeight? textFontWeight) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: textFontSize,
        fontFamily: "Nunito",
        fontWeight: textFontWeight,
      ),
    );
  }

  Container iconContainer() {
    return Container(
      width: 70,
      height: 70,
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Image.asset(
        imgResource ?? '',
      ),
    );
  }
}
