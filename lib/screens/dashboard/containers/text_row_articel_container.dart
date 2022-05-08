import 'package:flutter/material.dart';
import 'package:teledentistry_app/screens/dashboard/widgets/schedule/schedule_widget.dart';

class TextRowArticelContainer extends StatelessWidget {
  final String title;
  final String textClicked;

  const TextRowArticelContainer({
    Key? key,
    required this.title,
    required this.textClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontFamily: "Nunito",
            fontWeight: FontWeight.w700,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) => const ScheduleWidget())));
          },
          child: Text(
            textClicked,
            style: const TextStyle(
              color: Color(0xffccc0da),
              fontSize: 10,
              fontFamily: "Nunito",
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
