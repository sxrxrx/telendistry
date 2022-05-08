import 'package:flutter/material.dart';
import 'package:teledentistry_app/utils/constants.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback press;
  final Color backgroundColor, textColor;

  const RoundedButton({
    Key? key,
    required this.text,
    required this.press,
    this.backgroundColor = kPrimaryColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      backgroundColor: backgroundColor,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
    );

    Size size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: TextButton(
          onPressed: press,
          child: Text(text, style: TextStyle(color: textColor)),
          style: flatButtonStyle,
        ),
      ),
    );
  }
}
