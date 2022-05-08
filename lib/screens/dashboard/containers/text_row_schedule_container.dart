import 'package:flutter/material.dart';
import 'package:teledentistry_app/screens/dashboard/pages/schedule_page.dart';

class TextRowScheduleContainer extends StatelessWidget {
  final String title;
  final String textClicked;

  const TextRowScheduleContainer({
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
        // const Spacer(),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) => const SchedulePage())));
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
